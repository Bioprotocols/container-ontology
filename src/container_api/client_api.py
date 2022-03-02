"""
This module contains an API that can be used to find containers that match a given
specification -- an OWL (anonymous) class definition in Manchester syntax -- by
consulting a server (implemented using Owlery).
"""

__all__ = ["matching_containers", "strateos_id", "ContainerSpec"]

import html
import logging
import re

from json import dumps, loads
from rdflib import Namespace

import owlery_client

from os.path import basename
from typing import List, Optional, Dict

from owlery_client.api import dl_queries_api


URL = str  # typing alias

logger = logging.getLogger("container_ontology.client_api")

CONT_NS = Namespace("https://sift.net/container-ontology/container-ontology#")
OM_NS = Namespace("http://www.ontology-of-units-of-measure.org/resource/om-2/")

DEFAULT_PREFIX_MAP = {"cont": CONT_NS, "om": OM_NS}

class ContainerSpec:
    queryString: str
    _prefixMap: Dict[str, str]
    addl_conditions: Optional[str]
    
    def __init__(self, queryString: str, prefixMap: Dict[str, str] = DEFAULT_PREFIX_MAP, addl_conditions: Optional[str] = None):
        self.queryString = queryString
        self._prefixMap = prefixMap
        self.addl_conditions = addl_conditions

    @property
    def prefixMap(self) -> str:
        return dumps(self._prefixMap)
        



def matching_containers(
    container_spec: ContainerSpec,
    base_url="http://localhost:8080",
    kb_name="sd2e-container-catalogs",
) -> List[URL]:
    return _mc_helper(
        container_spec=container_spec.queryString,
        prefix_map=container_spec.prefixMap,
        addl_conditions=container_spec.addl_conditions,
        base_url=base_url,
        kb_name=kb_name,
    )


PREFIX_SPLITTER = re.compile(".*#(.*)")
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

if hasattr(str, 'removeprefix'):
    def remove_prefix(string: str, prefix: str) -> str:
        return string.removeprefix(prefix)
else:
    def remove_prefix(text, prefix):
        if text.startswith(prefix):
            return text[len(prefix):]
        return text  # or whatever



def strateos_id(uri: str) -> str:
    suffix = basename(uri)
    vendor_and_id = re.match(PREFIX_SPLITTER, suffix).group(1)
    x: str
    for x in VENDOR_STRINGS:
        trimmed = remove_prefix(vendor_and_id, x)
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
    logger.debug("Query string is: %s", container_spec)
    logger.debug("Prefix map string is: %s", prefix_map)
    logger.debug("Prefix map is: %s", loads(prefix_map))
    if addl_conditions is not None:
        logger.debug("Additional conditions are: %s", addl_conditions)
    else:
        logger.debug("No additional conditions.")
        
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
            raise e
    logger.debug("Instances are %s", instances)
    logger.debug("Returning %s", instances["has_instance"])
    return instances["has_instance"]
