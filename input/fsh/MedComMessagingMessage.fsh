Profile: MedComMessagingMessage
Parent: Bundle
Id: medcom-messaging-message
Description: "Base resource for all MedCom messages."
* id 1..
* id MS
* type MS
* type = #message
* type ^short = "Always message"
* timestamp 1.. MS
* entry MS
* entry.resource MS
* entry.resource ^short = "Each MedCom message shall contain a MedComMessagingMessageHeader and MedComMessagingProvenance. Please refer to invariant medcom-messaging-1, medcom-messaging-2, and medcom-messaging-3."
* obeys medcom-messaging-1
* obeys medcom-messaging-2
* obeys medcom-messaging-3

Invariant: medcom-messaging-1
Description: "The MessageHeader resource shall conform to medcom-messaging-messageHeader profile"
Severity: #error
Expression: "entry.ofType(MessageHeader).all(resource.conformsTo('http://medcomfhir.dk/fhir/messaging/StructureDefinition/medcom-messaging-messageHeader'))"

Invariant: medcom-messaging-2
Description: "There shall be at least one Provenance resource in a MedCom message"
Severity: #error
Expression: "entry.resource.ofType(Provenance).exists()"

Invariant: medcom-messaging-3
Description: "All Provenance resources shall conform to medcom-core-provenance profile"
Severity: #error
Expression: "entry.ofType(Provenance).all(resource.conformsTo('http://medcomfhir.dk/fhir/messaging/StructureDefinition/medcom-messaging-provenance'))"

Instance: eb26be85-fdb7-454d-a980-95cba6d1745b
InstanceOf: MedComMessagingMessage
Title: "Bundle used in an empty message."
Description: "Example of an empty message."
* type = $BundleType#message
* timestamp = 2020-09-28T12:34:56Z
* entry[+].fullUrl = "MessageHeader/3881874e-2042-4a00-aee8-23512799f512"
* entry[=].resource = 3881874e-2042-4a00-aee8-23512799f512
* entry[+].fullUrl = "Provenance/f61adfbe-d50f-11ec-9d64-0242ac120002"
* entry[=].resource = f61adfbe-d50f-11ec-9d64-0242ac120002
* entry[+].fullUrl = "Organization/d7056980-a8b2-42aa-8a0e-c1fc85d1f40d"
* entry[=].resource = d7056980-a8b2-42aa-8a0e-c1fc85d1f40d
* entry[+].fullUrl = "Organization/74cdf292-abf3-4f5f-80ea-60a48013ff6d"
* entry[=].resource = 74cdf292-abf3-4f5f-80ea-60a48013ff6d
