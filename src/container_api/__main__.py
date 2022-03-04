from rdflib import Namespace
import logging
import argparse

from container_api import matching_containers, ContainerSpec, strateos_id

parser = argparse.ArgumentParser("Example use of container_api library.")
parser.add_argument(
    '--debug',
    action='store_true', 
    help='print debug messages to stderr'
)
args = parser.parse_args()

logger = logging.getLogger("container_api")
sub_logger = logging.getLogger("owlery_client.api_client")
# the following urllib settings don't seem to do anything at all.
request_logger = logging.getLogger("urllib3")


if args.debug:
    sub_logger.setLevel(logging.DEBUG)
    request_logger.setLevel(logging.DEBUG)
    logger.setLevel(logging.DEBUG)
    logging.basicConfig(level=logging.DEBUG)
else:
    logging.basicConfig(level=logging.WARN)

CONT_NS = Namespace("https://sift.net/container-ontology/container-ontology#")
OM_NS = Namespace("http://www.ontology-of-units-of-measure.org/resource/om-2/")
# should also have a not flat well bottom condition.
plate_spec = """cont:ClearPlate and 
 cont:SLAS-4-2004 and
 (cont:wellVolume some
        ((om:hasUnit value om:microlitre) and
         (om:hasNumericalValue only xsd:decimal[>= "200"^^xsd:decimal])))
 and (cont:hasWellBottomShape only cont:NotFlatWellBottom)"""

# Note that this is actually unnecessary: this is the default previx_map
prefix_map = {"cont": CONT_NS, "om": OM_NS}
insts = matching_containers(ContainerSpec(queryString=plate_spec, prefixMap=prefix_map))
print("List of matching instances is:")
for inst in insts:
    print("\t" + inst)

print("Checking matching plates that are also available at Strateos.")
insts = matching_containers(ContainerSpec(queryString=plate_spec,
                                          addl_conditions="(cont:availableAt value <https://sift.net/container-ontology/strateos-catalog#Strateos>)"))

print("List of matching instances AT STRATEOS is:")
for inst in insts:
    print(f"\t{inst} short name: {strateos_id(inst)}")
