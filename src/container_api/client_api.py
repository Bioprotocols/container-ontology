"""
This module contains an API that can be used to find containers that match a given
specification -- an OWL (anonymous) class definition in Manchester syntax -- by
consulting a server (implemented using Owlery).
"""

__all__ = ['matching_containers']

import logging

import owlery_client

from typing import List

from owlery_client.api import dl_queries_api


URL = str  # typing alias

logger = logging.getLogger("container_ontology.client_api")


def matching_containers(
    container_spec, base_url="http://localhost:8080", kb_name="sd2e-container-catalogs"
) -> List[URL]:
    return _mc_helper(
        container_spec=container_spec.queryString,
        prefix_map=container_spec.prefixMap,
        base_url=base_url,
        kb_name=kb_name,
    )


def _mc_helper(
    *,
    container_spec,
    prefix_map,
    base_url="http://localhost:8080",
    kb_name="sd2e-container-catalogs"
) -> List[URL]:
    configuration = owlery_client.Configuration(host=base_url)
    with owlery_client.ApiClient(configuration) as api_client:
        api_instance = dl_queries_api.DLQueriesApi(api_client)
        kb = kb_name  # str | label for a knowledgebase in this Owlery
        object = container_spec  # str | Manchester-syntax OWL class expression
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
            logger.error("Exception when calling DLQueriesApi->kbs_kb_instances_get: %s\n" % e)
    logger.debug("Instances are %s", instances)
    logger.debug("Returning %s", instances['has_instance'])
    return instances['has_instance']


if __name__ == "__main__":
    from json import dumps
    from rdflib import Namespace

    sub_logger = logging.getLogger("owlery_client.api_client")
    sub_logger.setLevel(logging.DEBUG)
    # the following urllib settings don't seem to do anything at all.
    request_logger = logging.getLogger('urllib3')
    request_logger.setLevel(logging.DEBUG)
    logger.setLevel(logging.DEBUG)
    logging.basicConfig(level=logging.DEBUG)

    CONT_NS = Namespace("https://sift.net/container-ontology/container-ontology#")
    OM_NS = Namespace("http://www.ontology-of-units-of-measure.org/resource/om-2/")
    # should also have a not flat well bottom condition.
    plate_spec = """cont:ClearPlate and 
     cont:SLAS-4-2004 and
     (cont:wellVolume some
            ((om:hasUnit value om:microlitre) and
             (om:hasNumericalValue only xsd:decimal[>= "200"^^xsd:decimal])))"""

    prefix_map = dumps({"cont": CONT_NS, "om": OM_NS})
    insts = _mc_helper(container_spec=plate_spec, prefix_map=prefix_map)
    print("List of matching instances is:")
    for inst in insts:
        print('\t' + inst)
