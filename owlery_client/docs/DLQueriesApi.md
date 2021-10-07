# owlery_client.DLQueriesApi

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**kbs_kb_equivalent_get**](DLQueriesApi.md#kbs_kb_equivalent_get) | **GET** /kbs/{kb}/equivalent | Equivalent classes
[**kbs_kb_instances_get**](DLQueriesApi.md#kbs_kb_instances_get) | **GET** /kbs/{kb}/instances | Instances
[**kbs_kb_satisfiable_get**](DLQueriesApi.md#kbs_kb_satisfiable_get) | **GET** /kbs/{kb}/satisfiable | Satisfiability
[**kbs_kb_subclasses_get**](DLQueriesApi.md#kbs_kb_subclasses_get) | **GET** /kbs/{kb}/subclasses | Subclasses
[**kbs_kb_superclasses_get**](DLQueriesApi.md#kbs_kb_superclasses_get) | **GET** /kbs/{kb}/superclasses | Superclasses
[**kbs_kb_types_get**](DLQueriesApi.md#kbs_kb_types_get) | **GET** /kbs/{kb}/types | Types


# **kbs_kb_equivalent_get**
> kbs_kb_equivalent_get(kb, object)

Equivalent classes

Get equivalent classes of a named class or class expression

### Example

```python
import time
import owlery_client
from owlery_client.api import dl_queries_api
from pprint import pprint
# Defining the host is optional and defaults to http://localhost
# See configuration.py for a list of all supported configuration parameters.
configuration = owlery_client.Configuration(
    host = "http://localhost"
)


# Enter a context with an instance of the API client
with owlery_client.ApiClient() as api_client:
    # Create an instance of the API class
    api_instance = dl_queries_api.DLQueriesApi(api_client)
    kb = "uberon" # str | label for a knowledgebase in this Owlery
    object = "<http://purl.obolibrary.org/obo/UBERON_0002101>" # str | Manchester-syntax OWL class expression
    prefixes = "{"obo": "http://purl.obolibrary.org/obo/", "part_of": "http://purl.obolibrary.org/obo/BFO_0000050"}" # str | JSON format prefix map, used to expand prefixes in the 'object' expression (optional)
    direct = True # bool |  (optional) if omitted the server will use the default value of True
    include_deprecated = True # bool | Include `owl:deprecated` terms in the result (optional) if omitted the server will use the default value of True

    # example passing only required values which don't have defaults set
    try:
        # Equivalent classes
        api_instance.kbs_kb_equivalent_get(kb, object)
    except owlery_client.ApiException as e:
        print("Exception when calling DLQueriesApi->kbs_kb_equivalent_get: %s\n" % e)

    # example passing only required values which don't have defaults set
    # and optional values
    try:
        # Equivalent classes
        api_instance.kbs_kb_equivalent_get(kb, object, prefixes=prefixes, direct=direct, include_deprecated=include_deprecated)
    except owlery_client.ApiException as e:
        print("Exception when calling DLQueriesApi->kbs_kb_equivalent_get: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **kb** | **str**| label for a knowledgebase in this Owlery |
 **object** | **str**| Manchester-syntax OWL class expression |
 **prefixes** | **str**| JSON format prefix map, used to expand prefixes in the &#39;object&#39; expression | [optional]
 **direct** | **bool**|  | [optional] if omitted the server will use the default value of True
 **include_deprecated** | **bool**| Include &#x60;owl:deprecated&#x60; terms in the result | [optional] if omitted the server will use the default value of True

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
**200** | equivalent classes |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **kbs_kb_instances_get**
> kbs_kb_instances_get(kb, object)

Instances

Get instances of a named class or class expression

### Example

```python
import time
import owlery_client
from owlery_client.api import dl_queries_api
from pprint import pprint
# Defining the host is optional and defaults to http://localhost
# See configuration.py for a list of all supported configuration parameters.
configuration = owlery_client.Configuration(
    host = "http://localhost"
)


# Enter a context with an instance of the API client
with owlery_client.ApiClient() as api_client:
    # Create an instance of the API class
    api_instance = dl_queries_api.DLQueriesApi(api_client)
    kb = "uberon" # str | label for a knowledgebase in this Owlery
    object = "object_example" # str | Manchester-syntax OWL class expression
    prefixes = "prefixes_example" # str | JSON format prefix map (optional)
    direct = True # bool |  (optional) if omitted the server will use the default value of True
    include_deprecated = True # bool | Include `owl:deprecated` terms in the result (optional) if omitted the server will use the default value of True

    # example passing only required values which don't have defaults set
    try:
        # Instances
        api_instance.kbs_kb_instances_get(kb, object)
    except owlery_client.ApiException as e:
        print("Exception when calling DLQueriesApi->kbs_kb_instances_get: %s\n" % e)

    # example passing only required values which don't have defaults set
    # and optional values
    try:
        # Instances
        api_instance.kbs_kb_instances_get(kb, object, prefixes=prefixes, direct=direct, include_deprecated=include_deprecated)
    except owlery_client.ApiException as e:
        print("Exception when calling DLQueriesApi->kbs_kb_instances_get: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **kb** | **str**| label for a knowledgebase in this Owlery |
 **object** | **str**| Manchester-syntax OWL class expression |
 **prefixes** | **str**| JSON format prefix map | [optional]
 **direct** | **bool**|  | [optional] if omitted the server will use the default value of True
 **include_deprecated** | **bool**| Include &#x60;owl:deprecated&#x60; terms in the result | [optional] if omitted the server will use the default value of True

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
**200** | instances |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **kbs_kb_satisfiable_get**
> kbs_kb_satisfiable_get(kb, object)

Satisfiability

Returns whether the given named class or expression is satisfiable

### Example

```python
import time
import owlery_client
from owlery_client.api import dl_queries_api
from pprint import pprint
# Defining the host is optional and defaults to http://localhost
# See configuration.py for a list of all supported configuration parameters.
configuration = owlery_client.Configuration(
    host = "http://localhost"
)


# Enter a context with an instance of the API client
with owlery_client.ApiClient() as api_client:
    # Create an instance of the API class
    api_instance = dl_queries_api.DLQueriesApi(api_client)
    kb = "uberon" # str | label for a knowledgebase in this Owlery
    object = "<http://purl.obolibrary.org/obo/UBERON_0002101>" # str | Manchester-syntax OWL class expression
    prefixes = "{"obo": "http://purl.obolibrary.org/obo/", "part_of": "http://purl.obolibrary.org/obo/BFO_0000050"}" # str | JSON format prefix map, used to expand prefixes in the 'object' expression (optional)

    # example passing only required values which don't have defaults set
    try:
        # Satisfiability
        api_instance.kbs_kb_satisfiable_get(kb, object)
    except owlery_client.ApiException as e:
        print("Exception when calling DLQueriesApi->kbs_kb_satisfiable_get: %s\n" % e)

    # example passing only required values which don't have defaults set
    # and optional values
    try:
        # Satisfiability
        api_instance.kbs_kb_satisfiable_get(kb, object, prefixes=prefixes)
    except owlery_client.ApiException as e:
        print("Exception when calling DLQueriesApi->kbs_kb_satisfiable_get: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **kb** | **str**| label for a knowledgebase in this Owlery |
 **object** | **str**| Manchester-syntax OWL class expression |
 **prefixes** | **str**| JSON format prefix map, used to expand prefixes in the &#39;object&#39; expression | [optional]

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
**200** | satisfiability |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **kbs_kb_subclasses_get**
> kbs_kb_subclasses_get(kb, object)

Subclasses

Get subclasses of a named class or class expression

### Example

```python
import time
import owlery_client
from owlery_client.api import dl_queries_api
from pprint import pprint
# Defining the host is optional and defaults to http://localhost
# See configuration.py for a list of all supported configuration parameters.
configuration = owlery_client.Configuration(
    host = "http://localhost"
)


# Enter a context with an instance of the API client
with owlery_client.ApiClient() as api_client:
    # Create an instance of the API class
    api_instance = dl_queries_api.DLQueriesApi(api_client)
    kb = "uberon" # str | label for a knowledgebase in this Owlery
    object = "<http://purl.obolibrary.org/obo/UBERON_0002101>" # str | Manchester-syntax OWL class expression
    prefixes = "{"obo": "http://purl.obolibrary.org/obo/", "part_of": "http://purl.obolibrary.org/obo/BFO_0000050"}" # str | JSON format prefix map, used to expand prefixes in the 'object' expression (optional)
    direct = True # bool |  (optional) if omitted the server will use the default value of True
    include_equivalent = False # bool | Also query for equivalent classes (optional) if omitted the server will use the default value of False
    include_nothing = False # bool | owl:Nothing is filtered by default because it is by definition a subclass of everything. (optional) if omitted the server will use the default value of False
    include_deprecated = True # bool | Include `owl:deprecated` terms in the result (optional) if omitted the server will use the default value of True

    # example passing only required values which don't have defaults set
    try:
        # Subclasses
        api_instance.kbs_kb_subclasses_get(kb, object)
    except owlery_client.ApiException as e:
        print("Exception when calling DLQueriesApi->kbs_kb_subclasses_get: %s\n" % e)

    # example passing only required values which don't have defaults set
    # and optional values
    try:
        # Subclasses
        api_instance.kbs_kb_subclasses_get(kb, object, prefixes=prefixes, direct=direct, include_equivalent=include_equivalent, include_nothing=include_nothing, include_deprecated=include_deprecated)
    except owlery_client.ApiException as e:
        print("Exception when calling DLQueriesApi->kbs_kb_subclasses_get: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **kb** | **str**| label for a knowledgebase in this Owlery |
 **object** | **str**| Manchester-syntax OWL class expression |
 **prefixes** | **str**| JSON format prefix map, used to expand prefixes in the &#39;object&#39; expression | [optional]
 **direct** | **bool**|  | [optional] if omitted the server will use the default value of True
 **include_equivalent** | **bool**| Also query for equivalent classes | [optional] if omitted the server will use the default value of False
 **include_nothing** | **bool**| owl:Nothing is filtered by default because it is by definition a subclass of everything. | [optional] if omitted the server will use the default value of False
 **include_deprecated** | **bool**| Include &#x60;owl:deprecated&#x60; terms in the result | [optional] if omitted the server will use the default value of True

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
**200** | subclasses |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **kbs_kb_superclasses_get**
> kbs_kb_superclasses_get(kb, object)

Superclasses

Get superclasses of a named class or class expression

### Example

```python
import time
import owlery_client
from owlery_client.api import dl_queries_api
from pprint import pprint
# Defining the host is optional and defaults to http://localhost
# See configuration.py for a list of all supported configuration parameters.
configuration = owlery_client.Configuration(
    host = "http://localhost"
)


# Enter a context with an instance of the API client
with owlery_client.ApiClient() as api_client:
    # Create an instance of the API class
    api_instance = dl_queries_api.DLQueriesApi(api_client)
    kb = "uberon" # str | label for a knowledgebase in this Owlery
    object = "<http://purl.obolibrary.org/obo/UBERON_0002101>" # str | Manchester-syntax OWL class expression
    prefixes = "{"obo": "http://purl.obolibrary.org/obo/", "part_of": "http://purl.obolibrary.org/obo/BFO_0000050"}" # str | JSON format prefix map, used to expand prefixes in the 'object' expression (optional)
    direct = True # bool |  (optional) if omitted the server will use the default value of True
    include_equivalent = False # bool | Also query for equivalent classes (optional) if omitted the server will use the default value of False
    include_thing = False # bool | owl:Thing is filtered by default because it is by definition a superclass of everything. (optional) if omitted the server will use the default value of False
    include_deprecated = True # bool | Include `owl:deprecated` terms in the result (optional) if omitted the server will use the default value of True

    # example passing only required values which don't have defaults set
    try:
        # Superclasses
        api_instance.kbs_kb_superclasses_get(kb, object)
    except owlery_client.ApiException as e:
        print("Exception when calling DLQueriesApi->kbs_kb_superclasses_get: %s\n" % e)

    # example passing only required values which don't have defaults set
    # and optional values
    try:
        # Superclasses
        api_instance.kbs_kb_superclasses_get(kb, object, prefixes=prefixes, direct=direct, include_equivalent=include_equivalent, include_thing=include_thing, include_deprecated=include_deprecated)
    except owlery_client.ApiException as e:
        print("Exception when calling DLQueriesApi->kbs_kb_superclasses_get: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **kb** | **str**| label for a knowledgebase in this Owlery |
 **object** | **str**| Manchester-syntax OWL class expression |
 **prefixes** | **str**| JSON format prefix map, used to expand prefixes in the &#39;object&#39; expression | [optional]
 **direct** | **bool**|  | [optional] if omitted the server will use the default value of True
 **include_equivalent** | **bool**| Also query for equivalent classes | [optional] if omitted the server will use the default value of False
 **include_thing** | **bool**| owl:Thing is filtered by default because it is by definition a superclass of everything. | [optional] if omitted the server will use the default value of False
 **include_deprecated** | **bool**| Include &#x60;owl:deprecated&#x60; terms in the result | [optional] if omitted the server will use the default value of True

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
**200** | superclasses |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **kbs_kb_types_get**
> bool, date, datetime, dict, float, int, list, str, none_type kbs_kb_types_get(kb, object)

Types

Get types of a named individual

### Example

```python
import time
import owlery_client
from owlery_client.api import dl_queries_api
from pprint import pprint
# Defining the host is optional and defaults to http://localhost
# See configuration.py for a list of all supported configuration parameters.
configuration = owlery_client.Configuration(
    host = "http://localhost"
)


# Enter a context with an instance of the API client
with owlery_client.ApiClient() as api_client:
    # Create an instance of the API class
    api_instance = dl_queries_api.DLQueriesApi(api_client)
    kb = "kb_example" # str | label for a knowledgebase in this Owlery
    object = "<http://example.org/person/1234>" # str | Individual IRI
    prefixes = "prefixes_example" # str | JSON format prefix map (optional)
    direct = True # bool |  (optional) if omitted the server will use the default value of True
    include_thing = False # bool | owl:Thing is filtered by default because it is by definition a type of everything. (optional) if omitted the server will use the default value of False
    include_deprecated = True # bool | Include `owl:deprecated` terms in the result (optional) if omitted the server will use the default value of True

    # example passing only required values which don't have defaults set
    try:
        # Types
        api_response = api_instance.kbs_kb_types_get(kb, object)
        pprint(api_response)
    except owlery_client.ApiException as e:
        print("Exception when calling DLQueriesApi->kbs_kb_types_get: %s\n" % e)

    # example passing only required values which don't have defaults set
    # and optional values
    try:
        # Types
        api_response = api_instance.kbs_kb_types_get(kb, object, prefixes=prefixes, direct=direct, include_thing=include_thing, include_deprecated=include_deprecated)
        pprint(api_response)
    except owlery_client.ApiException as e:
        print("Exception when calling DLQueriesApi->kbs_kb_types_get: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **kb** | **str**| label for a knowledgebase in this Owlery |
 **object** | **str**| Individual IRI |
 **prefixes** | **str**| JSON format prefix map | [optional]
 **direct** | **bool**|  | [optional] if omitted the server will use the default value of True
 **include_thing** | **bool**| owl:Thing is filtered by default because it is by definition a type of everything. | [optional] if omitted the server will use the default value of False
 **include_deprecated** | **bool**| Include &#x60;owl:deprecated&#x60; terms in the result | [optional] if omitted the server will use the default value of True

### Return type

**bool, date, datetime, dict, float, int, list, str, none_type**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | types |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

