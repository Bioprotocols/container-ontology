
# flake8: noqa

# Import all APIs into this package.
# If you have many APIs here with many many models used in each API this may
# raise a `RecursionError`.
# In order to avoid this, import only the API that you directly need like:
#
#   from .api.dl_queries_api import DLQueriesApi
#
# or import this package, but before doing it, use:
#
#   import sys
#   sys.setrecursionlimit(n)

# Import APIs into API package:
from owlery_client.api.dl_queries_api import DLQueriesApi
from owlery_client.api.knowledgebases_api import KnowledgebasesApi
from owlery_client.api.sparql_api import SPARQLApi
