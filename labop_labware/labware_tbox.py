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

            class Length(self.emmo.Length):
                """"Labware total length """
                physicalDimension = pl("T+1 L0 M0 I0 Θ0 N0 J0")
                wikipediaEntry = en("https://en.wikipedia.org/wiki/Length")

                # reference SI unit
                self.emmo.hasReferenceUnit = self.emmo.metre

                                

            class Width(self.emmo.Length):
                """Labware total width """
                physicalDimension = pl("T+1 L0 M0 I0 Θ0 N0 J0")
                wikipediaEntry = en("https://en.wikipedia.org/wiki/Width")

                # reference SI unit
                self.emmo.hasReferenceUnit = self.emmo.metre


            class Height(self.emmo.Length):
                """Labware total hight, without  any additions, like lids etc. """
                physicalDimension = pl("T+1 L0 M0 I0 Θ0 N0 J0")

                # reference SI unit
                self.emmo.hasReferenceUnit = self.emmo.metre



            class Volume(self.emmo.Volume):
                """Total Labware volume """
                physicalDimension = pl("T+1 L3 M0 I0 Θ0 N0 J0")


            class HightLidded(self.emmo.Length):
                """Labware total hight, with additions, like lids etc."""
                physicalDimension = pl("T+1 L0 M0 I0 Θ0 N0 J0")

            class HightStacked(self.emmo.Length):
                """Labware stacking height without any additions, like lids."""
                physicalDimension = pl("T+1 L0 M0 I0 Θ0 N0 J0")

            class HightStackedLidded(self.emmo.Length):
                """Labware stacking height with additions, like lids."""
                physicalDimension = pl("T+1 L0 M0 I0 Θ0 N0 J0")



            # Torque
            # ======
            class Torque(self.emmo.Torque):
                """Torque of a labware, e.g. for screw caps""" 
                # add quantity
                physicalDimension = pl("T+1 L2 M1 I0 Θ0 N0 J0")
                wikipediaEntry = en("https://en.wikipedia.org/wiki/Torque")


                # dimension
                # reference SI unit
  

            class Material(self.emmo.Material):
                """polymer, properties, like solvent tolerance, transperancy, ...."""
            
            class Color(self.emmo.Color):
                """Labware color"""

            class Liddable(self.emmo.Boolean):
                """container is liddable"""

            class Sealable(self.emmo.Boolean):
                """container is sealable"""

            # multiwell labware

            class NumRows(self.emmo.Integer):
                """Number of rows of container"""
            
            class NumCols(self.emmo.Integer) :
                """Number of columns of container"""
            
            class NumWells(self.emmo.Integer):
                """Number of wells - could be auto generated"""
            
            class WellDistRow(self.emmo.Length):
                """wWll-to-well distance in row direction"""
            
            class WellDistCol(sef.emmo.Length):
                """"Well-to-well distance in column direction"""

            # Well properties of labware with wells
            class DepthWell(self.emmo.Length):
                """Well total well depth=hight"""

            
            class ShapeWell:
                """Well overall / top well shape,e.g. round, square, buffeled,..."""
            
            class ShapeWellBottom:
                """Well, bottom shape, flat, round, conical-"""

            class TopRadiusXY(self.emmo.Length):
                """Well radius of a round well at the top opening in x-y plane."""

            class BottomRadiusXY(self.emmo.Length):
                """Radius of a round bottom in xy plane / direction."""

            class BottomRadiusZ(self.emmo.Length):
                """Radius of a round bottom in z (hight) direction."""

            class ConeAngle(self.emmo.Angle):
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


            # query for SI unit of a property
            
