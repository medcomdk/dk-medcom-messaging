Profile: MedComMessagingMessageDefinitionFhir
Parent: MedComMessagingMessageDefinition
Id: medcom-messaging-messagedefinition-fhir
Description: "An example profile of the MessageDefinition-fhir resource."
* identifier.system = $MessageDefinitionIdentifierSystem#urn:dk:healthcare:medcom:messaging:fhir (exactly)
* identifier.type = $MedComMessageDefinitionType#FHIR (exactly)
* useContext.code = $UsageContextCodeSystem#workflow (exactly)
* responseRequired MS
* allowedResponse.message.value = "http://medcomfhir.dk/ig/acknowledgement/ImplementationGuide/medcom.fhir.dk.acknowledgement"
//InteroperabilityConsultant
* contact[InteroperabilityConsultant].name = "MedCom FHIR Team"
* contact[InteroperabilityConsultant].telecom.value = "fhir@medcom.dk"
* status ^short = "Must always be defined in the individual MessageDefinition"
* replaces ^short = "Takes the place of a MessageDefinition that is superseded by this MessageDefinition."
* id MS
* url MS
* identifier.system MS
* identifier.period MS
* identifier.type.coding.system MS
* identifier.type.coding.code MS
* status MS
* jurisdiction.coding MS
* jurisdiction.coding.code MS
* date MS
* event[x] MS
* description MS
* purpose MS
* useContext MS
* useContext.value[x] MS
* useContext.valueCodeableConcept MS
* useContext.valueCodeableConcept.text MS
* useContext.code MS
* useContext.code.code MS
* useContext.code.system MS
* contact[InteroperabilityConsultant].telecom MS
* contact[SubjectMatterExpert].telecom MS


//* useContext.code.system = $UsageContextCodeSystem (exactly)
//* allowedResponse.message.value = "http://medcomfhir.dk/ig/carecommunication/StructureDefinition/medcom-careCommunication-message"

//SubjectMatterExpert
//* contact[SubjectMatterExpert].name = "Subject Matter Expert, Kirsten Christiansen"
//* contact[SubjectMatterExpert].telecom.system = #email
//* contact[SubjectMatterExpert].telecom.value = "krc@medcom.dk" 
//* contact[SubjectMatterExpert].telecom.use = #work

/*
Profile: EerMsgDefHomeCareObservation
Parent: EerMessageDefinitionFhir
Description: "An example profile of the MessageDefinition-fhir resource."
* identifier.system = $EerMessageDefinitionIdentifierSystem#urn:dk:healthcare:medcom:messaging:fhir (exactly)
* identifier.type = $EHMIMedComMessageDefinitionType#FHIR
* useContext.code = $EHMIUsageContextCodeSystem#workflow (exactly)
* useContext.code.system = $EHMIUsageContextCodeSystem (exactly)
*/