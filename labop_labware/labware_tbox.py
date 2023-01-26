# python module that defines an ontology of common labware classes that are used in a scientific lab, based on EMMOntoPy
# it should be possible to use this ontology to automatically get the right SI units for the properties of the labware
# and to automatically get the right EMMO classes for the labware
# as much as possible, the ontology should be based on EMMO, but it may be necessary to add some classes and properties
# that are not in EMMO
# as much as possible should be inferred from EMMO, but it may be necessary to add some axioms
# the ontology should be able to be used in a lab notebook, and should be able to be used to automatically generate
# a labware inventory
# the ontology should be able to be used to automatically generate a labware database


import os
import pathlib
import logging

from ontopy import World
from ontopy.utils import write_catalog

import owlready2

from labop_labware.__init__ import __version__  # Version of this ontology


# --- helper functions

def en(s):
    """Returns `s` as an English location string."""
    return owlready2.locstr(s, lang='en')


def pl(s):
    """Returns `s` as a plain literal string."""
    return owlready2.locstr(s, lang='')


class labop_Labware:
    def __init__(self, emmo_world=None) -> None:

        self.labop_labware_base_iri = 'http://www.oso.org/oso/labware#'
        self.labop_labware_version_iri = f'http://www.oso.org/{__version__}/oso/labware'

        output_filename_base = os.path.join('labop_labware')
        self.labop_labware_owl_filename = f'{output_filename_base}-v{__version__}.owl'
        self.labop_labware_ttl_filename = f'{output_filename_base}-v{__version__}.ttl'

        # Load crystallography, which imports emmo
        # alternative url   "https://raw.githubusercontent.com/emmo-repo/EMMO/master/self.emmo.ttl"

        self.emmo_url = (
            'https://raw.githubusercontent.com/emmo-repo/emmo-repo.github.io/'
            'master/versions/1.0.0-beta/emmo-inferred-chemistry2.ttl')

        self.emmo_url_local = os.path.join(pathlib.Path(
            __file__).parent.resolve(), "emmo", "emmo-inferred-chemistry2")

        if os.path.isfile(self.emmo_url_local + '.ttl'):
            self.emmo_url = self.emmo_url_local

        #self.emmo_world = World(filename="emmo_labwares.sqlite3")
        if emmo_world is not None:
            self.emmo_world = emmo_world
        else:
            self.emmo_world = World()
            # self.emmo_world.onto_path.append("../emmo")

            self.emmo = self.emmo_world.get_ontology(self.emmo_url)
            self.emmo.load()  # reload_if_newer = True
            self.emmo.sync_python_names()  # Syncronize annotations
            self.emmo.base_iri = self.emmo.base_iri.rstrip('/#')
            self.catalog_mappings = {self.emmo.base_iri: self.emmo_url}

                # Create new ontology: labOP-labware - lolw
        self.lolw = self.emmo_world.get_ontology(self.labop_labware_base_iri)
        if emmo_world is None:
            self.lolw.imported_ontologies.append(self.emmo)
        self.llw.sync_python_names()

    # defining the  labOP-labware ontology
    def define_ontology(self):
        logging.debug('defining labware ontology')

        with self.lolw:
            # Terminology Component (TBox) 

            # Basic Relations
            # ================

            class hasType(self.lolw.hasConvention):
                """Associates a type (string, number...) to a property."""

            class isTypeOf(self.lolw.hasConvention):
                """Associates a property to a type (string, number...)."""
                inverse_property = hasType

            # Physical Properties
            # ====================

            # Length

            class Length(self.emmo.Length):
                """"Labware total length """
                physicalDimension = pl("T+1 L0 M0 I0 Θ0 N0 J0")
                wikipediaEntry = en("https://en.wikipedia.org/wiki/Length")

                # associate the related SI unit
                

            



            
