from typing import List, Union, Optional, Tuple
import os

import rdflib
from rdflib import Graph, Namespace, Literal, URIRef, BNode
from rdflib.namespace import RDF, RDFS, OWL, XSD
from urllib.parse import quote
import pandas as pd


# Type declaration
Triple = Tuple[URIRef, URIRef, URIRef]

CATALOG_IRI = URIRef("urn:absolute:strateos-containers")
ENTRY_IRI = URIRef("urn:absolute:strateos_containers_catalog")
CONT_NS = Namespace("https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#")
# This is the master naemspace for the
STRATEOS_NS = Namespace(CATALOG_IRI + "#")
strateos_entries_ns = Namespace(ENTRY_IRI + "#")
om_ns = Namespace("http://www.ontology-of-units-of-measure.org/resource/om-2/")
OM_SUBSET = Namespace("https://www.dropbox.com/s/ytuxjttj1ba5f0d/om-subset.ttl")


def make_catalog_graph(
    identifier,
    label: str = "Strateos Catalog Containers",
    comment: Optional[str] = None,
) -> Graph:
    """

    Parameters
    ----------
    identifier : URIRef
       The URI for the ontology (*not* the prefix, so no separator character)
    label : str
        What goes in the `rdfs:label` for the ontology
    comment : str, optional
        What, if anything, goes in the `rdfs:comment` for the ontology

    Returns
    -------
    Graph
        Graph will have as its identifier the identifier argument, which will also be the `@base` of the
        ontology.  It will have defined in it a `"cat:"` prefix for the ontology and a `"cat_ent"` subsidiary
        namespace for catalog entry individuals/URIs.  This helps avoid name collisions.

    """
    g: Graph = Graph(identifier=identifier)
    g.bind("cont", CONT_NS)
    g.bind("cat", Namespace(URIRef(identifier + "#")))
    g.bind("om", om_ns)
    g.bind("rdf", RDF)
    g.bind("rdfs", RDFS)
    g.bind("owl", OWL)
    g.bind("cat_ent", Namespace(URIRef(identifier + "_catalog#")))
    g.base = identifier
    for x in [CONT_NS, OM_SUBSET]:
        g.add((identifier, OWL.imports, URIRef(x.rstrip("#"))))
    g.add((identifier, RDF.type, OWL.Ontology))
    g.add((identifier, RDFS.label, Literal(label, lang="en")))
    if comment is not None:
        g.add((identifier, RDFS.comment, Literal(comment, lang="en")))
    return g


def add_vendor(vendor_string, graph) -> URIRef:
    """
    Record in graph the existence of vendor with name `vendor_string`.
    Parameters
    ----------
    vendor_string : str
    Name of the vendor
    graph : Graph

    Returns
    -------
    URIRef : URI assigned to the `Vendor` entity.

    """
    vendor_iri = URIRef(CONT_NS[quote(vendor_string)])
    vendor_name = Literal(vendor_string)
    graph.add((vendor_iri, RDF.type, CONT_NS.VendorFirm))
    graph.add((vendor_iri, RDFS.label, vendor_name))
    graph.add((vendor_iri, CONT_NS.vendorName, vendor_name))
    return vendor_iri


def find_vendor(vendor_string, graph) -> Optional[URIRef]:
    """
    Find and return `cont:Vendor` object for `vendor_string` if one exists.

    Parameters
    ----------
    vendor_string : str
    graph : Graph

    Returns
    -------
    URIRef if one exists, else `None`

    """
    vendor_iri = URIRef(CONT_NS[quote(vendor_string)])
    if (vendor_iri, RDF.type, CONT_NS.VendorFirm) in graph:
        return vendor_iri
    return None


# In[13]:


def catalog_entry(vendor: str, catalog_number: Union[int, str], graph) -> URIRef:
    """
    Create `catalog_entry` entity, add to `graph` and return the URI
    Parameters
    ----------
    vendor
    catalog_number
    graph

    Returns
    -------

    """
    if isinstance(catalog_number, int):
        catalog_number = str(catalog_number)
    assert isinstance(catalog_number, str)
    vendor_iri = find_vendor(vendor, graph)
    new_iri = URIRef(strateos_entries_ns[quote(vendor + catalog_number)])
    graph.add((new_iri, RDF.type, CONT_NS.CatalogEntry))
    graph.add((new_iri, CONT_NS.hasVendor, vendor_iri))
    graph.add((new_iri, CONT_NS.catalogNumber, Literal(catalog_number)))
    return new_iri


class WellDepth(URIRef):
    depth: float
    unit: URIRef
    count = 0

    def __new__(cls, *args, **kwargs):
        ns = kwargs["ns"]
        URI = ns[f"wellDepth{cls.count}"]
        cls.count += 1
        return super().__new__(cls, URI)

    def __init__(self, depth: float, unit=om_ns.millimetre, ns=STRATEOS_NS):
        self.depth = depth
        self.unit = unit
        super().__init__()

    def triples(self) -> List[Tuple[URIRef, URIRef, URIRef]]:
        return [
            (self, RDF.type, om_ns.Depth),
            (self, om_ns.hasNumericalValue, Literal(self.depth, datatype=XSD.float)),
            (self, om_ns.hasDimension, self.unit),
        ]


def make_well_depth(
    depth: float, graph, unit=om_ns.millimetre, ns=STRATEOS_NS
) -> URIRef:
    depth_uri = WellDepth(depth, unit=unit, ns=ns)
    for triple in depth_uri.triples():
        graph.add(triple)
    return depth_uri


class Height(URIRef):
    height: float
    unit: URIRef
    count = 0

    def __new__(cls, *args, **kwargs):
        ns = kwargs["ns"]
        URI = ns[f"height{cls.count}"]
        cls.count += 1
        return super().__new__(cls, URI)

    def __init__(self, height: float, unit=om_ns.millimetre, ns=STRATEOS_NS):
        self.height = height
        self.unit = unit
        super().__init__()

    def triples(self) -> List[Tuple[URIRef, URIRef, URIRef]]:
        return [
            (self, RDF.type, om_ns.Height),
            (self, om_ns.hasNumericalValue, Literal(self.height, datatype=XSD.float)),
            (self, om_ns.hasDimension, self.unit),
        ]


def make_height(height: float, graph, unit=om_ns.millimetre, ns=STRATEOS_NS) -> URIRef:
    height_uri = Height(height, unit=unit, ns=ns)
    for triple in height_uri.triples():
        graph.add(triple)
    return height_uri


class WellVolume(URIRef):
    volume: float
    unit: URIRef
    count = 0

    def __new__(cls, *args, **kwargs):
        ns = kwargs["ns"]
        URI = ns[f"wellvolume{cls.count}"]
        cls.count += 1
        return super().__new__(cls, URI)

    def __init__(self, volume: float, unit=om_ns.microlitre, ns=STRATEOS_NS):
        self.volume = volume
        self.unit = unit
        super().__init__()

    def triples(self) -> List[Tuple[URIRef, URIRef, URIRef]]:
        return [
            (self, RDF.type, om_ns.Volume),
            (self, om_ns.hasNumericalValue, Literal(self.volume, datatype=XSD.float)),
            (self, om_ns.hasDimension, self.unit),
        ]


def make_well_volume(
    volume: float, graph, unit=om_ns.microlitre, ns=STRATEOS_NS
) -> URIRef:
    volume_uri = WellVolume(volume, unit=unit, ns=ns)
    for triple in volume_uri.triples():
        graph.add(triple)
    return volume_uri


def make_restriction(
    classURI: URIRef, propertyURI: URIRef, value: URIRef
) -> Tuple[BNode, List[Triple]]:
    """Return a Blank node and list of tuples for a restriction definition.
    The Blank node can be used as a class specifier, and the Triples should be added to
    the graph of interest.
    """
    bnode: BNode = BNode()
    triples: List[Triple] = [(bnode, RDF.type, OWL.Restriction), (bnode, OWL.onProperty, propertyURI),
                             (bnode, OWL.hasValue, value), (classURI, RDFS.subClassOf, bnode)]

    return bnode, triples


def add_all(g: Graph, triples: List[Triple]) -> None:
    for t in triples:
        g.add(t)


def translate_spreadsheet_classes(plates: pd.DataFrame, g: Graph) -> None:
    """
    Translate the contents of `plates` and add them to `g`.

    The elements of the catalog in `plates` will be translated as OWL *classes*

    Parameters
    ----------
    plates
    g

    Returns
    -------
    Nothing

    """
    for _, x in plates.iterrows():
        id = x["Id"]
        vendor = x["Vendor"]
        vendor_iri = find_vendor(vendor, g)
        if vendor_iri is None:
            vendor_iri = add_vendor(vendor, g)
        catalog_number = x["Catalog Number"]
        plate_iri = rdflib.term.URIRef(STRATEOS_NS[quote(vendor + id)])
        g.add((plate_iri, RDF.type, OWL.Class))
        ce = catalog_entry(vendor, catalog_number, g)
        g.add((plate_iri, RDFS.subClassOf, CONT_NS.Plate))
        _r, triples = make_restriction(plate_iri, CONT_NS.hasCatalogEntry, ce)
        add_all(g, triples)

        _r, triples = make_restriction(
            plate_iri, CONT_NS.wellCount, Literal(int(x["Well Count"]))
        )
        add_all(g, triples)
        cols = int(x["Column Count"])
        rows = int(x["Well Count"] / cols)

        _r, triples = make_restriction(plate_iri, CONT_NS.columnCount, Literal(cols))
        add_all(g, triples)

        _r, triples = make_restriction(plate_iri, CONT_NS.rowCount, Literal(rows))
        add_all(g, triples)

        g.add((plate_iri, RDFS.comment, Literal(vendor + " " + x["Name"])))
        g.add((plate_iri, RDFS.label, Literal(id)))

        _r, triples = make_restriction(plate_iri, CONT_NS.equipmentVendor, vendor_iri)
        add_all(g, triples)

        well_depth = make_well_depth(float(x["Well Depth (mm)"]), g)
        _r, triples = make_restriction(plate_iri, CONT_NS.wellDepth, well_depth)
        add_all(g, triples)

        well_vol = make_well_volume(float(x["Well Volume (ul)"]), g)
        _r, triples = make_restriction(plate_iri, CONT_NS.wellVolume, well_vol)
        add_all(g, triples)

        height = make_height(float(x["Height (mm)"]), g)
        _r, triples = make_restriction(plate_iri, CONT_NS.height, height)
        add_all(g, triples)

        print(f"Added {vendor} {id} as class {plate_iri}")


def translate_spreadsheet_individuals(
    plates: pd.DataFrame, g: Graph, verbose: bool = True
) -> None:
    """

    Parameters
    ----------
    plates
    g
    verbose : bool
      Print a message for each plate translated

    Returns
    -------

    """
    for _, x in plates.iterrows():
        id = x["Id"]
        vendor = x["Vendor"]
        vendor_iri = find_vendor(vendor, g)
        if vendor_iri is None:
            vendor_iri = add_vendor(vendor, g)
        catalog_number = x["Catalog Number"]
        plate_iri = rdflib.term.URIRef(STRATEOS_NS[quote(vendor + id)])
        ce = catalog_entry(vendor, catalog_number, g)
        g.add((plate_iri, RDF.type, CONT_NS.Plate))
        g.add((plate_iri, CONT_NS.hasCatalogEntry, ce))
        g.add((plate_iri, CONT_NS.wellCount, Literal(int(x["Well Count"]))))

        cols = int(x["Column Count"])
        rows = int(x["Well Count"] / cols)
        g.add((plate_iri, CONT_NS.columnCount, Literal(cols)))
        g.add((plate_iri, CONT_NS.rowCount, Literal(rows)))

        g.add((plate_iri, RDFS.comment, Literal(vendor + " " + x["Name"])))
        g.add((plate_iri, RDFS.label, Literal(id)))

        g.add((plate_iri, CONT_NS.equipmentVendor, vendor_iri))

        well_depth = make_well_depth(float(x["Well Depth (mm)"]), g)
        g.add((plate_iri, CONT_NS.wellDepth, well_depth))

        well_vol = make_well_volume(float(x["Well Volume (ul)"]), g)
        g.add((plate_iri, CONT_NS.wellVolume, well_vol))

        height = make_height(float(x["Height (mm)"]), g)
        g.add((plate_iri, CONT_NS.height, height))

        if verbose:
            print(f"Added {vendor} {id} as {plate_iri}")


def translate_to_classes(
    df: pd.DataFrame, URI: str, label: str, comment: Optional[str] = None
) -> Graph:
    if not isinstance(URI, URIRef):
        URI = URIRef(URI)
    g = make_catalog_graph(URI, label, comment)
    translate_spreadsheet_classes(df, g)
    return g


def translate_to_individuals(
    df: pd.DataFrame, URI: str, label: str, comment: Optional[str] = None
) -> Graph:
    if not isinstance(URI, URIRef):
        URI = URIRef(URI)
    g = make_catalog_graph(URI, label, comment)
    translate_spreadsheet_individuals(df, g)
    return g


def main(
    filename,
    output_filename,
    iri: str = CATALOG_IRI,
    label="Strateos Plate Catalog",
    comment: Optional[str] = None,
    to_individuals: bool = True,
) -> str:
    df: pd.DataFrame
    path_ext: str
    g: Graph
    if not os.path.exists(filename):
        raise FileNotFoundError(f"No such file {filename}")
    _, path_ext = os.path.splitext(filename)
    if path_ext == ".xlsx":
        df = pd.read_excel(filename, engine="openpyxl")
    elif path_ext == ".csv":
        df = pd.read_csv(filename)
    else:
        raise ValueError(
            f"Cannot open catalog spreadsheet file of type {path_ext}: {filename}"
        )

    df = df[df["Well Count"] > 1]

    if to_individuals:
        g = translate_to_individuals(df, iri, label, comment)
    else:
        g = translate_to_classes(df, iri, label, comment)

    g.serialize(output_filename, format="turtle")

    return output_filename


if __name__ == "__main__":
    # main(os.path.join(os.path.dirname(__file__), "../../owl/Strateos containers.xlsx"),
    #      os.path.join(os.path.dirname(__file__), "../../owl/strateos-catalog-individuals.ttl"),
    #      "urn:absolute:strateos-catalog")
    main(os.path.join(os.path.dirname(__file__), "../../owl/Strateos containers.xlsx"),
         os.path.join(os.path.dirname(__file__), "../../owl/strateos-catalog-classes.ttl"),
         to_individuals=False,
         label="Strateos Plate Catalog as OWL classes",
         iri="urn:absolute:strateos-catalog")
    # main()
