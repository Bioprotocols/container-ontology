from json import dumps
from rdflib import Namespace

from container_api.api_client import _mc_helper

sub_logger = logging.getLogger("owlery_client.api_client")
sub_logger.setLevel(logging.DEBUG)
# the following urllib settings don't seem to do anything at all.
request_logger = logging.getLogger("urllib3")
request_logger.setLevel(logging.DEBUG)
logger.setLevel(logging.DEBUG)
logging.basicConfig(level=logging.DEBUG)

CONT_NS = Namespace("https://sift.net/container-ontology/container-ontology#")
OM_NS = Namespace("http://www.ontology-of-units-of-measure.org/resource/om-2/")
# should also have a not flat well bottom condition.
plate_spec = """cont:ClearPlate and 
 cont:SLAS-4-2004 and
 (cont:wellVolume some
        ((om:hasUnit value om:microlitre) and
         (om:hasNumericalValue only xsd:decimal[>= "200"^^xsd:decimal])))
 and (cont:hasWellBottomShape only cont:NotFlatWellBottom)"""

prefix_map = dumps({"cont": CONT_NS, "om": OM_NS})
insts = _mc_helper(container_spec=plate_spec, prefix_map=prefix_map)
print("List of matching instances is:")
for inst in insts:
    print("\t" + inst)

print("Checking matching plates that are also available at Strateos.")
insts = _mc_helper(
    container_spec=plate_spec
    + " and (cont:availableAt value <https://sift.net/container-ontology/strateos-catalog#Strateos>)",
    prefix_map=prefix_map,
)
print("List of matching instances AT STRATEOS is:")
for inst in insts:
    print(f"\t{inst} short name: {strateos_id(inst)}")
