#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""_____________________________________________________________________

:PROJECT: LabOP - Laboratory Open Protocol language or LabOP

* labOP labware implementation *

:details:  Main module i.
           
           https://en.wikipedia.org/wiki/Dimensional_analysis

.. note:: -
.. todo:: - 
________________________________________________________________________
"""

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

        # Create new ontology
        self.osolw = self.emmo_world.get_ontology(self.labop_labware_base_iri)
        if emmo_world is None:
            self.osolw.imported_ontologies.append(self.emmo)
        self.osolw.sync_python_names()

    def define_ontology(self):
        logging.debug('defining labware ontology')

        with self.osolw:

            # Basic Relations
            # ================

            class hasType(self.osolw.hasConvention):
                """Associates a type (string, number...) to a property."""

            class isTypeOf(self.osolw.hasConvention):
                """Associates a property to a type (string, number...)."""
                inverse_property = hasType

            # Physical Properties
            # ==========

            class Length:
                """"Labware total length """

            class Width:
                """Labware total width, """
            
            class Height:
                """Labware total hight, without  any additions, like lids etc. """

            class HigthLidded:
                """Labware total hight, with additions, like lids etc."""

            class HightStacked:
                """Labware stacking height without any additions, like lids."""

            class HightStackedLidded:
                """Labware stacking height with additions, like lids."""

            class Mass:
                """Mass of the Labware """

            class Material:
                """polymer, properties, like solvent tolerance, transperancy, ...."""
            
            class Color:
                """Labware color"""

            class Liddable:
                """container is liddable"""

            class Sealable:
                """container is sealable"""

            # multiwell labware

            class NumRows:
                """Number of rows of container"""
            
            class NumCols :
                """Number of columns of container"""
            
            class NumWells:
                """Number of wells - could be auto generated"""
            
            class WellDistRow:
                """wWll-to-well distance in row direction"""
            
            class WellDistCol:
                """"Well-to-well distance in column direction"""

            # Well properties of labware with wells
            class DepthWell:
                """Well total well depth=hight"""
            
            class ShapeWell:
                """Well overall / top well shape,e.g. round, square, buffeled,..."""
            
            class ShapeWellBottom:
                """Well, bottom shape, flat, round, conical-"""

            class TopRadiusXY:
                """Well radius of a round well at the top opening in x-y plane."""

            class BottomRadiusXY:
                """Radius of a round bottom in xy plane / direction."""

            class BottomRadiusZ:
                """Radius of a round bottom in z (hight) direction."""

            class ConeAngle:
                """Opening angle of cone in deg."""

            class ConeDepth:
                """Depth of cone from beginning of conical shape."""

            class ShapePolygonXY:
                """Generalized shape polygon for more complex well shapes, in xy plane / direction."""

            class ShapePolygonZ:
                """Generalized shape polygon for more complex well shapes, in z direction = rotation axis."""

            class ShapeModel2D:
                """2D model of Well shape"""

            class ShapeModel3D:
                """3D model of Well shape"""

            # Production Properties / Metadata
            class Manufacturer:
                """Name of the Manufacturer """

            class ProductType:
                """Labware product Type"""

            class ModelNumber:
                """Labware model number"""

            class ProductNumber:
                """Manufacturer Product Number of the Labware"""

            # class Description:
            #     """Labware description. Possible applications/purpose for this labware could be also added here."""


            #  Relations
            # ===========

            # Measurement Classes
            # ====================

            # Basic ------

            class Labware(self.osolw.Device):
                """Labware is a utility device that all experiments are done with and which is not actively measuring. Examples: a container, a pipette tip, a reactor, ... """

                #is_a = [self.osom.hasProperty.some(self.osom.Time)]