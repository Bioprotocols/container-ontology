# owlery_client.SPARQLApi

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**kbs_kb_expand_get**](SPARQLApi.md#kbs_kb_expand_get) | **GET** /kbs/{kb}/expand | Expand SPARQL query encoded in URL parameter
[**kbs_kb_expand_post**](SPARQLApi.md#kbs_kb_expand_post) | **POST** /kbs/{kb}/expand | Expand SPARQL query contained in request body
[**kbs_kb_sparql_get**](SPARQLApi.md#kbs_kb_sparql_get) | **GET** /kbs/{kb}/sparql | Perform SPARQL query encoded in URL parameter
[**kbs_kb_sparql_post**](SPARQLApi.md#kbs_kb_sparql_post) | **POST** /kbs/{kb}/sparql | Perform SPARQL query contained in request body


# **kbs_kb_expand_get**
> kbs_kb_expand_get(kb, query)

Expand SPARQL query encoded in URL parameter

Expand a SPARQL query, transforming Owlet-style embedded class expressions into `FILTER`s

### Example

```python
import time
import owlery_client
from owlery_client.api import sparql_api
from pprint import pprint
# Defining the host is optional and defaults to http://localhost
# See configuration.py for a list of all supported configuration parameters.
configuration = owlery_client.Configuration(
    host = "http://localhost"
)


# Enter a context with an instance of the API client
with owlery_client.ApiClient() as api_client:
    # Create an instance of the API class
    api_instance = sparql_api.SPARQLApi(api_client)
    kb = "kb_example" # str | label for a knowledgebase in this Owlery
    query = "query_example" # str | SPARQL query

    # example passing only required values which don't have defaults set
    try:
        # Expand SPARQL query encoded in URL parameter
        api_instance.kbs_kb_expand_get(kb, query)
    except owlery_client.ApiException as e:
        print("Exception when calling SPARQLApi->kbs_kb_expand_get: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **kb** | **str**| label for a knowledgebase in this Owlery |
 **query** | **str**| SPARQL query |

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/sparql-query


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Expanded SPARQL query |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **kbs_kb_expand_post**
> kbs_kb_expand_post(kb, body)

Expand SPARQL query contained in request body

Expand a SPARQL query, transforming Owlet-style embedded class expressions into `FILTER`s

### Example

```python
import time
import owlery_client
from owlery_client.api import sparql_api
from pprint import pprint
# Defining the host is optional and defaults to http://localhost
# See configuration.py for a list of all supported configuration parameters.
configuration = owlery_client.Configuration(
    host = "http://localhost"
)


# Enter a context with an instance of the API client
with owlery_client.ApiClient() as api_client:
    # Create an instance of the API class
    api_instance = sparql_api.SPARQLApi(api_client)
    kb = "kb_example" # str | label for a knowledgebase in this Owlery
    body = "SELECT ?x WHERE { ?x a "blah"}" # str | 

    # example passing only required values which don't have defaults set
    try:
        # Expand SPARQL query contained in request body
        api_instance.kbs_kb_expand_post(kb, body)
    except owlery_client.ApiException as e:
        print("Exception when calling SPARQLApi->kbs_kb_expand_post: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **kb** | **str**| label for a knowledgebase in this Owlery |
 **body** | **str**|  |

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/sparql-query, application/x-www-form-urlencoded
 - **Accept**: Not defined


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | SPARQL results |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **kbs_kb_sparql_get**
> kbs_kb_sparql_get(kb, query)

Perform SPARQL query encoded in URL parameter

Perform SPARQL query using Owlet-style embedded class expression. This is not a complete SPARQL endpoint. It is for using Owlery as a federated query endpoint for a single Owlet triple pattern.

### Example

```python
import time
import owlery_client
from owlery_client.api import sparql_api
from pprint import pprint
# Defining the host is optional and defaults to http://localhost
# See configuration.py for a list of all supported configuration parameters.
configuration = owlery_client.Configuration(
    host = "http://localhost"
)


# Enter a context with an instance of the API client
with owlery_client.ApiClient() as api_client:
    # Create an instance of the API class
    api_instance = sparql_api.SPARQLApi(api_client)
    kb = "kb_example" # str | label for a knowledgebase in this Owlery
    query = "query_example" # str | SPARQL query

    # example passing only required values which don't have defaults set
    try:
        # Perform SPARQL query encoded in URL parameter
        api_instance.kbs_kb_sparql_get(kb, query)
    except owlery_client.ApiException as e:
        print("Exception when calling SPARQLApi->kbs_kb_sparql_get: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **kb** | **str**| label for a knowledgebase in this Owlery |
 **query** | **str**| SPARQL query |

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/sparql-results+xml


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | SPARQL results |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **kbs_kb_sparql_post**
> kbs_kb_sparql_post(kb, body)

Perform SPARQL query contained in request body

Perform SPARQL query using Owlet-style embedded class expression. This is not a complete SPARQL endpoint. It is for using Owlery as a federated query endpoint for a single Owlet triple pattern.

### Example

```python
import time
import owlery_client
from owlery_client.api import sparql_api
from pprint import pprint
# Defining the host is optional and defaults to http://localhost
# See configuration.py for a list of all supported configuration parameters.
configuration = owlery_client.Configuration(
    host = "http://localhost"
)


# Enter a context with an instance of the API client
with owlery_client.ApiClient() as api_client:
    # Create an instance of the API class
    api_instance = sparql_api.SPARQLApi(api_client)
    kb = "kb_example" # str | label for a knowledgebase in this Owlery
    body = "SELECT ?x WHERE { ?x a "blah"}" # str | 

    # example passing only required values which don't have defaults set
    try:
        # Perform SPARQL query contained in request body
        api_instance.kbs_kb_sparql_post(kb, body)
    except owlery_client.ApiException as e:
        print("Exception when calling SPARQLApi->kbs_kb_sparql_post: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **kb** | **str**| label for a knowledgebase in this Owlery |
 **body** | **str**|  |

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/sparql-query, application/x-www-form-urlencoded
 - **Accept**: Not defined


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | SPARQL results |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

