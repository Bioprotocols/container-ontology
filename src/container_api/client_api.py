"""
This module contains an API that can be used to find containers that match a given
specification -- an OWL (anonymous) class definition in Manchester syntax -- by
consulting a server (implemented using Owlery).
"""

__all__ = []

import owlery_client

from typing import List

from owlery_client.api import dl_queries_api


URL = str # typing alias

def matching_containers(container_spec, prefix_map="", base_url='http://localhost', kb_name='sd2e-container-catalogs') -> List[URL]:
    configuration = owlery_client.Configuration(
        host=base_url
    )
    with owlery_client.ApiClient() as api_client:
        api_instance = dl_queries_api.DLQueriesApi(api_client)
        kb = kb_name # str | label for a knowledgebase in this Owlery
        object = container_spec  # str | Manchester-syntax OWL class expression
        prefixes = prefix_map  # str | JSON format prefix map (optional)
        direct = False  # bool |  (optional) if omitted the server will use the default value of True
        include_deprecated = True  # bool | Include `owl:deprecated` terms in the result (optional) if omitted the server will use the default value of True

        try:
            instances = api_instance.kbs_kb_instances_get(kb, object, prefixes=prefixes, direct=direct,
                                              include_deprecated=include_deprecated)
        except owlery_client.ApiException as e:
            print("Exception when calling DLQueriesApi->kbs_kb_instances_get: %s\n" % e)
    return instances