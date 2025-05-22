Profile: MedComMessagingMessageDefinitionFhir
Parent: MedComMessagingMessageDefinition
Id: medcom-messaging-messagedefinition-fhir
Description: "An example profile of the MessageDefinition-fhir resource."
* identifier.system = $MessageDefinitionIdentifierSystem#urn:dk:healthcare:medcom:messaging:fhir (exactly)
* identifier.type = $MedComMessageDefinitionType#FHIR (exactly)
* useContext.code = $UsageContextCodeSystem#workflow (exactly)
* responseRequired MS

//InteroperabilityConsultant
* contact[InteroperabilityConsultant].name = "MedCom FHIR Team"
* contact[InteroperabilityConsultant].telecom.value = "fhir@medcom.dk"
* contact[InteroperabilityConsultant].telecom MS
* status ^short = "Must always be defined in the individual MessageDefinition"
* replaces ^short = "Takes the place of a MessageDefinition that is superseded by this MessageDefinition."
* id MS
* url MS
* identifier.system MS
* identifier.period MS
* identifier.type.coding.system MS SU
* identifier.type.coding.code MS SU
* status MS
* jurisdiction.coding MS SU
* jurisdiction.coding.code MS SU
* date MS
* event[x] MS
* description MS
* purpose MS
* useContext MS
* useContext.value[x] MS SU
* useContext.valueCodeableConcept MS SU
* useContext.valueCodeableConcept.text MS SU
* useContext.code MS
* useContext.code.code MS SU
* useContext.code.system MS
* contact[SubjectMatterExpert].telecom MS