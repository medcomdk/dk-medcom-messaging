Profile: MedComMessagingMessageHeader
Parent: MessageHeader
Id: medcom-messaging-messageHeader
Description: "MessageHeader for MedCom messages"
* id 1..
* id MS
* id ^short = "Each message shall include a globally unique id."
* event[x] 
* event[x] only Coding
* event[x] ^short = "The event element shall contain a value from MedComMessagingMessageTypes"
* eventCoding 1.. MS
* eventCoding from MedComMessagingMessageTypes
* eventCoding.code 1..
* destination.extension contains MedComMessagingDestinationUseExtension named use 1..1
* destination.extension[use] MS
* destination ^slicing.discriminator.type = #value
* destination ^slicing.discriminator.path = "$this.extension.value"
* destination ^slicing.rules = #closed
* destination contains primary 1..1 MS and cc 0..
* destination[primary].extension[use].valueCoding = $Use#primary
* destination[primary].receiver only Reference(MedComMessagingOrganization)
* destination[primary].receiver 1.. MS
* destination[primary].receiver ^type.aggregation = #bundled
* destination[primary].endpoint MS
* destination[primary].receiver ^short = "The primary reciever of the message"
* destination[cc].extension[use].valueCoding = $Use#cc
* destination[cc].receiver only Reference(MedComMessagingOrganization)
* destination[cc].receiver 1.. MS
* destination[cc].receiver ^type.aggregation = #bundled
* destination[cc].endpoint MS
* destination[cc].receiver ^short = "The carbon copy reciever of the message. Is only used when a message has multiple recievers."
* sender 1.. MS
* sender ^type.aggregation = #bundled
* sender only Reference(MedComMessagingOrganization)
* sender ^short = "The actual sender of the message"
* source MS
* source.endpoint MS
* source ^short = "Contains the information about the target for the Acknowledgement message."
* text MS
* text ^short = "A summary of the resource content. The narrative text shall always be included when exchanging a MedCom message. All MustSupport elements and extensions shall be included."

Instance: b4e7e16b-9658-4172-acd7-5e7193f2cc5f
InstanceOf: MedComMessagingDestinationUseExtension
Usage: #inline
* valueCoding.code = $Use#primary

//Empty message Header
Instance: 3881874e-2042-4a00-aee8-23512799f512
InstanceOf: MedComMessagingMessageHeader
Title: "MessageHeader for an empty message. Valid only if used in a bundle (message)"
Description: "MessageHeader for an empty message. Valid only if used in a bundle (message)."
* destination.extension[use] = b4e7e16b-9658-4172-acd7-5e7193f2cc5f
* eventCoding = $MessageEvents#empty-message
* destination.endpoint = "http://medcomfhir.dk/unknown"
* destination.receiver = Reference(74cdf292-abf3-4f5f-80ea-60a48013ff6d)
* sender = Reference(d7056980-a8b2-42aa-8a0e-c1fc85d1f40d)
* source.endpoint = "http://medcomfhir.dk/unknown"

// CareCommunication
Instance: 42c01434-8feb-11ec-b909-0242ac120002
InstanceOf: MedComMessagingMessageHeader
Title: "MessageHeader for a CareCommunication message. Valid only if used in a bundle (message)"
Description: "MessageHeader for a CareCommunication message. Valid only if used in a bundle (message). NB: A CareCommunication message shall use a CareCommunicationMessageHeader, as some elements and invariants are missing."
* destination.extension[use] = b4e7e16b-9658-4172-acd7-5e7193f2cc5f
* eventCoding = $MessageEvents#care-communication-message
* destination.endpoint = "http://medcomfhir.dk/unknown"
* destination.receiver = Reference(74cdf292-abf3-4f5f-80ea-60a48013ff6d)
* sender = Reference(d7056980-a8b2-42aa-8a0e-c1fc85d1f40d)
* source.endpoint = "http://medcomfhir.dk/unknown"

//HospitalNotification
Instance: cb0b2ef0-8feb-11ec-b909-0242ac120002
InstanceOf: MedComMessagingMessageHeader
Title: "MessageHeader for a HospitalNotification message. Valid only if used in a bundle (message)"
Description: "MessageHeader for a HospitalNotification message. Valid only if used in a bundle (message). NB: A HospitalNotification message shall use a HospitalNotificationMessageHeader, as some elements and invariants are missing."
* destination.extension[use] = b4e7e16b-9658-4172-acd7-5e7193f2cc5f
* eventCoding = $MessageEvents#hospital-notification-message
* destination.endpoint = "http://medcomfhir.dk/unknown"
* destination.receiver = Reference(74cdf292-abf3-4f5f-80ea-60a48013ff6d)
* sender = Reference(d7056980-a8b2-42aa-8a0e-c1fc85d1f40d)
* source.endpoint = "http://medcomfhir.dk/unknown"

// Acknowledgement
Instance: d28b9cb4-8feb-11ec-b909-0242ac120002
InstanceOf: MedComMessagingMessageHeader
Title: "MessageHeader for a Acknowledgement message. Valid only if used in a bundle (message)"
Description: "MessageHeader for a Acknowledgement message. Valid only if used in a bundle (message). NB: An Acknowledgement message shall use an AcknowledgementMessageHeader, as some elements and invariants are missing."
* destination.extension[use] = b4e7e16b-9658-4172-acd7-5e7193f2cc5f
* eventCoding = $MessageEvents#acknowledgment-message
* destination.endpoint = "http://medcomfhir.dk/unknown"
* destination.receiver = Reference(74cdf292-abf3-4f5f-80ea-60a48013ff6d)
* sender = Reference(d7056980-a8b2-42aa-8a0e-c1fc85d1f40d)
* source.endpoint = "http://medcomfhir.dk/unknown"