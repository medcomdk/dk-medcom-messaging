### Scope and usage
This profile is intended to be used to represent the requester organization of the observations. 


#### Contact informations
It is required to specify contact person at the organization that reqests observations. The contact infomration shall contain either initials of the general practitioner or status "unknown" from the [data-absent-reason ValueSet](http://hl7.org/fhir/R4/valueset-data-absent-reason.html) shall be sent. In  MedComMessagingRequesterOrganization the contact.name.given shall be used to express the initials of the general practitioner. The standard follows HL7 rulse to expres initals. [Click here to read the rules](http://hl7.org/fhir/R4/datatypes.html#HumanName)

Furthermore identifiers such as SOR-, EAN and Ydernummer-identifier needs to be specified. 