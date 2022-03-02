"""
This module contains an API that can be used to find containers that match a given
specification -- an OWL (anonymous) class definition in Manchester syntax -- by
consulting a server (implemented using Owlery).
"""

__all__ = ["matching_containers", "strateos_id"]

import html
import logging
import re

import owlery_client

from os.path import basename
from typing import List, Optional

from owlery_client.api import dl_queries_api


URL = str  # typing alias

logger = logging.getLogger("container_ontology.client_api")


def matching_containers(
    container_spec,
    base_url="http://localhost:8080",
    kb_name="sd2e-container-catalogs",
    addl_conditions: Optional[str] = None,
) -> List[URL]:
    return _mc_helper(
        container_spec=container_spec.queryString,
        prefix_map=container_spec.prefixMap,
        addl_conditions=addl_conditions,
        base_url=base_url,
        kb_name=kb_name,
    )


PREFIX_SPLITER = re.compile(".*#(.*)")
VENDOR_STRINGS = [
    html.escape(x).replace(" ", "%20")
    for x in [
        "Fisher",
        "ThermoFisher",
        "Eppendorf",
        "Costar",
        "USA Scientific",
        "Mesoscale",
        "Chemspeed",
        "E&K Scientific",
        "Sumitomo Bakelite Co.",
        "PerkinElmer",
        "Labcyte",
        "Greiner",
        "Corning",
        "Axygen",
        "Tradewinds",
    ]
]


def strateos_id(uri: str) -> str:
    suffix = basename(uri)
    vendor_and_id = re.match(PREFIX_SPLITER, suffix).group(1)
    x: str
    for x in VENDOR_STRINGS:
        trimmed = vendor_and_id.removeprefix(x)
        if trimmed != vendor_and_id:
            return trimmed
    raise ValueError(f"Unable to extract a strateos ID from {uri}")


def _mc_helper(
    *,
    container_spec,
    prefix_map,
    addl_conditions: Optional[str] = None,
    base_url="http://localhost:8080",
    kb_name="sd2e-container-catalogs",
) -> List[URL]:
    configuration = owlery_client.Configuration(host=base_url)
    instances: Optional[List[str]] = None
    with owlery_client.ApiClient(configuration) as api_client:
        api_instance = dl_queries_api.DLQueriesApi(api_client)
        kb = kb_name  # str | label for a knowledgebase in this Owlery
        object = container_spec
        if addl_conditions is not None:
            object += (
                " and " + addl_conditions
            )  # str | Manchester-syntax OWL class expression
        prefixes = prefix_map  # str | JSON format prefix map (optional)
        direct = False  # bool |  (optional) if omitted the server will use the default value of True
        include_deprecated = True  # bool | Include `owl:deprecated` terms in the result (optional) if omitted the server will use the default value of True

        try:
            instances = api_instance.kbs_kb_instances_get(
                kb,
                object,
                prefixes=prefixes,
                direct=direct,
                include_deprecated=include_deprecated,
            )
        except owlery_client.ApiException as e:
            logger.error(
                "Exception when calling DLQueriesApi->kbs_kb_instances_get: %s\n" % e
            )
    logger.debug("Instances are %s", instances)
    logger.debug("Returning %s", instances["has_instance"])
    return instances["has_instance"]



