import argparse
import os

from rdflib import Graph
from sys import stdout


def JSON_prefixes(g: Graph, stream):
    """
    Extract prefix definitions from `g` `and write them to `stream` in JSON format.
    Parameters
    ----------
    g : rdflib.Graph

    Returns
    -------
    Nothing

    """
    nsm = g.namespace_manager
    is_first_line = True
    print("{", file=stream, end=" ")
    for pre, URI in nsm.namespaces():
        if is_first_line:
            is_first_line = False
        else:
            print(", ", file=stream, end="")
        print(f"\"{pre}\": \"{URI}\"", file=stream, end="")
    print(" }", file=stream, end="")


def SPARQL_prefixes(g, stream):
    """
    Extract prefix definitions from `g` `and write them to `stream` in SPARQL format.
    Parameters
    ----------
    g : rdflib.Graph

    Returns
    -------
    Nothing

    """
    nsm = g.namespace_manager
    for pre, URI in nsm.namespaces():
        print(f"PREFIX {pre}: <f{URI}>", file=stream)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("input", nargs='?', help="RDF file from which to extract the prefix.", type=open)
    parser.add_argument("--format", default='sparql', choices=['sparql', 'json'],
                        help="Output format for the prefix map.")
    parser.add_argument("-o", "--output", help="Output file name (defaults to write to standard output).")

    args = parser.parse_args()
    filename = args.input.name
    _name, ext = os.path.splitext(filename)
    g: Graph = Graph()

    # For some reason, the RDFLIB parser has trouble with turtle format files.
    if ext == '.ttl':
        g.parse(args.input, format='turtle')
    else:
        g.parse(args.input)

    args.input.close()

    if args.output is None:
        output_file = stdout
    else:
        output_file = open(args.output, 'w')
    if args.format == 'sparql':
        SPARQL_prefixes(g, output_file)
    elif args.format == 'json':
        JSON_prefixes(g, output_file)
