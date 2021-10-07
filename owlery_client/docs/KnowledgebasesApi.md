# owlery_client.KnowledgebasesApi

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**kbs_get**](KnowledgebasesApi.md#kbs_get) | **GET** /kbs | List available knowledgebases
[**kbs_kb_get**](KnowledgebasesApi.md#kbs_kb_get) | **GET** /kbs/{kb} | Knowledgebase


# **kbs_get**
> kbs_get()

List available knowledgebases

List names of available knowledgebases in this instance of Owlery

### Example

```python
import time
import owlery_client
from owlery_client.api import knowledgebases_api
from pprint import pprint
# Defining the host is optional and defaults to http://localhost
# See configuration.py for a list of all supported configuration parameters.
configuration = owlery_client.Configuration(
    host = "http://localhost"
)


# Enter a context with an instance of the API client
with owlery_client.ApiClient() as api_client:
    # Create an instance of the API class
    api_instance = knowledgebases_api.KnowledgebasesApi(api_client)

    # example, this endpoint has no required or optional parameters
    try:
        # List available knowledgebases
        api_instance.kbs_get()
    except owlery_client.ApiException as e:
        print("Exception when calling KnowledgebasesApi->kbs_get: %s\n" % e)
```


### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | knowledgebase names |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **kbs_kb_get**
> kbs_kb_get(kb)

Knowledgebase

Display Knowledgebase information and status

### Example

```python
import time
import owlery_client
from owlery_client.api import knowledgebases_api
from pprint import pprint
# Defining the host is optional and defaults to http://localhost
# See configuration.py for a list of all supported configuration parameters.
configuration = owlery_client.Configuration(
    host = "http://localhost"
)


# Enter a context with an instance of the API client
with owlery_client.ApiClient() as api_client:
    # Create an instance of the API class
    api_instance = knowledgebases_api.KnowledgebasesApi(api_client)
    kb = "uberon" # str | the knowledgebase name

    # example passing only required values which don't have defaults set
    try:
        # Knowledgebase
        api_instance.kbs_kb_get(kb)
    except owlery_client.ApiException as e:
        print("Exception when calling KnowledgebasesApi->kbs_kb_get: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **kb** | **str**| the knowledgebase name |

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | KB info |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

