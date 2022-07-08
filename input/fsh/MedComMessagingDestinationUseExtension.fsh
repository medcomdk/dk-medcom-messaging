Extension: MedComMessagingDestinationUseExtension
Id: medcom-messaging-destinationUseExtension
Title: "MedComDestinationUseExtension"
Description: "Indicates whether the use of a destination in a MedCom message header is as a primary or a carbon copy recipient of the message"
* value[x] 1..1
* value[x] only Coding
* valueCoding.system = "http://medcomfhir.dk/fhir/dk-medcom-terminology/CodeSystem/medcom-messaging-destinationUse"
