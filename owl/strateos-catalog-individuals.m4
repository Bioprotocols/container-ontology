@prefix : <URL_PREFIX/strateos-catalog-individuals.ttl#> .
@prefix om: <http://www.ontology-of-units-of-measure.org/resource/om-2/> .
@prefix owl: <http://www.w3.org/2002/07/owl#> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix xml: <http://www.w3.org/XML/1998/namespace> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .
@prefix cont: <URL_PREFIX/container-ontology.ttl#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@base <URL_PREFIX/strateos-catalog-individuals.ttl> .

<URL_PREFIX/strateos-catalog-individuals.ttl> rdf:type owl:Ontology ;
                                                                                                                     owl:imports <URL_PREFIX/container-ontology.ttl> ,
                                                                                                                                 <URL_PREFIX/om-subset.ttl> ;
                                                                                                                     rdfs:label "Strateos Plate Catalog"@en .

#################################################################
#    Annotation properties
#################################################################

###  URL_PREFIX/container-ontology.ttl#hasVendor
cont:hasVendor rdf:type owl:AnnotationProperty .


#################################################################
#    Classes
#################################################################

###  http://www.ontology-of-units-of-measure.org/resource/om-2/Volume
om:Volume rdf:type owl:Class .


###  URL_PREFIX/strateos-catalog-individuals.ttl#StrateosEquipment
:StrateosEquipment rdf:type owl:Class ;
                   owl:equivalentClass [ rdf:type owl:Restriction ;
                                         owl:onProperty cont:availableAt ;
                                         owl:hasValue :Strateos
                                       ] .


#################################################################
#    Individuals
#################################################################

###  http://www.ontology-of-units-of-measure.org/resource/om-2/microlitre
om:microlitre rdf:type owl:NamedIndividual .


###  URL_PREFIX/container-ontology.ttl#Axygen
cont:Axygen rdf:type owl:NamedIndividual ,
                     cont:VendorFirm ;
            cont:vendorName "Axygen" ;
            rdfs:label "Axygen" .


###  URL_PREFIX/container-ontology.ttl#Chemspeed
cont:Chemspeed rdf:type owl:NamedIndividual ,
                        cont:VendorFirm ;
               cont:vendorName "Chemspeed" ;
               rdfs:label "Chemspeed" .


###  URL_PREFIX/container-ontology.ttl#Corning
cont:Corning rdf:type owl:NamedIndividual ,
                      cont:VendorFirm ;
             cont:vendorName "Corning" ;
             rdfs:label "Corning" .


###  URL_PREFIX/container-ontology.ttl#Costar
cont:Costar rdf:type owl:NamedIndividual ,
                     cont:VendorFirm ;
            cont:vendorName "Costar" ;
            rdfs:label "Costar" .


###  URL_PREFIX/container-ontology.ttl#Eppendorf
cont:Eppendorf rdf:type owl:NamedIndividual ,
                        cont:VendorFirm ;
               cont:vendorName "Eppendorf" ;
               rdfs:label "Eppendorf" .


###  URL_PREFIX/container-ontology.ttl#Fisher
cont:Fisher rdf:type owl:NamedIndividual ,
                     cont:VendorFirm ;
            cont:vendorName "Fisher" ;
            rdfs:label "Fisher" .


###  URL_PREFIX/container-ontology.ttl#Greiner
cont:Greiner rdf:type owl:NamedIndividual ,
                      cont:VendorFirm ;
             cont:vendorName "Greiner" ;
             rdfs:label "Greiner" .


###  URL_PREFIX/container-ontology.ttl#Labcyte
cont:Labcyte rdf:type owl:NamedIndividual ,
                      cont:VendorFirm ;
             cont:vendorName "Labcyte" ;
             rdfs:label "Labcyte" .


###  URL_PREFIX/container-ontology.ttl#Mesoscale
cont:Mesoscale rdf:type owl:NamedIndividual ,
                        cont:VendorFirm ;
               cont:vendorName "Mesoscale" ;
               rdfs:label "Mesoscale" .


###  URL_PREFIX/container-ontology.ttl#PerkinElmer
cont:PerkinElmer rdf:type owl:NamedIndividual ,
                          cont:VendorFirm ;
                 cont:vendorName "PerkinElmer" ;
                 rdfs:label "PerkinElmer" .


###  URL_PREFIX/container-ontology.ttl#ThermoFisher
cont:ThermoFisher rdf:type cont:VendorFirm ;
                  cont:vendorName "ThermoFisher" ;
                  rdfs:label "ThermoFisher" .


###  URL_PREFIX/container-ontology.ttl#E%26K%20Scientific
<URL_PREFIX/container-ontology.ttl#E%26K%20Scientific> rdf:type owl:NamedIndividual ,
                                                                                                                                      cont:VendorFirm ;
                                                                                                                             cont:vendorName "E&K Scientific" ;
                                                                                                                             rdfs:label "E&K Scientific" .


###  URL_PREFIX/container-ontology.ttl#Sumitomo%20Bakelite%20Co.
<URL_PREFIX/container-ontology.ttl#Sumitomo%20Bakelite%20Co.> rdf:type owl:NamedIndividual ,
                                                                                                                                             cont:VendorFirm ;
                                                                                                                                    cont:vendorName "Sumitomo Bakelite Co." ;
                                                                                                                                    rdfs:label "Sumitomo Bakelite Co." .


###  URL_PREFIX/strateos-catalog-individuals.ttl#Axygenres-mw12-hp
:Axygenres-mw12-hp rdf:type owl:NamedIndividual ,
                            cont:Plate ;
                   cont:availableAt :Strateos ;
                   cont:equipmentVendor cont:Axygen ;
                   cont:hasCatalogEntry <URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Axygenres-mw12-hp> ;
                   cont:height :height39 ;
                   cont:wellDepth :wellDepth39 ;
                   cont:wellVolume :wellvolume39 ;
                   cont:columnCount 12 ;
                   cont:rowCount 1 ;
                   cont:wellCount 12 ;
                   rdfs:comment "Axygen Multiple Well Reagent Reservoir with 12-Channel Trough, High Profile" ;
                   rdfs:label "res-mw12-hp" .


###  URL_PREFIX/strateos-catalog-individuals.ttl#Axygenres-mw8-hp
:Axygenres-mw8-hp rdf:type owl:NamedIndividual ,
                           cont:Plate ;
                  cont:availableAt :Strateos ;
                  cont:equipmentVendor cont:Axygen ;
                  cont:hasCatalogEntry <URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Axygenres-mw8-hp> ;
                  cont:height :height26 ;
                  cont:wellDepth :wellDepth26 ;
                  cont:wellVolume :wellvolume26 ;
                  cont:columnCount 1 ;
                  cont:rowCount 8 ;
                  cont:wellCount 8 ;
                  rdfs:comment "Axygen Multiple Well Reagent Reservoir with 8-Channel Trough, High Profile" ;
                  rdfs:label "res-mw8-hp" .


###  URL_PREFIX/strateos-catalog-individuals.ttl#Chemspeedchemspeed-96-sealed-pin-rack
:Chemspeedchemspeed-96-sealed-pin-rack rdf:type owl:NamedIndividual ,
                                                cont:Plate ;
                                       cont:availableAt :Strateos ;
                                       cont:equipmentVendor cont:Chemspeed ;
                                       cont:hasCatalogEntry <URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Chemspeedunknown> ;
                                       cont:height :height5 ;
                                       cont:wellDepth :wellDepth5 ;
                                       cont:wellVolume :wellvolume5 ;
                                       cont:columnCount 12 ;
                                       cont:rowCount 8 ;
                                       cont:wellCount 96 ;
                                       rdfs:comment "Chemspeed Chemspeed 96 Pin Rack" ;
                                       rdfs:label "chemspeed-96-sealed-pin-rack" .


###  URL_PREFIX/strateos-catalog-individuals.ttl#Corning1536-tc-white-corning-3727
:Corning1536-tc-white-corning-3727 rdf:type owl:NamedIndividual ,
                                            cont:Plate ;
                                   cont:availableAt :Strateos ;
                                   cont:equipmentVendor cont:Corning ;
                                   cont:hasCatalogEntry <URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Corning3727> ;
                                   cont:height :height36 ;
                                   cont:wellDepth :wellDepth36 ;
                                   cont:wellVolume :wellvolume36 ;
                                   cont:columnCount 48 ;
                                   cont:rowCount 32 ;
                                   cont:wellCount 1536 ;
                                   rdfs:comment "Corning 1536 well Corning white TC treated HiBase" ;
                                   rdfs:label "1536-tc-white-corning-3727" .


###  URL_PREFIX/strateos-catalog-individuals.ttl#Corning384-flat
:Corning384-flat rdf:type owl:NamedIndividual ,
                          cont:Plate ;
                 cont:availableAt :Strateos ;
                 cont:equipmentVendor cont:Corning ;
                 cont:hasCatalogEntry <URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Corning3706> ;
                 cont:height :height32 ;
                 cont:wellDepth :wellDepth32 ;
                 cont:wellVolume :wellvolume32 ;
                 cont:columnCount 24 ;
                 cont:rowCount 16 ;
                 cont:wellCount 384 ;
                 rdfs:comment "Corning 384-Well Clear Bottom White Polystyrene Microplate" ;
                 rdfs:label "384-flat" .


###  URL_PREFIX/strateos-catalog-individuals.ttl#Corning384-flat-clear-clear
:Corning384-flat-clear-clear rdf:type owl:NamedIndividual ,
                                      cont:Plate ;
                             cont:availableAt :Strateos ;
                             cont:equipmentVendor cont:Corning ;
                             cont:hasCatalogEntry <URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Corning3700> ;
                             cont:height :height34 ;
                             cont:wellDepth :wellDepth34 ;
                             cont:wellVolume :wellvolume34 ;
                             cont:columnCount 24 ;
                             cont:rowCount 16 ;
                             cont:wellCount 384 ;
                             rdfs:comment "Corning 384-Well Clear Flat Bottom Polystyrene High Bind Microplate" ;
                             rdfs:label "384-flat-clear-clear" .


###  URL_PREFIX/strateos-catalog-individuals.ttl#Corning384-flat-white-clear
:Corning384-flat-white-clear rdf:type owl:NamedIndividual ,
                                      cont:Plate ;
                             cont:availableAt :Strateos ;
                             cont:equipmentVendor cont:Corning ;
                             cont:hasCatalogEntry <URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Corning3763> ;
                             cont:height :height24 ;
                             cont:wellDepth :wellDepth24 ;
                             cont:wellVolume :wellvolume24 ;
                             cont:columnCount 24 ;
                             cont:rowCount 16 ;
                             cont:wellCount 384 ;
                             rdfs:comment "Corning 384-well flat-bottom polystyrene plate" ;
                             rdfs:label "384-flat-white-clear" .


###  URL_PREFIX/strateos-catalog-individuals.ttl#Corning384-flat-white-white-lv
:Corning384-flat-white-white-lv rdf:type owl:NamedIndividual ,
                                         cont:Plate ;
                                cont:availableAt :Strateos ;
                                cont:equipmentVendor cont:Corning ;
                                cont:hasCatalogEntry <URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Corning3824> ;
                                cont:height :height11 ;
                                cont:wellDepth :wellDepth11 ;
                                cont:wellVolume :wellvolume11 ;
                                cont:columnCount 24 ;
                                cont:rowCount 16 ;
                                cont:wellCount 384 ;
                                rdfs:comment "Corning 384-Well Low Volume White Flat Bottom Polystyrene NBS Microplate" ;
                                rdfs:label "384-flat-white-white-lv" .


###  URL_PREFIX/strateos-catalog-individuals.ttl#Corning384-flat-white-white-nbs
:Corning384-flat-white-white-nbs rdf:type owl:NamedIndividual ,
                                          cont:Plate ;
                                 cont:availableAt :Strateos ;
                                 cont:equipmentVendor cont:Corning ;
                                 cont:hasCatalogEntry <URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Corning3574> ;
                                 cont:height :height2 ;
                                 cont:wellDepth :wellDepth2 ;
                                 cont:wellVolume :wellvolume2 ;
                                 cont:columnCount 24 ;
                                 cont:rowCount 16 ;
                                 cont:wellCount 384 ;
                                 rdfs:comment "Corning 384-Well Low Flange White FlatBottom Polystyrene NBS Microplate" ;
                                 rdfs:label "384-flat-white-white-nbs" .


###  URL_PREFIX/strateos-catalog-individuals.ttl#Corning384-flat-white-white-tc
:Corning384-flat-white-white-tc rdf:type owl:NamedIndividual ,
                                         cont:Plate ;
                                cont:availableAt :Strateos ;
                                cont:equipmentVendor cont:Corning ;
                                cont:hasCatalogEntry <URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Corning3570> ;
                                cont:height :height18 ;
                                cont:wellDepth :wellDepth18 ;
                                cont:wellVolume :wellvolume18 ;
                                cont:columnCount 24 ;
                                cont:rowCount 16 ;
                                cont:wellCount 384 ;
                                rdfs:comment "Corning 384-Well Low Flange White Flat Bottom Polystyrene TC-Treated Microplate" ;
                                rdfs:label "384-flat-white-white-tc" .


###  URL_PREFIX/strateos-catalog-individuals.ttl#Corning384-round-black-black-lv-nbs
:Corning384-round-black-black-lv-nbs rdf:type owl:NamedIndividual ,
                                              cont:Plate ;
                                     cont:availableAt :Strateos ;
                                     cont:equipmentVendor cont:Corning ;
                                     cont:hasCatalogEntry <URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Corning4514> ;
                                     cont:height :height29 ;
                                     cont:wellDepth :wellDepth29 ;
                                     cont:wellVolume :wellvolume29 ;
                                     cont:columnCount 24 ;
                                     cont:rowCount 16 ;
                                     cont:wellCount 384 ;
                                     rdfs:comment "Corning Corning 4514 384-well Low Volume Black Round Bottom Polystyrene NBS Microplate" ;
                                     rdfs:label "384-round-black-black-lv-nbs" .


###  URL_PREFIX/strateos-catalog-individuals.ttl#Corning384-round-clear-clear
:Corning384-round-clear-clear rdf:type owl:NamedIndividual ,
                                       cont:Plate ;
                              cont:availableAt :Strateos ;
                              cont:equipmentVendor cont:Corning ;
                              cont:hasCatalogEntry <URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Corning3657> ;
                              cont:height :height20 ;
                              cont:wellDepth :wellDepth20 ;
                              cont:wellVolume :wellvolume20 ;
                              cont:columnCount 24 ;
                              cont:rowCount 16 ;
                              cont:wellCount 384 ;
                              rdfs:comment "Corning 384-Well Clear Round Bottom Polypropylene Not Treated Microplate" ;
                              rdfs:label "384-round-clear-clear" .


###  URL_PREFIX/strateos-catalog-individuals.ttl#Corning96-deep
:Corning96-deep rdf:type owl:NamedIndividual ,
                         cont:Plate ;
                cont:availableAt :Strateos ;
                cont:equipmentVendor cont:Corning ;
                cont:hasCatalogEntry <URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Corning3961> ;
                cont:height :height38 ;
                cont:wellDepth :wellDepth38 ;
                cont:wellVolume :wellvolume38 ;
                cont:columnCount 12 ;
                cont:rowCount 8 ;
                cont:wellCount 96 ;
                rdfs:comment "Corning 96-Well Clear V-Bottom Polypropylene Deep Well Plate" ;
                rdfs:label "96-deep" .


###  URL_PREFIX/strateos-catalog-individuals.ttl#Corning96-flat
:Corning96-flat rdf:type owl:NamedIndividual ,
                         cont:Plate ;
                cont:availableAt :Strateos ;
                cont:equipmentVendor cont:Corning ;
                cont:hasCatalogEntry <URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Corning3632> ;
                cont:height :height13 ;
                cont:wellDepth :wellDepth13 ;
                cont:wellVolume :wellvolume13 ;
                cont:columnCount 12 ;
                cont:rowCount 8 ;
                cont:wellCount 96 ;
                rdfs:comment "Corning 96-Well White with Clear Flat Bottom Polystyrene Not Treated Microplate" ;
                rdfs:label "96-flat" .


###  URL_PREFIX/strateos-catalog-individuals.ttl#Corning96-flat-uv
:Corning96-flat-uv rdf:type owl:NamedIndividual ,
                            cont:Plate ;
                   cont:availableAt :Strateos ;
                   cont:equipmentVendor cont:Corning ;
                   cont:hasCatalogEntry <URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Corning3635> ;
                   cont:height :height8 ;
                   cont:wellDepth :wellDepth8 ;
                   cont:wellVolume :wellvolume8 ;
                   cont:columnCount 12 ;
                   cont:rowCount 8 ;
                   cont:wellCount 96 ;
                   rdfs:comment "Corning 96-Well Clear Flat Bottom UV-Transparent Microplate" ;
                   rdfs:label "96-flat-uv" .


###  URL_PREFIX/strateos-catalog-individuals.ttl#Corning96-ubottom-clear-tc
:Corning96-ubottom-clear-tc rdf:type owl:NamedIndividual ,
                                     cont:Plate ;
                            cont:availableAt :Strateos ;
                            cont:equipmentVendor cont:Corning ;
                            cont:hasCatalogEntry <URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Corning353077> ;
                            cont:height :height16 ;
                            cont:wellDepth :wellDepth16 ;
                            cont:wellVolume :wellvolume16 ;
                            cont:columnCount 12 ;
                            cont:rowCount 8 ;
                            cont:wellCount 96 ;
                            rdfs:comment "Corning Falcon 96-Well, Cell Culture-Treated, U-Shaped-Bottom Microplate" ;
                            rdfs:label "96-ubottom-clear-tc" .


###  URL_PREFIX/strateos-catalog-individuals.ttl#Corning96-well-v-bottom
:Corning96-well-v-bottom rdf:type owl:NamedIndividual ,
                                  cont:Plate ;
                         cont:availableAt :Strateos ;
                         cont:equipmentVendor cont:Corning ;
                         cont:hasCatalogEntry <URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Corning3894> ;
                         cont:height :height23 ;
                         cont:wellDepth :wellDepth23 ;
                         cont:wellVolume :wellvolume23 ;
                         cont:columnCount 12 ;
                         cont:rowCount 8 ;
                         cont:wellCount 96 ;
                         rdfs:comment "Corning 96-well cell culture multiple well plate, V bottom" ;
                         rdfs:label "96-well-v-bottom" .


###  URL_PREFIX/strateos-catalog-individuals.ttl#Costar96-flat-clear-costar-3590
:Costar96-flat-clear-costar-3590 rdf:type owl:NamedIndividual ,
                                          cont:Plate ;
                                 cont:availableAt :Strateos ;
                                 cont:equipmentVendor cont:Costar ;
                                 cont:hasCatalogEntry <URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Costar3590> ;
                                 cont:height :height7 ;
                                 cont:wellDepth :wellDepth7 ;
                                 cont:wellVolume :wellvolume7 ;
                                 cont:columnCount 12 ;
                                 cont:rowCount 8 ;
                                 cont:wellCount 96 ;
                                 rdfs:comment "Costar 96-well EIA/RIA Clear Flat Bottom Polystyrene High Bind Microplate" ;
                                 rdfs:label "96-flat-clear-costar-3590" .


###  URL_PREFIX/strateos-catalog-individuals.ttl#Eppendorf384-pcr
:Eppendorf384-pcr rdf:type owl:NamedIndividual ,
                           cont:Plate ;
                  cont:availableAt :Strateos ;
                  cont:equipmentVendor cont:Eppendorf ;
                  cont:hasCatalogEntry <URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Eppendorf951020539> ;
                  cont:height :height0 ;
                  cont:wellDepth :wellDepth0 ;
                  cont:wellVolume :wellvolume0 ;
                  cont:columnCount 24 ;
                  cont:rowCount 16 ;
                  cont:wellCount 384 ;
                  rdfs:comment "Eppendorf 384-Well twin.tec PCR Plate" ;
                  rdfs:label "384-pcr" .


###  URL_PREFIX/strateos-catalog-individuals.ttl#Eppendorf6-flat
:Eppendorf6-flat rdf:type owl:NamedIndividual ,
                          cont:Plate ;
                 cont:availableAt :Strateos ;
                 cont:equipmentVendor cont:Eppendorf ;
                 cont:hasCatalogEntry <URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Eppendorf30720016> ;
                 cont:height :height21 ;
                 cont:wellDepth :wellDepth21 ;
                 cont:wellVolume :wellvolume21 ;
                 cont:columnCount 3 ;
                 cont:rowCount 2 ;
                 cont:wellCount 6 ;
                 rdfs:comment "Eppendorf 6-Well Non-Treated Sterile Plate" ;
                 rdfs:label "6-flat" .


###  URL_PREFIX/strateos-catalog-individuals.ttl#Eppendorf6-flat-tc
:Eppendorf6-flat-tc rdf:type owl:NamedIndividual ,
                             cont:Plate ;
                    cont:availableAt :Strateos ;
                    cont:equipmentVendor cont:Eppendorf ;
                    cont:hasCatalogEntry <URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Eppendorf30720113> ;
                    cont:height :height15 ;
                    cont:wellDepth :wellDepth15 ;
                    cont:wellVolume :wellvolume15 ;
                    cont:columnCount 3 ;
                    cont:rowCount 2 ;
                    cont:wellCount 6 ;
                    rdfs:comment "Eppendorf 6-Well TC Treated Sterile Plate" ;
                    rdfs:label "6-flat-tc" .


###  URL_PREFIX/strateos-catalog-individuals.ttl#Eppendorf96-flat-clear-clear-tc
:Eppendorf96-flat-clear-clear-tc rdf:type owl:NamedIndividual ,
                                          cont:Plate ;
                                 cont:availableAt :Strateos ;
                                 cont:equipmentVendor cont:Eppendorf ;
                                 cont:hasCatalogEntry <URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Eppendorf30730119> ;
                                 cont:height :height25 ;
                                 cont:wellDepth :wellDepth25 ;
                                 cont:wellVolume :wellvolume25 ;
                                 cont:columnCount 12 ;
                                 cont:rowCount 8 ;
                                 cont:wellCount 96 ;
                                 rdfs:comment "Eppendorf 96-Well Flat TC-Treated Polystyrene Microplate" ;
                                 rdfs:label "96-flat-clear-clear-tc" .


###  URL_PREFIX/strateos-catalog-individuals.ttl#Eppendorf96-pcr
:Eppendorf96-pcr rdf:type owl:NamedIndividual ,
                          cont:Plate ;
                 cont:availableAt :Strateos ;
                 cont:equipmentVendor cont:Eppendorf ;
                 cont:hasCatalogEntry <URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Eppendorf951020619> ;
                 cont:height :height19 ;
                 cont:wellDepth :wellDepth19 ;
                 cont:wellVolume :wellvolume19 ;
                 cont:columnCount 12 ;
                 cont:rowCount 8 ;
                 cont:wellCount 96 ;
                 rdfs:comment "Eppendorf 96-Well twin.tec PCR Plate" ;
                 rdfs:label "96-pcr" .


###  URL_PREFIX/strateos-catalog-individuals.ttl#Fisher96-deep-kf
:Fisher96-deep-kf rdf:type owl:NamedIndividual ,
                           cont:Plate ;
                  cont:availableAt :Strateos ;
                  cont:equipmentVendor cont:Fisher ;
                  cont:hasCatalogEntry <URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Fisher22-387-031> ;
                  cont:height :height17 ;
                  cont:wellDepth :wellDepth17 ;
                  cont:wellVolume :wellvolume17 ;
                  cont:columnCount 12 ;
                  cont:rowCount 8 ;
                  cont:wellCount 96 ;
                  rdfs:comment "Fisher 96-Well KingFisher Deepwell Plate V-bottom Polypropylene" ;
                  rdfs:label "96-deep-kf" .


###  URL_PREFIX/strateos-catalog-individuals.ttl#Fisher96-v-kf
:Fisher96-v-kf rdf:type owl:NamedIndividual ,
                        cont:Plate ;
               cont:availableAt :Strateos ;
               cont:equipmentVendor cont:Fisher ;
               cont:hasCatalogEntry <URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Fisher22-387-030> ;
               cont:height :height4 ;
               cont:wellDepth :wellDepth4 ;
               cont:wellVolume :wellvolume4 ;
               cont:columnCount 12 ;
               cont:rowCount 8 ;
               cont:wellCount 96 ;
               rdfs:comment "Fisher 96-well KingFisher PCR microplate" ;
               rdfs:label "96-v-kf" .


###  URL_PREFIX/strateos-catalog-individuals.ttl#Fisher96-vbottom-microwell
:Fisher96-vbottom-microwell rdf:type owl:NamedIndividual ,
                                     cont:Plate ;
                            cont:availableAt :Strateos ;
                            cont:equipmentVendor cont:Fisher ;
                            cont:hasCatalogEntry <URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Fisher249944> ;
                            cont:height :height30 ;
                            cont:wellDepth :wellDepth30 ;
                            cont:wellVolume :wellvolume30 ;
                            cont:columnCount 12 ;
                            cont:rowCount 8 ;
                            cont:wellCount 96 ;
                            rdfs:comment "Fisher 96 vbottom microwell lcms plate" ;
                            rdfs:label "96-vbottom-microwell" .


###  URL_PREFIX/strateos-catalog-individuals.ttl#Greiner1536-white-tc
:Greiner1536-white-tc rdf:type owl:NamedIndividual ,
                               cont:Plate ;
                      cont:availableAt :Strateos ;
                      cont:equipmentVendor cont:Greiner ;
                      cont:hasCatalogEntry <URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Greiner782073> ;
                      cont:height :height37 ;
                      cont:wellDepth :wellDepth37 ;
                      cont:wellVolume :wellvolume37 ;
                      cont:columnCount 48 ;
                      cont:rowCount 32 ;
                      cont:wellCount 1536 ;
                      rdfs:comment "Greiner 1536 Greiner White TC-treated HiBase" ;
                      rdfs:label "1536-white-tc" .


###  URL_PREFIX/strateos-catalog-individuals.ttl#Greiner384-v-clear-clear
:Greiner384-v-clear-clear rdf:type owl:NamedIndividual ,
                                   cont:Plate ;
                          cont:availableAt :Strateos ;
                          cont:equipmentVendor cont:Greiner ;
                          cont:hasCatalogEntry <URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Greiner781280> ;
                          cont:height :height35 ;
                          cont:wellDepth :wellDepth35 ;
                          cont:wellVolume :wellvolume35 ;
                          cont:columnCount 24 ;
                          cont:rowCount 16 ;
                          cont:wellCount 384 ;
                          rdfs:comment "Greiner 384-Well PP V-Bottom Microplate" ;
                          rdfs:label "384-v-clear-clear" .


###  URL_PREFIX/strateos-catalog-individuals.ttl#Greiner96-flat-black-black-fluotrac-600
:Greiner96-flat-black-black-fluotrac-600 rdf:type owl:NamedIndividual ,
                                                  cont:Plate ;
                                         cont:availableAt :Strateos ;
                                         cont:equipmentVendor cont:Greiner ;
                                         cont:hasCatalogEntry <URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Greiner655077> ;
                                         cont:height :height14 ;
                                         cont:wellDepth :wellDepth14 ;
                                         cont:wellVolume :wellvolume14 ;
                                         cont:columnCount 12 ;
                                         cont:rowCount 8 ;
                                         cont:wellCount 96 ;
                                         rdfs:comment "Greiner 96-Well F-Bottom Black Fluotrac High-Binding Microplate" ;
                                         rdfs:label "96-flat-black-black-fluotrac-600" .


###  URL_PREFIX/strateos-catalog-individuals.ttl#Labcyte384-echo
:Labcyte384-echo rdf:type owl:NamedIndividual ,
                          cont:Plate ;
                 cont:availableAt :Strateos ;
                 cont:equipmentVendor cont:Labcyte ;
                 cont:hasCatalogEntry <URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#LabcytePP-0200> ;
                 cont:height :height6 ;
                 cont:wellDepth :wellDepth6 ;
                 cont:wellVolume :wellvolume6 ;
                 cont:columnCount 24 ;
                 cont:rowCount 16 ;
                 cont:wellCount 384 ;
                 rdfs:comment "Labcyte 384-Well Echo Qualified Polypropylene Microplate 2.0" ;
                 rdfs:label "384-echo" .


###  URL_PREFIX/strateos-catalog-individuals.ttl#Labcyte384-echo-ldv
:Labcyte384-echo-ldv rdf:type owl:NamedIndividual ,
                              cont:Plate ;
                     cont:availableAt :Strateos ;
                     cont:equipmentVendor cont:Labcyte ;
                     cont:hasCatalogEntry <URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#LabcyteLP-0200> ;
                     cont:height :height28 ;
                     cont:wellDepth :wellDepth28 ;
                     cont:wellVolume :wellvolume28 ;
                     cont:columnCount 24 ;
                     cont:rowCount 16 ;
                     cont:wellCount 384 ;
                     rdfs:comment "Labcyte 384-well Echo low dead volume plate" ;
                     rdfs:label "384-echo-ldv" .


###  URL_PREFIX/strateos-catalog-individuals.ttl#Mesoscale96-10-spot-uplex-MSD
:Mesoscale96-10-spot-uplex-MSD rdf:type owl:NamedIndividual ,
                                        cont:Plate ;
                               cont:availableAt :Strateos ;
                               cont:equipmentVendor cont:Mesoscale ;
                               cont:hasCatalogEntry <URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#MesoscaleK15069L> ;
                               cont:height :height12 ;
                               cont:wellDepth :wellDepth12 ;
                               cont:wellVolume :wellvolume12 ;
                               cont:columnCount 12 ;
                               cont:rowCount 8 ;
                               cont:wellCount 96 ;
                               rdfs:comment "Mesoscale 96-well 10-spot u-plex MSD plate" ;
                               rdfs:label "96-10-spot-uplex-MSD" .


###  URL_PREFIX/strateos-catalog-individuals.ttl#Mesoscale96-10-spot-vplex-m-pro-inflamm1-MSD
:Mesoscale96-10-spot-vplex-m-pro-inflamm1-MSD rdf:type owl:NamedIndividual ,
                                                       cont:Plate ;
                                              cont:availableAt :Strateos ;
                                              cont:equipmentVendor cont:Mesoscale ;
                                              cont:hasCatalogEntry <URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#MesoscaleK15048G> ;
                                              cont:height :height1 ;
                                              cont:wellDepth :wellDepth1 ;
                                              cont:wellVolume :wellvolume1 ;
                                              cont:columnCount 12 ;
                                              cont:rowCount 8 ;
                                              cont:wellCount 96 ;
                                              rdfs:comment "Mesoscale 96-well 10-spot v-plex mouse pro-inflammatory panel 1 MSD plate" ;
                                              rdfs:label "96-10-spot-vplex-m-pro-inflamm1-MSD" .


###  URL_PREFIX/strateos-catalog-individuals.ttl#Mesoscale96-4-spot-mMIP3a-MSD
:Mesoscale96-4-spot-mMIP3a-MSD rdf:type owl:NamedIndividual ,
                                        cont:Plate ;
                               cont:availableAt :Strateos ;
                               cont:equipmentVendor cont:Mesoscale ;
                               cont:hasCatalogEntry <URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#MesoscaleK152MSD> ;
                               cont:height :height10 ;
                               cont:wellDepth :wellDepth10 ;
                               cont:wellVolume :wellvolume10 ;
                               cont:columnCount 12 ;
                               cont:rowCount 8 ;
                               cont:wellCount 96 ;
                               rdfs:comment "Mesoscale 96-well 4-spot mouse MIP3a MSD plate" ;
                               rdfs:label "96-4-spot-mMIP3a-MSD" .


###  URL_PREFIX/strateos-catalog-individuals.ttl#PerkinElmer384-flat-black-black-proxiplate-plus-f
:PerkinElmer384-flat-black-black-proxiplate-plus-f rdf:type owl:NamedIndividual ,
                                                            cont:Plate ;
                                                   cont:availableAt :Strateos ;
                                                   cont:equipmentVendor cont:PerkinElmer ;
                                                   cont:hasCatalogEntry <URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#PerkinElmer6008260> ;
                                                   cont:height :height31 ;
                                                   cont:wellDepth :wellDepth31 ;
                                                   cont:wellVolume :wellvolume31 ;
                                                   cont:columnCount 24 ;
                                                   cont:rowCount 16 ;
                                                   cont:wellCount 384 ;
                                                   rdfs:comment "PerkinElmer 384-well black flat-bottom polystyrene proximity plus plate" ;
                                                   rdfs:label "384-flat-black-black-proxiplate-plus-f" .


###  URL_PREFIX/strateos-catalog-individuals.ttl#PerkinElmer384-flat-white-white-optiplate
:PerkinElmer384-flat-white-white-optiplate rdf:type owl:NamedIndividual ,
                                                    cont:Plate ;
                                           cont:availableAt :Strateos ;
                                           cont:equipmentVendor cont:PerkinElmer ;
                                           cont:hasCatalogEntry <URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#PerkinElmer6007290> ;
                                           cont:height :height3 ;
                                           cont:wellDepth :wellDepth3 ;
                                           cont:wellVolume :wellvolume3 ;
                                           cont:columnCount 24 ;
                                           cont:rowCount 16 ;
                                           cont:wellCount 384 ;
                                           rdfs:comment "PerkinElmer 384-Well White Opaque Microplate" ;
                                           rdfs:label "384-flat-white-white-optiplate" .


###  URL_PREFIX/strateos-catalog-individuals.ttl#PerkinElmer384-flat-white-white-proxiplate-plus
:PerkinElmer384-flat-white-white-proxiplate-plus rdf:type owl:NamedIndividual ,
                                                          cont:Plate ;
                                                 cont:availableAt :Strateos ;
                                                 cont:equipmentVendor cont:PerkinElmer ;
                                                 cont:hasCatalogEntry <URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#PerkinElmer6008280> ;
                                                 cont:height :height22 ;
                                                 cont:wellDepth :wellDepth22 ;
                                                 cont:wellVolume :wellvolume22 ;
                                                 cont:columnCount 24 ;
                                                 cont:rowCount 16 ;
                                                 cont:wellCount 384 ;
                                                 rdfs:comment "PerkinElmer 384-well flat-bottom polystyrene proximity plus plate" ;
                                                 rdfs:label "384-flat-white-white-proxiplate-plus" .


###  URL_PREFIX/strateos-catalog-individuals.ttl#Strateos
:Strateos rdf:type owl:NamedIndividual ,
                   cont:Lab ;
          cont:labName "Strateos" .


###  URL_PREFIX/strateos-catalog-individuals.ttl#ThermoFisher384-ubottom-clear-polypropylene-nunc-264573
:ThermoFisher384-ubottom-clear-polypropylene-nunc-264573 rdf:type owl:NamedIndividual ,
                                                                  cont:Plate ;
                                                         cont:availableAt :Strateos ;
                                                         cont:equipmentVendor cont:ThermoFisher ;
                                                         cont:hasCatalogEntry <URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#ThermoFisher264573> ;
                                                         cont:height :height27 ;
                                                         cont:wellDepth :wellDepth27 ;
                                                         cont:wellVolume :wellvolume27 ;
                                                         cont:columnCount 24 ;
                                                         cont:rowCount 16 ;
                                                         cont:wellCount 384 ;
                                                         rdfs:comment "ThermoFisher Nunc 384-Well Polypropylene U-Bottom Natural Color Storage Microplate" ;
                                                         rdfs:label "384-ubottom-clear-polypropylene-nunc-264573" .


###  URL_PREFIX/strateos-catalog-individuals.ttl#ThermoFisher96-flat-white-dc
:ThermoFisher96-flat-white-dc rdf:type owl:NamedIndividual ,
                                       cont:Plate ;
                              cont:availableAt :Strateos ;
                              cont:equipmentVendor cont:ThermoFisher ;
                              cont:hasCatalogEntry <URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#ThermoFisher136101> ;
                              cont:height :height9 ;
                              cont:wellDepth :wellDepth9 ;
                              cont:wellVolume :wellvolume9 ;
                              cont:columnCount 12 ;
                              cont:rowCount 8 ;
                              cont:wellCount 96 ;
                              rdfs:comment "ThermoFisher Nunc MicroWell 96-Well, Nunclon Delta-Treated, Flat-Bottom Microplate" ;
                              rdfs:label "96-flat-white-dc" .


###  URL_PREFIX/strateos-catalog-individuals.ttl#height0
:height0 rdf:type owl:NamedIndividual ,
                  om:Height ;
         om:hasDimension om:millimetre ;
         om:hasNumericalValue "10.6"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#height1
:height1 rdf:type owl:NamedIndividual ,
                  om:Height ;
         om:hasDimension om:millimetre ;
         om:hasNumericalValue "14.35"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#height10
:height10 rdf:type owl:NamedIndividual ,
                   om:Height ;
          om:hasDimension om:millimetre ;
          om:hasNumericalValue "14.35"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#height11
:height11 rdf:type owl:NamedIndividual ,
                   om:Height ;
          om:hasDimension om:millimetre ;
          om:hasNumericalValue "12.19"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#height12
:height12 rdf:type owl:NamedIndividual ,
                   om:Height ;
          om:hasDimension om:millimetre ;
          om:hasNumericalValue "14.35"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#height13
:height13 rdf:type owl:NamedIndividual ,
                   om:Height ;
          om:hasDimension om:millimetre ;
          om:hasNumericalValue "14.22"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#height14
:height14 rdf:type owl:NamedIndividual ,
                   om:Height ;
          om:hasDimension om:millimetre ;
          om:hasNumericalValue "14.22"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#height15
:height15 rdf:type owl:NamedIndividual ,
                   om:Height ;
          om:hasDimension om:millimetre ;
          om:hasNumericalValue "19.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#height16
:height16 rdf:type owl:NamedIndividual ,
                   om:Height ;
          om:hasDimension om:millimetre ;
          om:hasNumericalValue "14.6"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#height17
:height17 rdf:type owl:NamedIndividual ,
                   om:Height ;
          om:hasDimension om:millimetre ;
          om:hasNumericalValue "44.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#height18
:height18 rdf:type owl:NamedIndividual ,
                   om:Height ;
          om:hasDimension om:millimetre ;
          om:hasNumericalValue "14.22"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#height19
:height19 rdf:type owl:NamedIndividual ,
                   om:Height ;
          om:hasDimension om:millimetre ;
          om:hasNumericalValue "15.9"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#height2
:height2 rdf:type owl:NamedIndividual ,
                  om:Height ;
         om:hasDimension om:millimetre ;
         om:hasNumericalValue "14.35"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#height20
:height20 rdf:type owl:NamedIndividual ,
                   om:Height ;
          om:hasDimension om:millimetre ;
          om:hasNumericalValue "14.22"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#height21
:height21 rdf:type owl:NamedIndividual ,
                   om:Height ;
          om:hasDimension om:millimetre ;
          om:hasNumericalValue "19.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#height22
:height22 rdf:type owl:NamedIndividual ,
                   om:Height ;
          om:hasDimension om:millimetre ;
          om:hasNumericalValue "14.35"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#height23
:height23 rdf:type owl:NamedIndividual ,
                   om:Height ;
          om:hasDimension om:millimetre ;
          om:hasNumericalValue "3.25"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#height24
:height24 rdf:type owl:NamedIndividual ,
                   om:Height ;
          om:hasDimension om:millimetre ;
          om:hasNumericalValue "14.22"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#height25
:height25 rdf:type owl:NamedIndividual ,
                   om:Height ;
          om:hasDimension om:millimetre ;
          om:hasNumericalValue "14.4"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#height26
:height26 rdf:type owl:NamedIndividual ,
                   om:Height ;
          om:hasDimension om:millimetre ;
          om:hasNumericalValue "43.8"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#height27
:height27 rdf:type owl:NamedIndividual ,
                   om:Height ;
          om:hasDimension om:millimetre ;
          om:hasNumericalValue "14.4"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#height28
:height28 rdf:type owl:NamedIndividual ,
                   om:Height ;
          om:hasDimension om:millimetre ;
          om:hasNumericalValue "10.48"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#height29
:height29 rdf:type owl:NamedIndividual ,
                   om:Height ;
          om:hasDimension om:millimetre ;
          om:hasNumericalValue "14.22"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#height3
:height3 rdf:type owl:NamedIndividual ,
                  om:Height ;
         om:hasDimension om:millimetre ;
         om:hasNumericalValue "14.4"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#height30
:height30 rdf:type owl:NamedIndividual ,
                   om:Height ;
          om:hasDimension om:millimetre ;
          om:hasNumericalValue "14.7"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#height31
:height31 rdf:type owl:NamedIndividual ,
                   om:Height ;
          om:hasDimension om:millimetre ;
          om:hasNumericalValue "14.35"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#height32
:height32 rdf:type owl:NamedIndividual ,
                   om:Height ;
          om:hasDimension om:millimetre ;
          om:hasNumericalValue "14.22"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#height33
:height33 rdf:type owl:NamedIndividual ,
                   om:Height ;
          om:hasDimension om:millimetre ;
          om:hasNumericalValue "44.04"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#height34
:height34 rdf:type owl:NamedIndividual ,
                   om:Height ;
          om:hasDimension om:millimetre ;
          om:hasNumericalValue "14.2"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#height35
:height35 rdf:type owl:NamedIndividual ,
                   om:Height ;
          om:hasDimension om:millimetre ;
          om:hasNumericalValue "14.4"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#height36
:height36 rdf:type owl:NamedIndividual ,
                   om:Height ;
          om:hasDimension om:millimetre ;
          om:hasNumericalValue "10.4"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#height37
:height37 rdf:type owl:NamedIndividual ,
                   om:Height ;
          om:hasDimension om:millimetre ;
          om:hasNumericalValue "10.4"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#height38
:height38 rdf:type owl:NamedIndividual ,
                   om:Height ;
          om:hasDimension om:millimetre ;
          om:hasNumericalValue "43.8"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#height39
:height39 rdf:type owl:NamedIndividual ,
                   om:Height ;
          om:hasDimension om:millimetre ;
          om:hasNumericalValue "44.04"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#height4
:height4 rdf:type owl:NamedIndividual ,
                  om:Height ;
         om:hasDimension om:millimetre ;
         om:hasNumericalValue "14.5"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#height40
:height40 rdf:type owl:NamedIndividual ,
                   om:Height ;
          om:hasDimension om:millimetre ;
          om:hasNumericalValue "14.4"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#height5
:height5 rdf:type owl:NamedIndividual ,
                  om:Height ;
         om:hasDimension om:millimetre ;
         om:hasNumericalValue "36.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#height6
:height6 rdf:type owl:NamedIndividual ,
                  om:Height ;
         om:hasDimension om:millimetre ;
         om:hasNumericalValue "14.4"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#height7
:height7 rdf:type owl:NamedIndividual ,
                  om:Height ;
         om:hasDimension om:millimetre ;
         om:hasNumericalValue "14.22"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#height8
:height8 rdf:type owl:NamedIndividual ,
                  om:Height ;
         om:hasDimension om:millimetre ;
         om:hasNumericalValue "14.22"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#height9
:height9 rdf:type owl:NamedIndividual ,
                  om:Height ;
         om:hasDimension om:millimetre ;
         om:hasNumericalValue "14.6"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellDepth0
:wellDepth0 rdf:type owl:NamedIndividual ,
                     om:Depth ;
            om:hasDimension om:millimetre ;
            om:hasNumericalValue "9.6"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellDepth1
:wellDepth1 rdf:type owl:NamedIndividual ,
                     om:Depth ;
            om:hasDimension om:millimetre ;
            om:hasNumericalValue "11.68"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellDepth10
:wellDepth10 rdf:type owl:NamedIndividual ,
                      om:Depth ;
             om:hasDimension om:millimetre ;
             om:hasNumericalValue "11.68"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellDepth11
:wellDepth11 rdf:type owl:NamedIndividual ,
                      om:Depth ;
             om:hasDimension om:millimetre ;
             om:hasNumericalValue "9.39"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellDepth12
:wellDepth12 rdf:type owl:NamedIndividual ,
                      om:Depth ;
             om:hasDimension om:millimetre ;
             om:hasNumericalValue "11.68"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellDepth13
:wellDepth13 rdf:type owl:NamedIndividual ,
                      om:Depth ;
             om:hasDimension om:millimetre ;
             om:hasNumericalValue "10.67"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellDepth14
:wellDepth14 rdf:type owl:NamedIndividual ,
                      om:Depth ;
             om:hasDimension om:millimetre ;
             om:hasNumericalValue "10.9"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellDepth15
:wellDepth15 rdf:type owl:NamedIndividual ,
                      om:Depth ;
             om:hasDimension om:millimetre ;
             om:hasNumericalValue "16.5"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellDepth16
:wellDepth16 rdf:type owl:NamedIndividual ,
                      om:Depth ;
             om:hasDimension om:millimetre ;
             om:hasNumericalValue "10.59"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellDepth17
:wellDepth17 rdf:type owl:NamedIndividual ,
                      om:Depth ;
             om:hasDimension om:millimetre ;
             om:hasNumericalValue "42.3"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellDepth18
:wellDepth18 rdf:type owl:NamedIndividual ,
                      om:Depth ;
             om:hasDimension om:millimetre ;
             om:hasNumericalValue "11.43"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellDepth19
:wellDepth19 rdf:type owl:NamedIndividual ,
                      om:Depth ;
             om:hasDimension om:millimetre ;
             om:hasNumericalValue "14.6"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellDepth2
:wellDepth2 rdf:type owl:NamedIndividual ,
                     om:Depth ;
            om:hasDimension om:millimetre ;
            om:hasNumericalValue "11.43"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellDepth20
:wellDepth20 rdf:type owl:NamedIndividual ,
                      om:Depth ;
             om:hasDimension om:millimetre ;
             om:hasNumericalValue "11.57"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellDepth21
:wellDepth21 rdf:type owl:NamedIndividual ,
                      om:Depth ;
             om:hasDimension om:millimetre ;
             om:hasNumericalValue "16.5"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellDepth22
:wellDepth22 rdf:type owl:NamedIndividual ,
                      om:Depth ;
             om:hasDimension om:millimetre ;
             om:hasNumericalValue "5.3"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellDepth23
:wellDepth23 rdf:type owl:NamedIndividual ,
                      om:Depth ;
             om:hasDimension om:millimetre ;
             om:hasNumericalValue "10.668"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellDepth24
:wellDepth24 rdf:type owl:NamedIndividual ,
                      om:Depth ;
             om:hasDimension om:millimetre ;
             om:hasNumericalValue "11.56"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellDepth25
:wellDepth25 rdf:type owl:NamedIndividual ,
                      om:Depth ;
             om:hasDimension om:millimetre ;
             om:hasNumericalValue "11.3"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellDepth26
:wellDepth26 rdf:type owl:NamedIndividual ,
                      om:Depth ;
             om:hasDimension om:millimetre ;
             om:hasNumericalValue "39.1"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellDepth27
:wellDepth27 rdf:type owl:NamedIndividual ,
                      om:Depth ;
             om:hasDimension om:millimetre ;
             om:hasNumericalValue "11.7"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellDepth28
:wellDepth28 rdf:type owl:NamedIndividual ,
                      om:Depth ;
             om:hasDimension om:millimetre ;
             om:hasNumericalValue "5.1"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellDepth29
:wellDepth29 rdf:type owl:NamedIndividual ,
                      om:Depth ;
             om:hasDimension om:millimetre ;
             om:hasNumericalValue "6.58"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellDepth3
:wellDepth3 rdf:type owl:NamedIndividual ,
                     om:Depth ;
            om:hasDimension om:millimetre ;
            om:hasNumericalValue "10.45"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellDepth30
:wellDepth30 rdf:type owl:NamedIndividual ,
                      om:Depth ;
             om:hasDimension om:millimetre ;
             om:hasNumericalValue "10.5"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellDepth31
:wellDepth31 rdf:type owl:NamedIndividual ,
                      om:Depth ;
             om:hasDimension om:millimetre ;
             om:hasNumericalValue "5.3"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellDepth32
:wellDepth32 rdf:type owl:NamedIndividual ,
                      om:Depth ;
             om:hasDimension om:millimetre ;
             om:hasNumericalValue "11.43"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellDepth33
:wellDepth33 rdf:type owl:NamedIndividual ,
                      om:Depth ;
             om:hasDimension om:millimetre ;
             om:hasNumericalValue "42.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellDepth34
:wellDepth34 rdf:type owl:NamedIndividual ,
                      om:Depth ;
             om:hasDimension om:millimetre ;
             om:hasNumericalValue "11.43"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellDepth35
:wellDepth35 rdf:type owl:NamedIndividual ,
                      om:Depth ;
             om:hasDimension om:millimetre ;
             om:hasNumericalValue "11.5"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellDepth36
:wellDepth36 rdf:type owl:NamedIndividual ,
                      om:Depth ;
             om:hasDimension om:millimetre ;
             om:hasNumericalValue "4.8"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellDepth37
:wellDepth37 rdf:type owl:NamedIndividual ,
                      om:Depth ;
             om:hasDimension om:millimetre ;
             om:hasNumericalValue "5.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellDepth38
:wellDepth38 rdf:type owl:NamedIndividual ,
                      om:Depth ;
             om:hasDimension om:millimetre ;
             om:hasNumericalValue "42.03"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellDepth39
:wellDepth39 rdf:type owl:NamedIndividual ,
                      om:Depth ;
             om:hasDimension om:millimetre ;
             om:hasNumericalValue "39.3"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellDepth4
:wellDepth4 rdf:type owl:NamedIndividual ,
                     om:Depth ;
            om:hasDimension om:millimetre ;
            om:hasNumericalValue "12.9"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellDepth40
:wellDepth40 rdf:type owl:NamedIndividual ,
                      om:Depth ;
             om:hasDimension om:millimetre ;
             om:hasNumericalValue "12.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellDepth5
:wellDepth5 rdf:type owl:NamedIndividual ,
                     om:Depth ;
            om:hasDimension om:millimetre ;
            om:hasNumericalValue "36.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellDepth6
:wellDepth6 rdf:type owl:NamedIndividual ,
                     om:Depth ;
            om:hasDimension om:millimetre ;
            om:hasNumericalValue "11.5"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellDepth7
:wellDepth7 rdf:type owl:NamedIndividual ,
                     om:Depth ;
            om:hasDimension om:millimetre ;
            om:hasNumericalValue "10.67"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellDepth8
:wellDepth8 rdf:type owl:NamedIndividual ,
                     om:Depth ;
            om:hasDimension om:millimetre ;
            om:hasNumericalValue "10.67"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellDepth9
:wellDepth9 rdf:type owl:NamedIndividual ,
                     om:Depth ;
            om:hasDimension om:millimetre ;
            om:hasNumericalValue "11.2"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellvolume0
:wellvolume0 rdf:type owl:NamedIndividual ,
                      om:Volume ;
             om:hasDimension om:microlitre ;
             om:hasNumericalValue "40.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellvolume1
:wellvolume1 rdf:type owl:NamedIndividual ,
                      om:Volume ;
             om:hasDimension om:microlitre ;
             om:hasNumericalValue "410.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellvolume10
:wellvolume10 rdf:type owl:NamedIndividual ,
                       om:Volume ;
              om:hasDimension om:microlitre ;
              om:hasNumericalValue "410.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellvolume11
:wellvolume11 rdf:type owl:NamedIndividual ,
                       om:Volume ;
              om:hasDimension om:microlitre ;
              om:hasNumericalValue "40.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellvolume12
:wellvolume12 rdf:type owl:NamedIndividual ,
                       om:Volume ;
              om:hasDimension om:microlitre ;
              om:hasNumericalValue "410.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellvolume13
:wellvolume13 rdf:type owl:NamedIndividual ,
                       om:Volume ;
              om:hasDimension om:microlitre ;
              om:hasNumericalValue "340.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellvolume14
:wellvolume14 rdf:type owl:NamedIndividual ,
                       om:Volume ;
              om:hasDimension om:microlitre ;
              om:hasNumericalValue "340.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellvolume15
:wellvolume15 rdf:type owl:NamedIndividual ,
                       om:Volume ;
              om:hasDimension om:microlitre ;
              om:hasNumericalValue "5000.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellvolume16
:wellvolume16 rdf:type owl:NamedIndividual ,
                       om:Volume ;
              om:hasDimension om:microlitre ;
              om:hasNumericalValue "320.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellvolume17
:wellvolume17 rdf:type owl:NamedIndividual ,
                       om:Volume ;
              om:hasDimension om:microlitre ;
              om:hasNumericalValue "1000.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellvolume18
:wellvolume18 rdf:type owl:NamedIndividual ,
                       om:Volume ;
              om:hasDimension om:microlitre ;
              om:hasNumericalValue "80.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellvolume19
:wellvolume19 rdf:type owl:NamedIndividual ,
                       om:Volume ;
              om:hasDimension om:microlitre ;
              om:hasNumericalValue "160.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellvolume2
:wellvolume2 rdf:type owl:NamedIndividual ,
                      om:Volume ;
             om:hasDimension om:microlitre ;
             om:hasNumericalValue "80.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellvolume20
:wellvolume20 rdf:type owl:NamedIndividual ,
                       om:Volume ;
              om:hasDimension om:microlitre ;
              om:hasNumericalValue "70.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellvolume21
:wellvolume21 rdf:type owl:NamedIndividual ,
                       om:Volume ;
              om:hasDimension om:microlitre ;
              om:hasNumericalValue "5000.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellvolume22
:wellvolume22 rdf:type owl:NamedIndividual ,
                       om:Volume ;
              om:hasDimension om:microlitre ;
              om:hasNumericalValue "28.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellvolume23
:wellvolume23 rdf:type owl:NamedIndividual ,
                       om:Volume ;
              om:hasDimension om:microlitre ;
              om:hasNumericalValue "200.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellvolume24
:wellvolume24 rdf:type owl:NamedIndividual ,
                       om:Volume ;
              om:hasDimension om:microlitre ;
              om:hasNumericalValue "90.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellvolume25
:wellvolume25 rdf:type owl:NamedIndividual ,
                       om:Volume ;
              om:hasDimension om:microlitre ;
              om:hasNumericalValue "340.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellvolume26
:wellvolume26 rdf:type owl:NamedIndividual ,
                       om:Volume ;
              om:hasDimension om:microlitre ;
              om:hasNumericalValue "32000.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellvolume27
:wellvolume27 rdf:type owl:NamedIndividual ,
                       om:Volume ;
              om:hasDimension om:microlitre ;
              om:hasNumericalValue "120.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellvolume28
:wellvolume28 rdf:type owl:NamedIndividual ,
                       om:Volume ;
              om:hasDimension om:microlitre ;
              om:hasNumericalValue "14.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellvolume29
:wellvolume29 rdf:type owl:NamedIndividual ,
                       om:Volume ;
              om:hasDimension om:microlitre ;
              om:hasNumericalValue "35.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellvolume3
:wellvolume3 rdf:type owl:NamedIndividual ,
                      om:Volume ;
             om:hasDimension om:microlitre ;
             om:hasNumericalValue "105.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellvolume30
:wellvolume30 rdf:type owl:NamedIndividual ,
                       om:Volume ;
              om:hasDimension om:microlitre ;
              om:hasNumericalValue "400.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellvolume31
:wellvolume31 rdf:type owl:NamedIndividual ,
                       om:Volume ;
              om:hasDimension om:microlitre ;
              om:hasNumericalValue "28.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellvolume32
:wellvolume32 rdf:type owl:NamedIndividual ,
                       om:Volume ;
              om:hasDimension om:microlitre ;
              om:hasNumericalValue "90.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellvolume33
:wellvolume33 rdf:type owl:NamedIndividual ,
                       om:Volume ;
              om:hasDimension om:microlitre ;
              om:hasNumericalValue "10000.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellvolume34
:wellvolume34 rdf:type owl:NamedIndividual ,
                       om:Volume ;
              om:hasDimension om:microlitre ;
              om:hasNumericalValue "80.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellvolume35
:wellvolume35 rdf:type owl:NamedIndividual ,
                       om:Volume ;
              om:hasDimension om:microlitre ;
              om:hasNumericalValue "120.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellvolume36
:wellvolume36 rdf:type owl:NamedIndividual ,
                       om:Volume ;
              om:hasDimension om:microlitre ;
              om:hasNumericalValue "12.5"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellvolume37
:wellvolume37 rdf:type owl:NamedIndividual ,
                       om:Volume ;
              om:hasDimension om:microlitre ;
              om:hasNumericalValue "10.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellvolume38
:wellvolume38 rdf:type owl:NamedIndividual ,
                       om:Volume ;
              om:hasDimension om:microlitre ;
              om:hasNumericalValue "2000.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellvolume39
:wellvolume39 rdf:type owl:NamedIndividual ,
                       om:Volume ;
              om:hasDimension om:microlitre ;
              om:hasNumericalValue "21000.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellvolume4
:wellvolume4 rdf:type owl:NamedIndividual ,
                      om:Volume ;
             om:hasDimension om:microlitre ;
             om:hasNumericalValue "200.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellvolume40
:wellvolume40 rdf:type owl:NamedIndividual ,
                       om:Volume ;
              om:hasDimension om:microlitre ;
              om:hasNumericalValue "100.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellvolume5
:wellvolume5 rdf:type owl:NamedIndividual ,
                      om:Volume ;
             om:hasDimension om:microlitre ;
             om:hasNumericalValue "9000.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellvolume6
:wellvolume6 rdf:type owl:NamedIndividual ,
                      om:Volume ;
             om:hasDimension om:microlitre ;
             om:hasNumericalValue "135.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellvolume7
:wellvolume7 rdf:type owl:NamedIndividual ,
                      om:Volume ;
             om:hasDimension om:microlitre ;
             om:hasNumericalValue "360.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellvolume8
:wellvolume8 rdf:type owl:NamedIndividual ,
                      om:Volume ;
             om:hasDimension om:microlitre ;
             om:hasNumericalValue "340.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#wellvolume9
:wellvolume9 rdf:type owl:NamedIndividual ,
                      om:Volume ;
             om:hasDimension om:microlitre ;
             om:hasNumericalValue "320.0"^^xsd:float .


###  URL_PREFIX/strateos-catalog-individuals.ttl#E%26K%20Scientific24-deep
<URL_PREFIX/strateos-catalog-individuals.ttl#E%26K%20Scientific24-deep> rdf:type owl:NamedIndividual ,
                                                                                                                                                       cont:Plate ;
                                                                                                                                              cont:availableAt :Strateos ;
                                                                                                                                              cont:equipmentVendor <URL_PREFIX/container-ontology.ttl#E%26K%20Scientific> ;
                                                                                                                                              cont:hasCatalogEntry <URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#E%26K%20ScientificEK-2053-S> ;
                                                                                                                                              cont:height :height33 ;
                                                                                                                                              cont:wellDepth :wellDepth33 ;
                                                                                                                                              cont:wellVolume :wellvolume33 ;
                                                                                                                                              cont:columnCount 6 ;
                                                                                                                                              cont:rowCount 4 ;
                                                                                                                                              cont:wellCount 24 ;
                                                                                                                                              rdfs:comment "E&K Scientific 24-Well Pyramid Bottom Plate" ;
                                                                                                                                              rdfs:label "24-deep" .


###  URL_PREFIX/strateos-catalog-individuals.ttl#Sumitomo%20Bakelite%20Co.384-ubottom-white-tc
<URL_PREFIX/strateos-catalog-individuals.ttl#Sumitomo%20Bakelite%20Co.384-ubottom-white-tc> rdf:type owl:NamedIndividual ,
                                                                                                                                                                           cont:Plate ;
                                                                                                                                                                  cont:availableAt :Strateos ;
                                                                                                                                                                  cont:equipmentVendor <URL_PREFIX/container-ontology.ttl#Sumitomo%20Bakelite%20Co.> ;
                                                                                                                                                                  cont:hasCatalogEntry <URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Sumitomo%20Bakelite%20Co.MS-9384WZ> ;
                                                                                                                                                                  cont:height :height40 ;
                                                                                                                                                                  cont:wellDepth :wellDepth40 ;
                                                                                                                                                                  cont:wellVolume :wellvolume40 ;
                                                                                                                                                                  cont:columnCount 24 ;
                                                                                                                                                                  cont:rowCount 16 ;
                                                                                                                                                                  cont:wellCount 384 ;
                                                                                                                                                                  rdfs:comment "Sumitomo Bakelite Co. Sumitomo Bakelite Co. PrimeSurface384U White Plate 3-D Cell Culture Plate" ;
                                                                                                                                                                  rdfs:label "384-ubottom-white-tc" .


###  URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Axygenres-mw12-hp
<URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Axygenres-mw12-hp> rdf:type owl:NamedIndividual ,
                                                                                                                                                               cont:CatalogEntry ;
                                                                                                                                                      cont:catalogNumber "res-mw12-hp" ;
                                                                                                                                                      cont:hasVendor cont:Axygen .


###  URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Axygenres-mw8-hp
<URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Axygenres-mw8-hp> rdf:type owl:NamedIndividual ,
                                                                                                                                                              cont:CatalogEntry ;
                                                                                                                                                     cont:catalogNumber "res-mw8-hp" ;
                                                                                                                                                     cont:hasVendor cont:Axygen .


###  URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Chemspeedunknown
<URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Chemspeedunknown> rdf:type owl:NamedIndividual ,
                                                                                                                                                              cont:CatalogEntry ;
                                                                                                                                                     cont:catalogNumber "unknown" ;
                                                                                                                                                     cont:hasVendor cont:Chemspeed .


###  URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Corning353077
<URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Corning353077> rdf:type owl:NamedIndividual ,
                                                                                                                                                           cont:CatalogEntry ;
                                                                                                                                                  cont:catalogNumber "353077" ;
                                                                                                                                                  cont:hasVendor cont:Corning .


###  URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Corning3570
<URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Corning3570> rdf:type owl:NamedIndividual ,
                                                                                                                                                         cont:CatalogEntry ;
                                                                                                                                                cont:catalogNumber "3570" ;
                                                                                                                                                cont:hasVendor cont:Corning .


###  URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Corning3574
<URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Corning3574> rdf:type owl:NamedIndividual ,
                                                                                                                                                         cont:CatalogEntry ;
                                                                                                                                                cont:catalogNumber "3574" ;
                                                                                                                                                cont:hasVendor cont:Corning .


###  URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Corning3632
<URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Corning3632> rdf:type owl:NamedIndividual ,
                                                                                                                                                         cont:CatalogEntry ;
                                                                                                                                                cont:catalogNumber "3632" ;
                                                                                                                                                cont:hasVendor cont:Corning .


###  URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Corning3635
<URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Corning3635> rdf:type owl:NamedIndividual ,
                                                                                                                                                         cont:CatalogEntry ;
                                                                                                                                                cont:catalogNumber "3635" ;
                                                                                                                                                cont:hasVendor cont:Corning .


###  URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Corning3657
<URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Corning3657> rdf:type owl:NamedIndividual ,
                                                                                                                                                         cont:CatalogEntry ;
                                                                                                                                                cont:catalogNumber "3657" ;
                                                                                                                                                cont:hasVendor cont:Corning .


###  URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Corning3700
<URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Corning3700> rdf:type owl:NamedIndividual ,
                                                                                                                                                         cont:CatalogEntry ;
                                                                                                                                                cont:catalogNumber "3700" ;
                                                                                                                                                cont:hasVendor cont:Corning .


###  URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Corning3706
<URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Corning3706> rdf:type owl:NamedIndividual ,
                                                                                                                                                         cont:CatalogEntry ;
                                                                                                                                                cont:catalogNumber "3706" ;
                                                                                                                                                cont:hasVendor cont:Corning .


###  URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Corning3727
<URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Corning3727> rdf:type owl:NamedIndividual ,
                                                                                                                                                         cont:CatalogEntry ;
                                                                                                                                                cont:catalogNumber "3727" ;
                                                                                                                                                cont:hasVendor cont:Corning .


###  URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Corning3763
<URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Corning3763> rdf:type owl:NamedIndividual ,
                                                                                                                                                         cont:CatalogEntry ;
                                                                                                                                                cont:catalogNumber "3763" ;
                                                                                                                                                cont:hasVendor cont:Corning .


###  URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Corning3824
<URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Corning3824> rdf:type owl:NamedIndividual ,
                                                                                                                                                         cont:CatalogEntry ;
                                                                                                                                                cont:catalogNumber "3824" ;
                                                                                                                                                cont:hasVendor cont:Corning .


###  URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Corning3894
<URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Corning3894> rdf:type owl:NamedIndividual ,
                                                                                                                                                         cont:CatalogEntry ;
                                                                                                                                                cont:catalogNumber "3894" ;
                                                                                                                                                cont:hasVendor cont:Corning .


###  URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Corning3961
<URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Corning3961> rdf:type owl:NamedIndividual ,
                                                                                                                                                         cont:CatalogEntry ;
                                                                                                                                                cont:catalogNumber "3961" ;
                                                                                                                                                cont:hasVendor cont:Corning .


###  URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Corning4514
<URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Corning4514> rdf:type owl:NamedIndividual ,
                                                                                                                                                         cont:CatalogEntry ;
                                                                                                                                                cont:catalogNumber "4514" ;
                                                                                                                                                cont:hasVendor cont:Corning .


###  URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Costar3590
<URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Costar3590> rdf:type owl:NamedIndividual ,
                                                                                                                                                        cont:CatalogEntry ;
                                                                                                                                               cont:catalogNumber "3590" ;
                                                                                                                                               cont:hasVendor cont:Costar .


###  URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Eppendorf30720016
<URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Eppendorf30720016> rdf:type owl:NamedIndividual ,
                                                                                                                                                               cont:CatalogEntry ;
                                                                                                                                                      cont:catalogNumber "30720016" ;
                                                                                                                                                      cont:hasVendor cont:Eppendorf .


###  URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Eppendorf30720113
<URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Eppendorf30720113> rdf:type owl:NamedIndividual ,
                                                                                                                                                               cont:CatalogEntry ;
                                                                                                                                                      cont:catalogNumber "30720113" ;
                                                                                                                                                      cont:hasVendor cont:Eppendorf .


###  URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Eppendorf30730119
<URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Eppendorf30730119> rdf:type owl:NamedIndividual ,
                                                                                                                                                               cont:CatalogEntry ;
                                                                                                                                                      cont:catalogNumber "30730119" ;
                                                                                                                                                      cont:hasVendor cont:Eppendorf .


###  URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Eppendorf951020539
<URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Eppendorf951020539> rdf:type owl:NamedIndividual ,
                                                                                                                                                                cont:CatalogEntry ;
                                                                                                                                                       cont:catalogNumber "951020539" ;
                                                                                                                                                       cont:hasVendor cont:Eppendorf .


###  URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Eppendorf951020619
<URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Eppendorf951020619> rdf:type owl:NamedIndividual ,
                                                                                                                                                                cont:CatalogEntry ;
                                                                                                                                                       cont:catalogNumber "951020619" ;
                                                                                                                                                       cont:hasVendor cont:Eppendorf .


###  URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Fisher22-387-030
<URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Fisher22-387-030> rdf:type owl:NamedIndividual ,
                                                                                                                                                              cont:CatalogEntry ;
                                                                                                                                                     cont:catalogNumber "22-387-030" ;
                                                                                                                                                     cont:hasVendor cont:Fisher .


###  URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Fisher22-387-031
<URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Fisher22-387-031> rdf:type owl:NamedIndividual ,
                                                                                                                                                              cont:CatalogEntry ;
                                                                                                                                                     cont:catalogNumber "22-387-031" ;
                                                                                                                                                     cont:hasVendor cont:Fisher .


###  URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Fisher249944
<URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Fisher249944> rdf:type owl:NamedIndividual ,
                                                                                                                                                          cont:CatalogEntry ;
                                                                                                                                                 cont:catalogNumber "249944" ;
                                                                                                                                                 cont:hasVendor cont:Fisher .


###  URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Greiner655077
<URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Greiner655077> rdf:type owl:NamedIndividual ,
                                                                                                                                                           cont:CatalogEntry ;
                                                                                                                                                  cont:catalogNumber "655077" ;
                                                                                                                                                  cont:hasVendor cont:Greiner .


###  URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Greiner781280
<URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Greiner781280> rdf:type owl:NamedIndividual ,
                                                                                                                                                           cont:CatalogEntry ;
                                                                                                                                                  cont:catalogNumber "781280" ;
                                                                                                                                                  cont:hasVendor cont:Greiner .


###  URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Greiner782073
<URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Greiner782073> rdf:type owl:NamedIndividual ,
                                                                                                                                                           cont:CatalogEntry ;
                                                                                                                                                  cont:catalogNumber "782073" ;
                                                                                                                                                  cont:hasVendor cont:Greiner .


###  URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#LabcyteLP-0200
<URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#LabcyteLP-0200> rdf:type owl:NamedIndividual ,
                                                                                                                                                            cont:CatalogEntry ;
                                                                                                                                                   cont:catalogNumber "LP-0200" ;
                                                                                                                                                   cont:hasVendor cont:Labcyte .


###  URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#LabcytePP-0200
<URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#LabcytePP-0200> rdf:type owl:NamedIndividual ,
                                                                                                                                                            cont:CatalogEntry ;
                                                                                                                                                   cont:catalogNumber "PP-0200" ;
                                                                                                                                                   cont:hasVendor cont:Labcyte .


###  URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#MesoscaleK15048G
<URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#MesoscaleK15048G> rdf:type owl:NamedIndividual ,
                                                                                                                                                              cont:CatalogEntry ;
                                                                                                                                                     cont:catalogNumber "K15048G" ;
                                                                                                                                                     cont:hasVendor cont:Mesoscale .


###  URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#MesoscaleK15069L
<URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#MesoscaleK15069L> rdf:type owl:NamedIndividual ,
                                                                                                                                                              cont:CatalogEntry ;
                                                                                                                                                     cont:catalogNumber "K15069L" ;
                                                                                                                                                     cont:hasVendor cont:Mesoscale .


###  URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#MesoscaleK152MSD
<URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#MesoscaleK152MSD> rdf:type owl:NamedIndividual ,
                                                                                                                                                              cont:CatalogEntry ;
                                                                                                                                                     cont:catalogNumber "K152MSD" ;
                                                                                                                                                     cont:hasVendor cont:Mesoscale .


###  URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#PerkinElmer6007290
<URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#PerkinElmer6007290> rdf:type owl:NamedIndividual ,
                                                                                                                                                                cont:CatalogEntry ;
                                                                                                                                                       cont:catalogNumber "6007290" ;
                                                                                                                                                       cont:hasVendor cont:PerkinElmer .


###  URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#PerkinElmer6008260
<URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#PerkinElmer6008260> rdf:type owl:NamedIndividual ,
                                                                                                                                                                cont:CatalogEntry ;
                                                                                                                                                       cont:catalogNumber "6008260" ;
                                                                                                                                                       cont:hasVendor cont:PerkinElmer .


###  URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#PerkinElmer6008280
<URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#PerkinElmer6008280> rdf:type owl:NamedIndividual ,
                                                                                                                                                                cont:CatalogEntry ;
                                                                                                                                                       cont:catalogNumber "6008280" ;
                                                                                                                                                       cont:hasVendor cont:PerkinElmer .


###  URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#ThermoFisher136101
<URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#ThermoFisher136101> rdf:type owl:NamedIndividual ,
                                                                                                                                                                cont:CatalogEntry ;
                                                                                                                                                       cont:catalogNumber "136101" ;
                                                                                                                                                       cont:hasVendor cont:ThermoFisher .


###  URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#ThermoFisher264573
<URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#ThermoFisher264573> rdf:type owl:NamedIndividual ,
                                                                                                                                                                cont:CatalogEntry ;
                                                                                                                                                       cont:catalogNumber "264573" ;
                                                                                                                                                       cont:hasVendor cont:ThermoFisher .


###  URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#E%26K%20ScientificEK-2053-S
<URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#E%26K%20ScientificEK-2053-S> rdf:type owl:NamedIndividual ,
                                                                                                                                                                         cont:CatalogEntry ;
                                                                                                                                                                cont:catalogNumber "EK-2053-S" ;
                                                                                                                                                                cont:hasVendor <URL_PREFIX/container-ontology.ttl#E%26K%20Scientific> .


###  URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Sumitomo%20Bakelite%20Co.MS-9384WZ
<URL_PREFIX/strateos-catalog-individuals.ttl/catalog-entries#Sumitomo%20Bakelite%20Co.MS-9384WZ> rdf:type owl:NamedIndividual ,
                                                                                                                                                                                cont:CatalogEntry ;
                                                                                                                                                                       cont:catalogNumber "MS-9384WZ" ;
                                                                                                                                                                       cont:hasVendor <URL_PREFIX/container-ontology.ttl#Sumitomo%20Bakelite%20Co.> .


###  Generated by the OWL API (version 4.5.9.2019-02-01T07:24:44Z) https://github.com/owlcs/owlapi
