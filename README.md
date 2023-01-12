<img src="containers.png" alt="Labware ontology slug" width="50%"/>

# Labware ontology
Labware ontology for use with [Laboratory Open Protocol language (LabOP)](https://github.com/Bioprotocols/labop).

The intent is to supply an ontology of OWL classes and individuals that can be used to specify required labwares for use in biology protocols specified in PAML.

There are OWL classes for concepts such as `Standard96Wellplate`.  These should be used to specify requirements (e.g., `Standard96WellPlate and ClearPlate`) in a protocol that may be met by multiple different sorts of plate.  OWL individuals are used for specific *types* of plate such as a Corning 3632 (`Corning3632`).  The decision was made to represent these basic types as Individuals so that it would be readily detectable when the process of choosing a matching labware was complete (one or more individuals have been found that match the requirements).

# Status

The labware ontology is very much in flux at the moment.  We provide a proof of concept of its utility by capturing  the contents of [Strateos](https://strateos.com)'s online catalog of labwares (Strateos is a prominent cloud lab).  We also provide a server, based on a Docker labware, that you can use to query the ontology, and a Python library for automating such queries.

**If you have questions** please post them in the "Discussions" tab, and we will try to answer them, and will move them to issues if they identify bugs or feature requests.

We first describe the server, which is build on Owlery, and then we discuss how to use the Python library that provides query servicing for the server.

## Important Note

Note that the final ontology IRI has still not been chosen: we are identifying how best to provide a stable IRI from which the ontology can be retrieved reliably.  If you are referring to this ontology, we strongly urge you to use a prefix definition (we use `cont`) for the ontology, so that any documents you create can be easily updated.

# The Labware Server
