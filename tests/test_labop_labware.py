#!/usr/bin/env python
"""Tests for `labop_labware` package."""
# pylint: disable=redefined-outer-name
from labop_labware import __version__

from labop_labware.labware_tbox import labop_Labware

def test_version():
    """Sample pytest test function."""
    assert __version__ == "0.0.1"

def test_labop_labware():
    """ testing OSOMeasurement
    """
    
    lolw = labop_Labware()

    lolw.define_ontology()

    assert lolw.osolw.NumWells.iri == 'http://www.oso.org/lolw/labware#NumWells'    
    


