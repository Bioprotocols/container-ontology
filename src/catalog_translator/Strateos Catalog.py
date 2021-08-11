#!/usr/bin/env python
# coding: utf-8

# # Make Classes for the Microplates in the Strateos catalog
# 
# 

# In[1]:


import pandas as pd
from typing import List, Union, Optional, Tuple
import rdflib
from rdflib import Graph, Namespace, Literal, URIRef, BNode
from rdflib.namespace import RDF, RDFS, OWL, XSD
from urllib.parse import quote


# In[2]:


# Type declaration
Triple = Tuple[URIRef, URIRef, URIRef]


# In[3]:


workbook = pd.ExcelFile('../owl/Strateos containers.xlsx',engine='openpyxl')
strateos_catalog = pd.read_excel(workbook, "Strateos Containers")
strateos_plates = strateos_catalog[strateos_catalog['Well Count'] > 1]
strateos_plates.head()


# In[4]:


for i, x in strateos_plates.iterrows():
    break
print(x)
print(x.index)
x['Well Depth (mm)']


# In[5]:


CATALOG_IRI = URIRef('urn:absolute:strateos-containers')
ENTRY_IRI = URIRef('urn:absolute:strateos_containers_catalog')


# In[6]:


g = Graph(identifier=CATALOG_IRI)


# In[7]:


co_ns = Namespace('https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#')
strateos_ns = Namespace(CATALOG_IRI + '#')
strateos_entries_ns = Namespace(ENTRY_IRI + '#')
om_ns = Namespace('http://www.ontology-of-units-of-measure.org/resource/om-2/')
g.bind('cont', co_ns)
g.bind('cat', strateos_ns)
g.bind('om', om_ns)
g.bind('rdf', RDF)
g.bind('rdfs', RDFS)
g.bind('owl', OWL)
g.bind('cat_ent', strateos_entries_ns)
g.base = CATALOG_IRI


# In[8]:


list(g.namespace_manager.namespaces())


# In[9]:


help(g.namespace_manager)


# In[10]:


isinstance(co_ns, str)


# In[23]:


CATALOG_IRI


# In[11]:


g.add((CATALOG_IRI, RDF.type, OWL.ontology))
for x in [co_ns, om_ns]:
    g.add((CATALOG_IRI, OWL.imports, URIRef(x.rstrip("#"))))
g.add((CATALOG_IRI, RDFS.label, Literal("Strateos Catalog Containers", lang='en')))


# In[12]:



def add_vendor(vendor_string, graph=g) -> URIRef:
    vendor_iri = co_ns[quote(vendor_string)]
    vendor_name = Literal(vendor_string)    
    graph.add((vendor_iri, RDF.type, co_ns.VendorFirm))
    graph.add((vendor_iri, RDFS.label, vendor_name))
    graph.add((vendor_iri, co_ns.vendorName, vendor_name))
    return vendor_iri

def find_vendor(vendor_string, graph=g) -> Optional[URIRef]:
    vendor_iri = co_ns[quote(vendor_string)]
    if (vendor_iri, RDF.type, co_ns.VendorFirm) in graph:
        return vendor_iri
    return None


# In[13]:


def catalog_entry(vendor: str, catalog_number: Union[int, str], graph=g) -> URIRef:
    if isinstance(catalog_number, int):
        catalog_number = str(catalog_number)
    assert isinstance(catalog_number, str)
    vendor_iri = find_vendor(vendor, graph)
    new_iri = strateos_entries_ns[quote(vendor + catalog_number)]
    graph.add((new_iri, RDF.type, co_ns.CatalogEntry))
    graph.add((new_iri, co_ns.hasVendor, vendor_iri))
    graph.add((new_iri, co_ns.catalogNumber, Literal(catalog_number)))
    return new_iri
    


# In[14]:


class WellDepth(URIRef):
    depth: float
    unit: URIRef
    count = 0
    def __new__(cls, *args, **kwargs):
        ns = kwargs['ns']
        URI = ns[f"wellDepth{cls.count}"]
        cls.count += 1
        return super().__new__(cls, URI)
    
    def __init__(self, depth: float, unit=om_ns.millimetre, ns=strateos_ns):
        self.depth = depth
        self.unit = unit
        super().__init__()
        
    def triples(self) -> List[Tuple[URIRef, URIRef, URIRef]]:
        return [
            (self, RDF.type, om_ns.Depth),
            (self, om_ns.hasNumericalValue, Literal(self.depth, datatype=XSD.float)),
            (self, om_ns.hasDimension, self.unit),
        ]
        

def make_well_depth(depth: float, unit=om_ns.millimetre, ns=strateos_ns, graph=g) -> URIRef:
    depth_uri = WellDepth(depth, unit=unit, ns=ns)
    for triple in depth_uri.triples():
        graph.add(triple)
    return depth_uri
    
    


# In[15]:


class Height(URIRef):
    height: float
    unit: URIRef
    count = 0
    def __new__(cls, *args, **kwargs):
        ns = kwargs['ns']
        URI = ns[f"height{cls.count}"]
        cls.count += 1
        return super().__new__(cls, URI)
    
    def __init__(self, height: float, unit=om_ns.millimetre, ns=strateos_ns):
        self.height = height
        self.unit = unit
        super().__init__()
        
    def triples(self) -> List[Tuple[URIRef, URIRef, URIRef]]:
        return [
            (self, RDF.type, om_ns.Height),
            (self, om_ns.hasNumericalValue, Literal(self.height, datatype=XSD.float)),
            (self, om_ns.hasDimension, self.unit),
        ]
        

def make_height(height: float, unit=om_ns.millimetre, ns=strateos_ns, graph=g) -> URIRef:
    height_uri = Height(height, unit=unit, ns=ns)
    for triple in height_uri.triples():
        graph.add(triple)
    return height_uri
    
    


# In[16]:


class WellVolume(URIRef):
    volume: float
    unit: URIRef
    count = 0
    def __new__(cls, *args, **kwargs):
        ns = kwargs['ns']
        URI = ns[f"wellvolume{cls.count}"]
        cls.count += 1
        return super().__new__(cls, URI)
    
    def __init__(self, volume: float, unit=om_ns.microlitre, ns=strateos_ns):
        self.volume = volume
        self.unit = unit
        super().__init__()
        
    def triples(self) -> List[Tuple[URIRef, URIRef, URIRef]]:
        return [
            (self, RDF.type, om_ns.Volume),
            (self, om_ns.hasNumericalValue, Literal(self.volume, datatype=XSD.float)),
            (self, om_ns.hasDimension, self.unit),
        ]
        

def make_well_volume(volume: float, unit=om_ns.microlitre, ns=strateos_ns, graph=g) -> URIRef:
    volume_uri = WellVolume(volume, unit=unit, ns=ns)
    for triple in volume_uri.triples():
        graph.add(triple)
    return volume_uri
    
    


# In[24]:


def make_restriction(classURI: URIRef, propertyURI: URIRef, value: URIRef) -> Tuple[BNode, List[Triple]]:
    """Return a Blank node and list of tuples for a restriction definition.
    The Blank node can be used as a class specifier, and the Triples should be added to
    the graph of interest.
    """
    bnode: BNode = BNode()
    triples: List[Triple] = []
    triples.append((bnode, RDF.type, OWL.Restriction))
    triples.append((bnode, OWL.onProperty, propertyURI))
    triples.append((bnode, OWL.hasValue, value))
    triples.append((classURI, RDFS.subClassOf, bnode))
    
    return bnode, triples


# In[18]:


def add_all(g: Graph, triples: List[Triple]) -> None:
    for t in triples:
        g.add(t)


# In[19]:


def prefix(g: Graph) -> None:
    g.add((plate_iri, RDFS.subClassOf, r))


# In[20]:



for _, x in strateos_plates.iterrows():
    id = x['Id']
    vendor = x['Vendor']
    vendor_iri = find_vendor(vendor)
    if vendor_iri is None:
        vendor_iri = add_vendor(vendor)
    catalog_number = x['Catalog Number']
    plate_iri = rdflib.term.URIRef(strateos_ns[quote(vendor+id)])
    ce = catalog_entry(vendor, catalog_number)
    g.add((plate_iri, RDFS.subClassOf, co_ns.Plate))
    _r, triples = make_restriction(plate_iri, co_ns.hasCatalogEntry, ce)
    add_all(g, triples)

    _r, triples = make_restriction(plate_iri, co_ns.wellCount, Literal(int(x['Well Count'])))
    add_all(g, triples)
    cols = int(x['Column Count'])
    rows = int(x['Well Count'] / cols)
    
    _r, triples = make_restriction(plate_iri, co_ns.columnCount, Literal(cols))
    add_all(g, triples)
    
    _r, triples = make_restriction(plate_iri, co_ns.rowCount, Literal(rows))
    add_all(g, triples)
    
    g.add((plate_iri, RDFS.comment, Literal(vendor + " " + x['Name'])))
    g.add((plate_iri, RDFS.label, Literal(id)))
    
    _r, triples = make_restriction(plate_iri, co_ns.equipmentVendor, vendor_iri)
    add_all(g, triples)
    
    well_depth = make_well_depth(float(x['Well Depth (mm)']))
    _r, triples = make_restriction(plate_iri, co_ns.wellDepth, well_depth)
    add_all(g, triples)
    
    well_vol = make_well_volume(float(x['Well Volume (ul)']))
    _r, triples = make_restriction(plate_iri, co_ns.wellVolume, well_vol)
    add_all(g, triples)    
    
    height = make_height(float(x['Height (mm)']))
    _r, triples = make_restriction(plate_iri, co_ns.height, height)
    add_all(g, triples)    
    
    print(f"Added {vendor} {id} as {plate_iri}")


# In[21]:


g.serialize(format='turtle')


# In[22]:


g.serialize('../owl/strateos-catalog.ttl', format='turtle')


# In[ ]:




