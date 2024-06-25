Profile: MedComMessagingMessageDefinitionFhir
Parent: MedComMessagingMessageDefinition
Id: medcom-messaging-messagedefinition-fhir
Description: "An example profile of the MessageDefinition-fhir resource."
* identifier.system = $MessageDefinitionIdentifierSystem#urn:dk:healthcare:medcom:messaging:fhir (exactly)
* identifier.type = $MedComMessageDefinitionType#FHIR
* useContext.code = $UsageContextCodeSystem#workflow (exactly)
//* useContext.code.system = $UsageContextCodeSystem (exactly)

/*
Profile: EerMsgDefHomeCareObservation
Parent: EerMessageDefinitionFhir
Description: "An example profile of the MessageDefinition-fhir resource."
* identifier.system = $EerMessageDefinitionIdentifierSystem#urn:dk:healthcare:medcom:messaging:fhir (exactly)
* identifier.type = $EHMIMedComMessageDefinitionType#FHIR
* useContext.code = $EHMIUsageContextCodeSystem#workflow (exactly)
* useContext.code.system = $EHMIUsageContextCodeSystem (exactly)
*/