@prefix : <URL_PREFIX/container-ontology.ttl#> .
@prefix om: <http://www.ontology-of-units-of-measure.org/resource/om-2/> .
@prefix owl: <http://www.w3.org/2002/07/owl#> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix xml: <http://www.w3.org/XML/1998/namespace> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .
@prefix cont: <URL_PREFIX/container-ontology.ttl#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix sbol: <http://sbols.org/v3#> .

<URL_PREFIX/container-ontology.ttl> rdf:type owl:Ontology ;
                                                                    owl:versionIRI <URL_PREFIX/container-ontology.ttl> ;
                                                                    owl:imports <http://sbols.org/v3> ,
                                                                                <URL_PREFIX/om-subset.ttl> ;
                                                                    om:abbreviation "cont:" ;
                                                                    rdfs:label "Container Ontology"@en .

#################################################################
#    Annotation properties
#################################################################

###  http://www.ontology-of-units-of-measure.org/resource/om-2/abbreviation
om:abbreviation rdf:type owl:AnnotationProperty .


#################################################################
#    Object Properties
#################################################################

###  http://www.ontology-of-units-of-measure.org/resource/om-2/hasQuantity
om:hasQuantity rdf:type owl:ObjectProperty .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#availableAt
cont:availableAt rdf:type owl:ObjectProperty ;
                 rdfs:domain cont:LabEquipment ;
                 rdfs:range cont:Lab .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#catalogEntryOf
cont:catalogEntryOf rdf:type owl:ObjectProperty ;
                    owl:inverseOf cont:hasCatalogEntry ;
                    rdfs:domain cont:CatalogEntry ;
                    rdfs:range cont:LabEquipment .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#centrifugeResistance
cont:centrifugeResistance rdf:type owl:ObjectProperty ;
                          rdfs:domain cont:Container ;
                          rdfs:range [ owl:intersectionOf ( om:Measure
                                                            [ rdf:type owl:Restriction ;
                                                              owl:onProperty cont:measureType ;
                                                              owl:allValuesFrom om:Force
                                                            ]
                                                          ) ;
                                       rdf:type owl:Class
                                     ] ;
                          rdfs:comment "What is the maximum force the container can (or must) resist (for the assay/protocol if this is defined there)."^^xsd:string ;
                          rdfs:label "centrifugeResistance" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#clearanceToPlateBottom
cont:clearanceToPlateBottom rdf:type owl:ObjectProperty ;
                            rdfs:subPropertyOf cont:height ;
                            rdfs:comment "The minimum clearance from the resting plane to the plane of the bottom external surface of the wells."@en ;
                            rdfs:label "clearanceToPlateBottom" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#coating
cont:coating rdf:type owl:ObjectProperty ;
             rdfs:subPropertyOf owl:topObjectProperty ;
             rdfs:domain cont:Container ;
             rdfs:range cont:CoatingMaterial ;
             rdfs:label "coating" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#columnLabels
cont:columnLabels rdf:type owl:ObjectProperty ,
                           owl:FunctionalProperty ;
                  rdfs:domain cont:Plate ;
                  rdfs:comment "A sequence listing the labels assigned to the wells in each column."@en ;
                  rdfs:label "column labels"@en .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#compatibleCentrifuges
cont:compatibleCentrifuges rdf:type owl:ObjectProperty ;
                           rdfs:subPropertyOf cont:compatibleLabEquipment ;
                           rdfs:domain cont:Container ;
                           rdfs:comment "Centrifuge TYPES with which this container is compatible."^^xsd:string ;
                           rdfs:label "compatibleCentrifuges" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#compatibleLabEquipment
cont:compatibleLabEquipment rdf:type owl:ObjectProperty ;
                            rdfs:label "compatibleLabEquipment" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#compatiblePlateReaders
cont:compatiblePlateReaders rdf:type owl:ObjectProperty ;
                            rdfs:subPropertyOf cont:compatibleLabEquipment ;
                            rdfs:label "compatiblePlateReaders" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#cornerRadius
cont:cornerRadius rdf:type owl:ObjectProperty ;
                  rdfs:subPropertyOf cont:geometricProperty ;
                  rdfs:label "cornerRadius" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#diameter
cont:diameter rdf:type owl:ObjectProperty ;
              rdfs:subPropertyOf cont:geometricProperty ;
              rdfs:range om:Measure ,
                         [ rdf:type owl:Restriction ;
                           owl:onProperty om:hasQuantity ;
                           owl:allValuesFrom om:Diameter
                         ] ;
              rdfs:label "diameter" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#equipmentVendor
cont:equipmentVendor rdf:type owl:ObjectProperty ;
                     rdfs:domain cont:LabEquipment ;
                     rdfs:range cont:VendorFirm .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#geometricProperty
cont:geometricProperty rdf:type owl:ObjectProperty ;
                       rdfs:domain cont:Container ;
                       rdfs:range om:Measure ;
                       rdfs:label "geometricProperty" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#hasCatalogEntry
cont:hasCatalogEntry rdf:type owl:ObjectProperty ;
                     rdfs:subPropertyOf owl:topObjectProperty ;
                     rdfs:domain cont:LabEquipment ;
                     rdfs:range cont:CatalogEntry ;
                     rdfs:label "hasCatalogEntry" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#hasColor
cont:hasColor rdf:type owl:ObjectProperty ;
              rdfs:subPropertyOf cont:qualitativeProperty ;
              rdfs:range cont:Color .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#hasVendorFirm
cont:hasVendorFirm rdf:type owl:ObjectProperty ;
                   rdfs:subPropertyOf owl:topObjectProperty ;
                   rdfs:domain cont:CatalogEntry ;
                   rdfs:range cont:VendorFirm ;
                   rdfs:label "hasVendorFirm" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#hasWellBottomShape
cont:hasWellBottomShape rdf:type owl:ObjectProperty ;
                        rdfs:subPropertyOf cont:qualitativeProperty ;
                        rdfs:label "hasWellBottomShape"^^xsd:string .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#height
cont:height rdf:type owl:ObjectProperty ;
            rdfs:subPropertyOf cont:geometricProperty ;
            rdfs:range [ owl:intersectionOf ( om:Measure
                                              [ rdf:type owl:Restriction ;
                                                owl:onProperty cont:measureType ;
                                                owl:allValuesFrom om:Height
                                              ]
                                            ) ;
                         rdf:type owl:Class
                       ] ;
            rdfs:label "height" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#length
cont:length rdf:type owl:ObjectProperty ;
            rdfs:subPropertyOf cont:geometricProperty ;
            rdfs:label "length" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#lengthAtEdge
cont:lengthAtEdge rdf:type owl:ObjectProperty ;
                  rdfs:subPropertyOf cont:length ;
                  rdfs:comment """ANSI SLAS spec 1.2004 (plate footprint spec) specifies different tolerances for the length within 12.7mm of the edge and in general, the former being tighter than the latter.

This property is for the length within 12.7 mm of the edge; the other property is lengthOverall.""" ;
                  rdfs:label "lengthAtEdge" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#lengthOverall
cont:lengthOverall rdf:type owl:ObjectProperty ;
                   rdfs:subPropertyOf cont:length ;
                   rdfs:comment """ANSI SLAS spec 1.2004 (plate footprint spec) specifies different tolerances for the length within 12.7mm of the edge and in general, the former being tighter than the latter.

This property is for the length anywhere on the plate (the more permissive constraint); the other property is lengthAtEdge."""@en ;
                   rdfs:label "lengthOverall" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#measureType
cont:measureType rdf:type owl:ObjectProperty ;
                 rdfs:domain om:Measure ;
                 rdfs:range om:Quantity ;
                 rdfs:label "measureType" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#overallPlateHeight
cont:overallPlateHeight rdf:type owl:ObjectProperty ;
                        rdfs:subPropertyOf cont:height ;
                        owl:propertyDisjointWith cont:plateHeight ;
                        rdfs:comment "The overall plate height, measured from ... the resting plane ... to the maximum protrusion of the plate."@en ;
                        rdfs:label "overallPlateHeight" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#plateHeight
cont:plateHeight rdf:type owl:ObjectProperty ;
                 rdfs:subPropertyOf cont:height ;
                 rdfs:domain cont:Plate ;
                 rdfs:comment "The plate height measured from ... the resting plane... to the maximum protrusion of the perimeter wells."@en ;
                 rdfs:label "plateHeight" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#qualitativeProperty
cont:qualitativeProperty rdf:type owl:ObjectProperty ;
                         rdfs:domain cont:Container .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#rowLabels
cont:rowLabels rdf:type owl:ObjectProperty ,
                        owl:FunctionalProperty ;
               rdfs:domain cont:Plate ;
               rdfs:comment "A sequence listing the labels assigned to the wells in each row."@en ;
               rdfs:label "row labels"@en .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#wellDepth
cont:wellDepth rdf:type owl:ObjectProperty ;
               rdfs:subPropertyOf cont:geometricProperty ;
               rdf:type owl:FunctionalProperty ;
               rdfs:domain cont:Container ;
               rdfs:range [ owl:intersectionOf ( om:Measure
                                                 [ rdf:type owl:Restriction ;
                                                   owl:onProperty cont:measureType ;
                                                   owl:hasValue om:Depth
                                                 ]
                                               ) ;
                            rdf:type owl:Class
                          ] ;
               rdfs:label "wellDepth" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#wellVolume
cont:wellVolume rdf:type owl:ObjectProperty ;
                rdfs:subPropertyOf cont:geometricProperty ;
                rdfs:label "wellVolume" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#width
cont:width rdf:type owl:ObjectProperty ;
           rdfs:subPropertyOf cont:geometricProperty ;
           rdfs:label "width" .


#################################################################
#    Data properties
#################################################################

###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#catalogNumber
cont:catalogNumber rdf:type owl:DatatypeProperty ;
                   rdfs:subPropertyOf owl:topDataProperty ;
                   rdfs:domain cont:CatalogEntry ;
                   rdfs:range xsd:string ;
                   rdfs:label "catalogNumber" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#colorName
cont:colorName rdf:type owl:DatatypeProperty ;
               rdfs:domain cont:Color ;
               rdfs:range xsd:string .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#columnCount
cont:columnCount rdf:type owl:DatatypeProperty ;
                 rdfs:subPropertyOf cont:containerDataProperty ;
                 rdfs:domain cont:Plate ;
                 rdfs:range xsd:positiveInteger ;
                 rdfs:label "columnCount" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#containerDataProperty
cont:containerDataProperty rdf:type owl:DatatypeProperty ;
                           rdfs:domain cont:Container ;
                           rdfs:label "containerDataProperty" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#isOpticallyTransparent
cont:isOpticallyTransparent rdf:type owl:DatatypeProperty ;
                            rdfs:subPropertyOf cont:containerDataProperty ;
                            rdfs:domain cont:Container ;
                            rdfs:range xsd:boolean ;
                            rdfs:label "isOpticallyTransparent" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#isSLAS1-2004compliant
cont:isSLAS1-2004compliant rdf:type owl:DatatypeProperty ;
                           rdfs:subPropertyOf cont:containerDataProperty ;
                           rdfs:range xsd:boolean ;
                           rdfs:label "isSLAS1-2004compliant" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#isStackable
cont:isStackable rdf:type owl:DatatypeProperty ;
                 rdfs:subPropertyOf cont:containerDataProperty ;
                 rdfs:range xsd:boolean .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#labName
cont:labName rdf:type owl:DatatypeProperty ;
             rdfs:domain cont:Lab ;
             rdfs:range xsd:string .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#rowCount
cont:rowCount rdf:type owl:DatatypeProperty ;
              rdfs:subPropertyOf cont:containerDataProperty ;
              rdfs:domain cont:Plate ;
              rdfs:range xsd:positiveInteger .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#vendorName
cont:vendorName rdf:type owl:DatatypeProperty ;
                rdfs:domain [ rdf:type owl:Class ;
                              owl:unionOf ( cont:LabEquipment
                                            cont:VendorFirm
                                          )
                            ] ;
                rdfs:range xsd:string .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#wellCount
cont:wellCount rdf:type owl:DatatypeProperty ;
               rdfs:subPropertyOf cont:containerDataProperty ;
               rdfs:domain cont:Plate ;
               rdfs:range xsd:positiveInteger .


#################################################################
#    Classes
#################################################################

###  http://www.ontology-of-units-of-measure.org/resource/om-2/Force
om:Force rdf:type owl:Class .


###  http://www.ontology-of-units-of-measure.org/resource/om-2/Measure
om:Measure rdfs:subClassOf [ owl:intersectionOf ( [ rdf:type owl:Restriction ;
                                                    owl:onProperty om:hasDimension ;
                                                    owl:minCardinality "1"^^xsd:nonNegativeInteger
                                                  ]
                                                  [ rdf:type owl:Restriction ;
                                                    owl:onProperty om:hasDimension ;
                                                    owl:maxCardinality "1"^^xsd:nonNegativeInteger
                                                  ]
                                                ) ;
                             rdf:type owl:Class
                           ] ,
                           [ rdf:type owl:Restriction ;
                             owl:onProperty om:hasNumericalValue ;
                             owl:minCardinality "1"^^xsd:nonNegativeInteger
                           ] ,
                           [ rdf:type owl:Restriction ;
                             owl:onProperty om:hasNumericalValue ;
                             owl:maxCardinality "1"^^xsd:nonNegativeInteger
                           ] .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#CatalogEntry
cont:CatalogEntry rdf:type owl:Class ;
                  rdfs:subClassOf cont:ContainerRoot ;
                  rdfs:label "CatalogEntry" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#Centrifuge
cont:Centrifuge rdf:type owl:Class ;
                rdfs:subClassOf cont:LabMachinery .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#Clear
cont:Clear rdf:type owl:Class ;
           rdfs:subClassOf cont:Color .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#ClearPlate
cont:ClearPlate rdf:type owl:Class ;
                owl:equivalentClass [ owl:intersectionOf ( cont:Plate
                                                           [ rdf:type owl:Restriction ;
                                                             owl:onProperty cont:hasColor ;
                                                             owl:someValuesFrom cont:Clear
                                                           ]
                                                         ) ;
                                      rdf:type owl:Class
                                    ] ;
                rdfs:subClassOf cont:Plate .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#CoatingMaterial
cont:CoatingMaterial rdf:type owl:Class ;
                     rdfs:subClassOf cont:ContainerRoot ;
                     rdfs:label "CoatingMaterial" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#Color
cont:Color rdf:type owl:Class ;
           rdfs:subClassOf cont:ContainerRoot ;
           rdfs:comment "Enumeration class of optical properties for well plates." ;
           rdfs:label "OpticalProperty" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#Container
cont:Container rdf:type owl:Class ;
               rdfs:subClassOf cont:LabEquipment ;
               rdfs:label "Container" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#ContainerRoot
cont:ContainerRoot rdf:type owl:Class ;
                   rdfs:subClassOf sbol:Identified ;
                   rdfs:comment "This is the root class for the classes defined in the Container Ontology. It is introduced to be the bridge between the container ontology and the SBOL Ontology. In turn, this connects to the sbol:Identified class, in order to make it possible for the container ontology classes to be translated into Python classes by the SBOL factory." ;
                   rdfs:label "ContainerRoot" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#Lab
cont:Lab rdf:type owl:Class ;
         rdfs:subClassOf cont:ContainerRoot ,
                         [ rdf:type owl:Restriction ;
                           owl:onProperty cont:labName ;
                           owl:minCardinality "1"^^xsd:nonNegativeInteger
                         ] ;
         rdfs:comment "This Class is intended to capture a location that has containers, so that one will often be asking for a container that meets some requirements and is available at a particular Lab (or possibly a Lab that has some container meeting a requirement)."@en ;
         rdfs:label "Lab" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#LabEquipment
cont:LabEquipment rdf:type owl:Class ;
                  rdfs:subClassOf cont:ContainerRoot ;
                  rdfs:label "LabEquipment" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#LabMachinery
cont:LabMachinery rdf:type owl:Class ;
                  rdfs:subClassOf cont:LabEquipment ;
                  rdfs:comment "This is likely a poor name, but it is intended to refer to items of equipment that act upon containers and/or their contents." ;
                  rdfs:label "LabMachinery" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#Opaque
cont:Opaque rdf:type owl:Class ;
            rdfs:subClassOf cont:Color .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#OpaquePlate
cont:OpaquePlate rdf:type owl:Class ;
                 owl:equivalentClass [ owl:intersectionOf ( cont:Plate
                                                            [ rdf:type owl:Restriction ;
                                                              owl:onProperty cont:hasColor ;
                                                              owl:someValuesFrom cont:Opaque
                                                            ]
                                                          ) ;
                                       rdf:type owl:Class
                                     ] ;
                 rdfs:subClassOf cont:Plate .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#Plate
cont:Plate rdf:type owl:Class ;
           rdfs:subClassOf cont:Container ;
           owl:disjointWith cont:Well ;
           rdfs:label "Plate" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#PlateReader
cont:PlateReader rdf:type owl:Class ;
                 rdfs:subClassOf cont:LabMachinery .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#SLAS-1-2004
cont:SLAS-1-2004 rdf:type owl:Class ;
                 owl:equivalentClass [ owl:intersectionOf ( [ rdf:type owl:Restriction ;
                                                              owl:onProperty cont:cornerRadius ;
                                                              owl:someValuesFrom [ owl:intersectionOf ( om:Measure
                                                                                                        [ rdf:type owl:Restriction ;
                                                                                                          owl:onProperty om:hasUnit ;
                                                                                                          owl:hasValue om:millimetre
                                                                                                        ]
                                                                                                        [ rdf:type owl:Restriction ;
                                                                                                          owl:onProperty om:hasNumericalValue ;
                                                                                                          owl:allValuesFrom [ rdf:type rdfs:Datatype ;
                                                                                                                              owl:onDatatype xsd:float ;
                                                                                                                              owl:withRestrictions ( [ xsd:minInclusive "1.58"^^xsd:float
                                                                                                                                                     ]
                                                                                                                                                     [ xsd:maxInclusive "4.78"^^xsd:float
                                                                                                                                                     ]
                                                                                                                                                   )
                                                                                                                            ]
                                                                                                        ]
                                                                                                      ) ;
                                                                                   rdf:type owl:Class
                                                                                 ]
                                                            ]
                                                            [ rdf:type owl:Restriction ;
                                                              owl:onProperty cont:length ;
                                                              owl:someValuesFrom [ owl:intersectionOf ( om:Measure
                                                                                                        [ rdf:type owl:Restriction ;
                                                                                                          owl:onProperty om:hasUnit ;
                                                                                                          owl:hasValue om:millimetre
                                                                                                        ]
                                                                                                        [ rdf:type owl:Restriction ;
                                                                                                          owl:onProperty om:hasNumericalValue ;
                                                                                                          owl:allValuesFrom [ rdf:type rdfs:Datatype ;
                                                                                                                              owl:onDatatype xsd:float ;
                                                                                                                              owl:withRestrictions ( [ xsd:minInclusive "127.51"^^xsd:float
                                                                                                                                                     ]
                                                                                                                                                     [ xsd:maxInclusive "128.01"^^xsd:float
                                                                                                                                                     ]
                                                                                                                                                   )
                                                                                                                            ]
                                                                                                        ]
                                                                                                      ) ;
                                                                                   rdf:type owl:Class
                                                                                 ]
                                                            ]
                                                            [ rdf:type owl:Restriction ;
                                                              owl:onProperty cont:width ;
                                                              owl:someValuesFrom [ owl:intersectionOf ( om:Measure
                                                                                                        [ rdf:type owl:Restriction ;
                                                                                                          owl:onProperty om:hasUnit ;
                                                                                                          owl:hasValue om:millimetre
                                                                                                        ]
                                                                                                        [ rdf:type owl:Restriction ;
                                                                                                          owl:onProperty om:hasNumericalValue ;
                                                                                                          owl:allValuesFrom [ rdf:type rdfs:Datatype ;
                                                                                                                              owl:onDatatype xsd:float ;
                                                                                                                              owl:withRestrictions ( [ xsd:minInclusive "85.23"^^xsd:float
                                                                                                                                                     ]
                                                                                                                                                     [ xsd:maxInclusive "85.73"^^xsd:float
                                                                                                                                                     ]
                                                                                                                                                   )
                                                                                                                            ]
                                                                                                        ]
                                                                                                      ) ;
                                                                                   rdf:type owl:Class
                                                                                 ]
                                                            ]
                                                          ) ;
                                       rdf:type owl:Class
                                     ] ;
                 rdfs:subClassOf cont:Plate ;
                 rdfs:comment "SLAS 1-2004 specifies the microplate footprint standard"^^xsd:string ;
                 rdfs:label "SLAS-1-2004" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#SLAS-2-2004-4
cont:SLAS-2-2004-4 rdf:type owl:Class ;
                   owl:equivalentClass [ owl:intersectionOf ( cont:SLAS-2-2004-4-1
                                                              cont:SLAS-2-2004-4-2
                                                            ) ;
                                         rdf:type owl:Class
                                       ] ;
                   rdfs:subClassOf cont:Plate .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#SLAS-2-2004-4-1
cont:SLAS-2-2004-4-1 rdf:type owl:Class ;
                     owl:equivalentClass [ owl:intersectionOf ( cont:SLAS-2-2004-4-2
                                                                [ rdf:type owl:Restriction ;
                                                                  owl:onProperty cont:clearanceToPlateBottom ;
                                                                  owl:someValuesFrom [ owl:intersectionOf ( om:Measure
                                                                                                            [ rdf:type owl:Restriction ;
                                                                                                              owl:onProperty om:hasUnit ;
                                                                                                              owl:hasValue om:millimetre
                                                                                                            ]
                                                                                                            [ rdf:type owl:Restriction ;
                                                                                                              owl:onProperty om:hasNumericalValue ;
                                                                                                              owl:allValuesFrom [ rdf:type rdfs:Datatype ;
                                                                                                                                  owl:onDatatype xsd:float ;
                                                                                                                                  owl:withRestrictions ( [ xsd:maxInclusive "1.0"^^xsd:float
                                                                                                                                                         ]
                                                                                                                                                       )
                                                                                                                                ]
                                                                                                            ]
                                                                                                          ) ;
                                                                                       rdf:type owl:Class
                                                                                     ]
                                                                ]
                                                              ) ;
                                           rdf:type owl:Class
                                         ] ;
                     rdfs:subClassOf cont:Plate ;
                     rdfs:comment "Specification of Microplates meeting the specification of ANSI SLAS-2-2004, R2012, based on section 4.1, \"Typical Height with Clearance.\""^^xsd:string ;
                     rdfs:label "SLAS 2-2004 Typical Height with Clearance"^^xsd:string .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#SLAS-2-2004-4-2
cont:SLAS-2-2004-4-2 rdf:type owl:Class ;
                     owl:equivalentClass [ owl:intersectionOf ( cont:Plate
                                                                [ rdf:type owl:Class ;
                                                                  owl:unionOf ( [ rdf:type owl:Restriction ;
                                                                                  owl:onProperty cont:wellCount ;
                                                                                  owl:hasValue 1536
                                                                                ]
                                                                                [ rdf:type owl:Restriction ;
                                                                                  owl:onProperty cont:wellCount ;
                                                                                  owl:hasValue 384
                                                                                ]
                                                                                [ rdf:type owl:Restriction ;
                                                                                  owl:onProperty cont:wellCount ;
                                                                                  owl:hasValue 96
                                                                                ]
                                                                              )
                                                                ]
                                                                [ rdf:type owl:Restriction ;
                                                                  owl:onProperty cont:overallPlateHeight ;
                                                                  owl:someValuesFrom [ owl:intersectionOf ( om:Measure
                                                                                                            [ rdf:type owl:Restriction ;
                                                                                                              owl:onProperty om:hasUnit ;
                                                                                                              owl:hasValue om:millimetre
                                                                                                            ]
                                                                                                            [ rdf:type owl:Restriction ;
                                                                                                              owl:onProperty om:hasNumericalValue ;
                                                                                                              owl:allValuesFrom [ rdf:type rdfs:Datatype ;
                                                                                                                                  owl:onDatatype xsd:float ;
                                                                                                                                  owl:withRestrictions ( [ xsd:minInclusive "13.59"^^xsd:float
                                                                                                                                                         ]
                                                                                                                                                         [ xsd:maxInclusive "15.11"^^xsd:float
                                                                                                                                                         ]
                                                                                                                                                       )
                                                                                                                                ]
                                                                                                            ]
                                                                                                          ) ;
                                                                                       rdf:type owl:Class
                                                                                     ]
                                                                ]
                                                                [ rdf:type owl:Restriction ;
                                                                  owl:onProperty cont:plateHeight ;
                                                                  owl:someValuesFrom [ owl:intersectionOf ( om:Measure
                                                                                                            [ rdf:type owl:Restriction ;
                                                                                                              owl:onProperty om:hasUnit ;
                                                                                                              owl:hasValue om:millimetre
                                                                                                            ]
                                                                                                            [ rdf:type owl:Restriction ;
                                                                                                              owl:onProperty om:hasNumericalValue ;
                                                                                                              owl:allValuesFrom [ rdf:type rdfs:Datatype ;
                                                                                                                                  owl:onDatatype xsd:float ;
                                                                                                                                  owl:withRestrictions ( [ xsd:minInclusive "14.1"^^xsd:float
                                                                                                                                                         ]
                                                                                                                                                         [ xsd:maxInclusive "14.6"^^xsd:float
                                                                                                                                                         ]
                                                                                                                                                       )
                                                                                                                                ]
                                                                                                            ]
                                                                                                          ) ;
                                                                                       rdf:type owl:Class
                                                                                     ]
                                                                ]
                                                              ) ;
                                           rdf:type owl:Class
                                         ] ;
                     rdfs:subClassOf cont:Plate ;
                     rdfs:comment "Specification of Microplates meeting the specification of ANSI SLAS-2-2004, R2012, based on section 4.2, \"Typical Height.\""^^xsd:string ;
                     rdfs:label "SLAS 2-2004 Typical Height with Clearance"^^xsd:string .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#SLAS-4-2004
cont:SLAS-4-2004 rdf:type owl:Class ;
                 rdfs:subClassOf cont:Plate ;
                 owl:disjointUnionOf ( cont:SLAS_4-2004_1536_Well_Plate
                                       cont:SLAS_4-2004_384_Well_Plate
                                       cont:SLAS_4-2004_96_Well_Plate
                                     ) ;
                 rdfs:comment "We do not model the well placement in detail, simply specifying whether or not it complies with 4-2004."^^xsd:string ;
                 rdfs:label "SLAS 4-2004 Well Placement standard"^^xsd:string .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#SLAS_4-2004_1536_Well_Plate
cont:SLAS_4-2004_1536_Well_Plate rdf:type owl:Class ;
                                 owl:equivalentClass cont:Standard1536WellPlate ,
                                                     [ owl:intersectionOf ( [ rdf:type owl:Restriction ;
                                                                              owl:onProperty cont:columnCount ;
                                                                              owl:hasValue 48
                                                                            ]
                                                                            [ rdf:type owl:Restriction ;
                                                                              owl:onProperty cont:rowCount ;
                                                                              owl:hasValue 32
                                                                            ]
                                                                            [ rdf:type owl:Restriction ;
                                                                              owl:onProperty cont:wellCount ;
                                                                              owl:hasValue 1536
                                                                            ]
                                                                          ) ;
                                                       rdf:type owl:Class
                                                     ] ;
                                 rdfs:subClassOf cont:SLAS-4-2004 .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#SLAS_4-2004_384_Well_Plate
cont:SLAS_4-2004_384_Well_Plate rdf:type owl:Class ;
                                owl:equivalentClass cont:Standard384WellPlate ,
                                                    [ owl:intersectionOf ( [ rdf:type owl:Restriction ;
                                                                             owl:onProperty cont:columnCount ;
                                                                             owl:hasValue 24
                                                                           ]
                                                                           [ rdf:type owl:Restriction ;
                                                                             owl:onProperty cont:rowCount ;
                                                                             owl:hasValue 16
                                                                           ]
                                                                           [ rdf:type owl:Restriction ;
                                                                             owl:onProperty cont:wellCount ;
                                                                             owl:hasValue 384
                                                                           ]
                                                                         ) ;
                                                      rdf:type owl:Class
                                                    ] ;
                                rdfs:subClassOf cont:SLAS-4-2004 .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#SLAS_4-2004_96_Well_Plate
cont:SLAS_4-2004_96_Well_Plate rdf:type owl:Class ;
                               owl:equivalentClass [ owl:intersectionOf ( cont:Plate
                                                                          [ rdf:type owl:Restriction ;
                                                                            owl:onProperty cont:columnCount ;
                                                                            owl:hasValue 12
                                                                          ]
                                                                          [ rdf:type owl:Restriction ;
                                                                            owl:onProperty cont:rowCount ;
                                                                            owl:hasValue 8
                                                                          ]
                                                                          [ rdf:type owl:Restriction ;
                                                                            owl:onProperty cont:wellCount ;
                                                                            owl:hasValue 96
                                                                          ]
                                                                        ) ;
                                                     rdf:type owl:Class
                                                   ] ;
                               rdfs:subClassOf cont:SLAS-4-2004 .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#Standard1536WellPlate
cont:Standard1536WellPlate rdf:type owl:Class ;
                           rdfs:subClassOf cont:SLAS-4-2004 .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#Standard384WellPlate
cont:Standard384WellPlate rdf:type owl:Class ;
                          rdfs:subClassOf cont:SLAS-4-2004 .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#Standard96WellPlate
cont:Standard96WellPlate rdf:type owl:Class ;
                         owl:equivalentClass [ owl:intersectionOf ( cont:Plate
                                                                    cont:SLAS_4-2004_96_Well_Plate
                                                                    [ rdf:type owl:Restriction ;
                                                                      owl:onProperty cont:height ;
                                                                      owl:someValuesFrom [ owl:intersectionOf ( [ rdf:type owl:Restriction ;
                                                                                                                  owl:onProperty om:hasDimension ;
                                                                                                                  owl:hasValue om:millimetre
                                                                                                                ]
                                                                                                                [ rdf:type owl:Restriction ;
                                                                                                                  owl:onProperty om:hasNumericalValue ;
                                                                                                                  owl:someValuesFrom [ rdf:type rdfs:Datatype ;
                                                                                                                                       owl:onDatatype xsd:float ;
                                                                                                                                       owl:withRestrictions ( [ xsd:minInclusive "13.5"^^xsd:float
                                                                                                                                                              ]
                                                                                                                                                              [ xsd:maxInclusive "15.25"^^xsd:float
                                                                                                                                                              ]
                                                                                                                                                            )
                                                                                                                                     ]
                                                                                                                ]
                                                                                                              ) ;
                                                                                           rdf:type owl:Class
                                                                                         ]
                                                                    ]
                                                                  ) ;
                                               rdf:type owl:Class
                                             ] ;
                         rdfs:comment "This is meant to capture the intuitive notion of a standard (i.e., not deep) 96 well plate." ;
                         rdfs:label "Standard 96 Well Plate" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#ThermoFisherCatalogEntry
cont:ThermoFisherCatalogEntry rdf:type owl:Class ;
                              owl:equivalentClass [ owl:intersectionOf ( cont:CatalogEntry
                                                                         [ rdf:type owl:Restriction ;
                                                                           owl:onProperty cont:hasVendorFirm ;
                                                                           owl:hasValue cont:ThermoFisher
                                                                         ]
                                                                       ) ;
                                                    rdf:type owl:Class
                                                  ] ;
                              rdfs:subClassOf cont:CatalogEntry .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#VWRCentrifugePCRPlateSpec
cont:VWRCentrifugePCRPlateSpec rdf:type owl:Class ;
                               owl:equivalentClass [ rdf:type owl:Restriction ;
                                                     owl:onProperty cont:wellDepth ;
                                                     owl:someValuesFrom [ owl:intersectionOf ( om:Measure
                                                                                               [ rdf:type owl:Restriction ;
                                                                                                 owl:onProperty om:hasUnit ;
                                                                                                 owl:hasValue om:millimetre
                                                                                               ]
                                                                                               [ rdf:type owl:Restriction ;
                                                                                                 owl:onProperty cont:measureType ;
                                                                                                 owl:hasValue om:Depth
                                                                                               ]
                                                                                               [ rdf:type owl:Restriction ;
                                                                                                 owl:onProperty om:hasNumericalValue ;
                                                                                                 owl:hasValue "20.1"^^xsd:float
                                                                                               ]
                                                                                             ) ;
                                                                          rdf:type owl:Class
                                                                        ]
                                                   ] ;
                               rdfs:label "VWRCentrifugePCRPlateSpec" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#VendorFirm
cont:VendorFirm rdf:type owl:Class ;
                rdfs:subClassOf cont:ContainerRoot ,
                                [ rdf:type owl:Restriction ;
                                  owl:onProperty cont:vendorName ;
                                  owl:minCardinality "1"^^xsd:nonNegativeInteger
                                ] ;
                rdfs:label "VendorFirm" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#Well
cont:Well rdf:type owl:Class ;
          rdfs:subClassOf cont:Container ;
          rdfs:label "Well" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#WellShape
cont:WellShape rdf:type owl:Class ;
               owl:equivalentClass [ rdf:type owl:Class ;
                                     owl:oneOf ( cont:flatBottom
                                                 cont:roundBottom
                                                 cont:veeBottom
                                               )
                                   ] ;
               rdfs:subClassOf cont:ContainerRoot ;
               rdfs:comment "An enumeration class of different qualitative shapes of well bottoms. Note that this construct is not especially elaboration tolerant: users will not be able to add their own well shapes easily." ;
               rdfs:label "WellShape" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#ThermoFisher/EnduraPlate_96Well
<https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#ThermoFisher/EnduraPlate_96Well> rdf:type owl:Class ;
                                                                                                   rdfs:subClassOf cont:Plate ,
                                                                                                                   cont:SLAS_4-2004_96_Well_Plate ,
                                                                                                                   [ owl:intersectionOf ( [ rdf:type owl:Restriction ;
                                                                                                                                            owl:onProperty cont:columnCount ;
                                                                                                                                            owl:hasValue 12
                                                                                                                                          ]
                                                                                                                                          [ rdf:type owl:Restriction ;
                                                                                                                                            owl:onProperty cont:rowCount ;
                                                                                                                                            owl:hasValue 8
                                                                                                                                          ]
                                                                                                                                        ) ;
                                                                                                                     rdf:type owl:Class
                                                                                                                   ] ,
                                                                                                                   [ rdf:type owl:Restriction ;
                                                                                                                     owl:onProperty cont:cornerRadius ;
                                                                                                                     owl:someValuesFrom [ owl:intersectionOf ( om:Measure
                                                                                                                                                               [ rdf:type owl:Restriction ;
                                                                                                                                                                 owl:onProperty om:hasUnit ;
                                                                                                                                                                 owl:hasValue om:millimetre
                                                                                                                                                               ]
                                                                                                                                                               [ rdf:type owl:Restriction ;
                                                                                                                                                                 owl:onProperty om:hasNumericalValue ;
                                                                                                                                                                 owl:hasValue 4.0
                                                                                                                                                               ]
                                                                                                                                                             ) ;
                                                                                                                                          rdf:type owl:Class
                                                                                                                                        ]
                                                                                                                   ] ,
                                                                                                                   [ rdf:type owl:Restriction ;
                                                                                                                     owl:onProperty cont:height ;
                                                                                                                     owl:someValuesFrom [ owl:intersectionOf ( om:Measure
                                                                                                                                                               [ rdf:type owl:Restriction ;
                                                                                                                                                                 owl:onProperty om:hasUnit ;
                                                                                                                                                                 owl:hasValue om:millimetre
                                                                                                                                                               ]
                                                                                                                                                               [ rdf:type owl:Restriction ;
                                                                                                                                                                 owl:onProperty om:hasNumericalValue ;
                                                                                                                                                                 owl:hasValue "20.1"^^xsd:float
                                                                                                                                                               ]
                                                                                                                                                             ) ;
                                                                                                                                          rdf:type owl:Class
                                                                                                                                        ]
                                                                                                                   ] ,
                                                                                                                   [ rdf:type owl:Restriction ;
                                                                                                                     owl:onProperty cont:length ;
                                                                                                                     owl:someValuesFrom [ owl:intersectionOf ( om:Measure
                                                                                                                                                               [ rdf:type owl:Restriction ;
                                                                                                                                                                 owl:onProperty om:hasUnit ;
                                                                                                                                                                 owl:hasValue om:millimetre
                                                                                                                                                               ]
                                                                                                                                                               [ rdf:type owl:Restriction ;
                                                                                                                                                                 owl:onProperty om:hasNumericalValue ;
                                                                                                                                                                 owl:someValuesFrom [ rdf:type rdfs:Datatype ;
                                                                                                                                                                                      owl:onDatatype xsd:float ;
                                                                                                                                                                                      owl:withRestrictions ( [ xsd:minInclusive "127.26"^^xsd:float
                                                                                                                                                                                                             ]
                                                                                                                                                                                                             [ xsd:maxInclusive "128.26"^^xsd:float
                                                                                                                                                                                                             ]
                                                                                                                                                                                                           )
                                                                                                                                                                                    ]
                                                                                                                                                               ]
                                                                                                                                                             ) ;
                                                                                                                                          rdf:type owl:Class
                                                                                                                                        ]
                                                                                                                   ] ,
                                                                                                                   [ rdf:type owl:Restriction ;
                                                                                                                     owl:onProperty cont:plateHeight ;
                                                                                                                     owl:someValuesFrom [ owl:intersectionOf ( om:Measure
                                                                                                                                                               [ rdf:type owl:Restriction ;
                                                                                                                                                                 owl:onProperty om:hasUnit ;
                                                                                                                                                                 owl:hasValue om:millimetre
                                                                                                                                                               ]
                                                                                                                                                               [ rdf:type owl:Restriction ;
                                                                                                                                                                 owl:onProperty om:hasNumericalValue ;
                                                                                                                                                                 owl:hasValue 7.50
                                                                                                                                                               ]
                                                                                                                                                             ) ;
                                                                                                                                          rdf:type owl:Class
                                                                                                                                        ]
                                                                                                                   ] ,
                                                                                                                   [ rdf:type owl:Restriction ;
                                                                                                                     owl:onProperty cont:wellDepth ;
                                                                                                                     owl:someValuesFrom [ owl:intersectionOf ( om:Measure
                                                                                                                                                               [ rdf:type owl:Restriction ;
                                                                                                                                                                 owl:onProperty om:hasUnit ;
                                                                                                                                                                 owl:hasValue om:millimetre
                                                                                                                                                               ]
                                                                                                                                                               [ rdf:type owl:Restriction ;
                                                                                                                                                                 owl:onProperty cont:measureType ;
                                                                                                                                                                 owl:hasValue om:Depth
                                                                                                                                                               ]
                                                                                                                                                               [ rdf:type owl:Restriction ;
                                                                                                                                                                 owl:onProperty om:hasNumericalValue ;
                                                                                                                                                                 owl:hasValue "20.1"^^xsd:float
                                                                                                                                                               ]
                                                                                                                                                             ) ;
                                                                                                                                          rdf:type owl:Class
                                                                                                                                        ]
                                                                                                                   ] ,
                                                                                                                   [ rdf:type owl:Restriction ;
                                                                                                                     owl:onProperty cont:width ;
                                                                                                                     owl:someValuesFrom [ owl:intersectionOf ( om:Measure
                                                                                                                                                               [ rdf:type owl:Restriction ;
                                                                                                                                                                 owl:onProperty om:hasUnit ;
                                                                                                                                                                 owl:hasValue om:millimetre
                                                                                                                                                               ]
                                                                                                                                                               [ rdf:type owl:Restriction ;
                                                                                                                                                                 owl:onProperty om:hasNumericalValue ;
                                                                                                                                                                 owl:someValuesFrom [ rdf:type rdfs:Datatype ;
                                                                                                                                                                                      owl:onDatatype xsd:float ;
                                                                                                                                                                                      owl:withRestrictions ( [ xsd:minInclusive "84.98"^^xsd:float
                                                                                                                                                                                                             ]
                                                                                                                                                                                                             [ xsd:maxInclusive "85.98"^^xsd:float
                                                                                                                                                                                                             ]
                                                                                                                                                                                                           )
                                                                                                                                                                                    ]
                                                                                                                                                               ]
                                                                                                                                                             ) ;
                                                                                                                                          rdf:type owl:Class
                                                                                                                                        ]
                                                                                                                   ] ,
                                                                                                                   [ rdf:type owl:Restriction ;
                                                                                                                     owl:onProperty cont:equipmentVendor ;
                                                                                                                     owl:hasValue cont:ThermoFisher
                                                                                                                   ] ,
                                                                                                                   [ rdf:type owl:Restriction ;
                                                                                                                     owl:onProperty cont:hasWellBottomShape ;
                                                                                                                     owl:hasValue cont:veeBottom
                                                                                                                   ] ,
                                                                                                                   [ rdf:type owl:Restriction ;
                                                                                                                     owl:onProperty cont:equipmentVendor ;
                                                                                                                     owl:qualifiedCardinality "1"^^xsd:nonNegativeInteger ;
                                                                                                                     owl:onClass cont:VendorFirm
                                                                                                                   ] ,
                                                                                                                   [ rdf:type owl:Restriction ;
                                                                                                                     owl:onProperty cont:wellCount ;
                                                                                                                     owl:hasValue 96
                                                                                                                   ] .


#################################################################
#    Individuals
#################################################################

###  http://www.ontology-of-units-of-measure.org/resource/om-2/Depth
om:Depth rdf:type owl:NamedIndividual .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#Centrifuge
cont:Centrifuge rdf:type owl:NamedIndividual .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#EnduraPlate_96Well_Blue
cont:EnduraPlate_96Well_Blue rdf:type owl:NamedIndividual ,
                                      cont:OpaquePlate ,
                                      <https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#ThermoFisher/EnduraPlate_96Well> ;
                             cont:hasCatalogEntry cont:tf4483343 ;
                             cont:hasColor cont:blue .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#EnduraPlate_96Well_Clear
cont:EnduraPlate_96Well_Clear rdf:type owl:NamedIndividual ,
                                       cont:ClearPlate ,
                                       <https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#ThermoFisher/EnduraPlate_96Well> ;
                              cont:hasCatalogEntry cont:tf4483352 ,
                                                   cont:tf4483354 ;
                              cont:hasColor cont:clear .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#EnduraPlate_96Well_Multicolor
cont:EnduraPlate_96Well_Multicolor rdf:type owl:NamedIndividual ,
                                            cont:OpaquePlate ,
                                            <https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#ThermoFisher/EnduraPlate_96Well> ;
                                   cont:hasCatalogEntry cont:tf4483355 ,
                                                        cont:tf4483356 ;
                                   cont:hasColor cont:multicolor .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#EnduraPlate_96Well_Red
cont:EnduraPlate_96Well_Red rdf:type owl:NamedIndividual ,
                                     cont:OpaquePlate ,
                                     <https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#ThermoFisher/EnduraPlate_96Well> ;
                            cont:hasCatalogEntry cont:tf4483350 ;
                            cont:hasColor cont:red .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#EnduraPlate_96Well_Yellow
cont:EnduraPlate_96Well_Yellow rdf:type owl:NamedIndividual ,
                                        cont:OpaquePlate ,
                                        <https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#ThermoFisher/EnduraPlate_96Well> ;
                               cont:hasCatalogEntry cont:tf4483395 ;
                               cont:hasColor cont:yellow .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#PlateReader
cont:PlateReader rdf:type owl:NamedIndividual .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#TFEPWD
cont:TFEPWD rdf:type owl:NamedIndividual ,
                     om:Measure ;
            om:hasUnit om:millimetre ;
            cont:measureType om:Depth ;
            om:hasNumericalValue "20.1"^^xsd:float ;
            rdfs:comment "The measure corresponding to the well height of the ThermoFisher EnduraPlate 96 well" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#ThermoFisher
cont:ThermoFisher rdf:type owl:NamedIndividual ,
                           cont:VendorFirm ;
                  cont:vendorName "ThermoFisher"^^xsd:string .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#black
cont:black rdf:type owl:NamedIndividual ,
                    cont:Color ,
                    cont:Opaque ;
           cont:colorName "black" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#blue
cont:blue rdf:type owl:NamedIndividual ,
                   cont:Opaque ;
          cont:colorName "blue" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#clear
cont:clear rdf:type owl:NamedIndividual ,
                    cont:Clear ,
                    cont:Color ;
           cont:colorName "clear" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#flatBottom
cont:flatBottom rdf:type owl:NamedIndividual ,
                         cont:WellShape .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#green
cont:green rdf:type owl:NamedIndividual ,
                    cont:Opaque ;
           cont:colorName "green" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#multicolor
cont:multicolor rdf:type owl:NamedIndividual ,
                         cont:Opaque ;
                cont:colorName "multicolor" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#red
cont:red rdf:type owl:NamedIndividual ,
                  cont:Opaque ;
         cont:colorName "red" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#roundBottom
cont:roundBottom rdf:type owl:NamedIndividual ,
                          cont:WellShape .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#tf4483343
cont:tf4483343 rdf:type owl:NamedIndividual ,
                        cont:CatalogEntry ;
               cont:hasVendorFirm cont:ThermoFisher ;
               cont:catalogNumber "tf4483343" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#tf4483350
cont:tf4483350 rdf:type owl:NamedIndividual ,
                        cont:CatalogEntry ;
               cont:hasVendorFirm cont:ThermoFisher ;
               cont:catalogNumber "tf4483350" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#tf4483352
cont:tf4483352 rdf:type owl:NamedIndividual ,
                        cont:CatalogEntry ;
               cont:hasVendorFirm cont:ThermoFisher ;
               cont:catalogNumber "tf4483352" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#tf4483354
cont:tf4483354 rdf:type owl:NamedIndividual ,
                        cont:CatalogEntry ;
               cont:hasVendorFirm cont:ThermoFisher ;
               cont:catalogNumber "tf4483354" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#tf4483355
cont:tf4483355 rdf:type owl:NamedIndividual ,
                        cont:CatalogEntry ;
               cont:hasVendorFirm cont:ThermoFisher ;
               cont:catalogNumber "tf4483355" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#tf4483356
cont:tf4483356 rdf:type owl:NamedIndividual ,
                        cont:CatalogEntry ;
               cont:hasVendorFirm cont:ThermoFisher ;
               cont:catalogNumber "tf4483356" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#tf4483395
cont:tf4483395 rdf:type owl:NamedIndividual ,
                        cont:CatalogEntry ;
               cont:hasVendorFirm cont:ThermoFisher ;
               cont:catalogNumber "tf4483395" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#veeBottom
cont:veeBottom rdf:type owl:NamedIndividual ,
                        cont:WellShape .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#white
cont:white rdf:type owl:NamedIndividual ,
                    cont:Color ,
                    cont:Opaque ;
           cont:colorName "white" .


###  https://www.dropbox.com/s/s1e2dzw64m01f9n/container-ontology.ttl#yellow
cont:yellow rdf:type owl:NamedIndividual ,
                     cont:Opaque ;
            cont:colorName "yellow" .


#################################################################
#    Annotations
#################################################################

cont:Centrifuge rdfs:comment "Likely this should actually be imported from another ontology of lab equipment, if one is available." ;
                rdfs:label "Centrifuge" .


cont:PlateReader rdfs:comment "Likely this should actually be imported from another ontology of lab equipment, if one is available." ;
                 rdfs:label "PlateReader" .


#################################################################
#    General axioms
#################################################################

[ rdf:type owl:AllDisjointClasses ;
  owl:members ( cont:CatalogEntry
                cont:CoatingMaterial
                cont:Color
                cont:LabEquipment
                cont:VendorFirm
                cont:WellShape
              )
] .


[ rdf:type owl:AllDisjointClasses ;
  owl:members ( cont:CatalogEntry
                cont:Color
                cont:LabEquipment
              )
] .


[ rdf:type owl:AllDisjointProperties ;
  owl:members ( cont:clearanceToPlateBottom
                cont:overallPlateHeight
                cont:plateHeight
              )
] .


###  Generated by the OWL API (version 4.5.9.2019-02-01T07:24:44Z) https://github.com/owlcs/owlapi

# Local Variables:
# mode: ttl
# End: