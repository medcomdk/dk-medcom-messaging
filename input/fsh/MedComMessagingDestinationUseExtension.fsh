Extension: MedComMessagingDestinationUseExtension
Id: medcom-messaging-destinationUseExtension
Title: "MedComDestinationUseExtension"
Description: "Indicates whether the use of a destination in a MedCom message header is as a primary or a carbon copy recipient of the message"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding.code 1..1 MS
* valueCoding.system 1..1 MS
* insert ProducerShallPutInNarrative(valueCoding.code)