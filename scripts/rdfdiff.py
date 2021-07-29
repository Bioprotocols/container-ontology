#! /usr/bin/env python3

from rdflib import Graph
from rdflib.compare import to_isomorphic, graph_diff
from rdflib.namespace import Namespace
import sys
from typing import Tuple, Any, Optional

from rdflib.namespace import OWL

CONT = Namespace("http://www.semanticweb.org/rpg/ontologies/2021/5/container-ontology#")


def rdfdiff(old: str, new: str, old_format='turtle', new_format='turtle') -> Optional[Tuple[Any, Any, Any]]:
    old_graph: Graph = Graph()
    new_graph: Graph = Graph()
    old_graph.parse(old, format=old_format)
    new_graph.parse(new, format=new_format)
    iso1: Graph = to_isomorphic(old_graph)
    iso2: Graph = to_isomorphic(new_graph)
    if iso1 == iso2:
        return None
    in_both, in_old, in_new = graph_diff(iso1, iso2)
    in_old.namespace_manager.bind('owl', OWL, override=False)
    in_new.namespace_manager.bind('owl', OWL, override=False)
    in_old.namespace_manager.bind('cont', CONT, override=False)
    in_new.namespace_manager.bind('cont', CONT, override=False)
    return in_both, in_old, in_new


if __name__ == '__main__':
    retval = rdfdiff(sys.argv[1], sys.argv[2])
    if retval is None:
        print("RDF graph is unchanged")
        exit(0)

    in_both: Graph
    in_old: Graph
    in_new: Graph
    _in_both, in_old, in_new = retval
    # print("Common triples:")
    # print(in_both.serialize(format="turtle"))
    # print("------------------------")
    print("Only in old graph")
    print(in_old.serialize(format="turtle").decode('utf-8'))
    print("------------------------")
    print("Only in new graph")
    print(in_new.serialize(format="turtle").decode('utf-8'))
    print("------------------------")
    exit(1)
