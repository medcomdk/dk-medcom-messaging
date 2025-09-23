Profile: MedComMessagingProvenance
Parent: Provenance
Id: medcom-messaging-provenance
Description: "Provenance information about the messages preceeding the current message"
* id MS
* target 1..1 MS
* target only Reference(MedComMessagingMessageHeader)
* target ^short = "Targets the MedComMessagingMessageHeader from the current message."
* occurred[x] MS
* occurredDateTime 1.. MS
* occurredDateTime ^short = "A human readable date and time for when the message is sent. Shall include a date, a time and timezone."
* recorded MS
* recorded ^short = "A system readable date and time for when the message is sent."
* activity 1.. MS
* activity from $ActivityCodesValueset
* activity ^definition = "Activity that occurred and triggered the current or a previous message"
* activity.coding 1.. MS
* activity.coding.code 1.. MS
* activity.coding.code ^definition = "The activity defined by the system"
* agent 1.. MS
* agent ^short = "The actors involved in the activity taking place"
* agent.who 1.. MS
* agent.who only Reference(MedComMessagingOrganization)
* agent.who ^type.aggregation = #bundled
* agent.who ^definition = "Shall contain the messaging organization performing the activity. This also apply to an internal transmission to another messaging organization within a given system."
* agent.who ^short = "A reference to the actor of the activity, which shall be a MedComMessagingOrganization. If more actors has been involved, the element must be sliced."
* entity MS
* entity ^definition = "Shall only be included if the current message is a response to a previous message."
* entity.role MS
* entity.what MS
* entity.what ^short = "A reference to the previous message. If the previous message is a FHIR message, the reference element must be used and if the previous message is an EDIFACT or OIOXML, the identifier element must be used."
* entity.what.identifier MS
* entity.what.identifier ^definition = "Shall contain the message header id of messages given as input to the activity if the previous message is not a fhir message"
* entity.what.identifier ^short = "If previous message is EDIFACT or OIOXML, this element must be expressed as [lokationsnummer]#[brevid] from the EDIFACT or OIOXML message."
* entity.what.reference MS
* entity.what.reference ^definition = "Shall contain the message header id of messages given as input to the activity"
* entity.what.reference ^short = "If the previous message is a FHIR message, this element must hold the MessageHeader.id from previous message."
* text MS
* insert ProducerShallPutInNarrative(id)
* insert ProducerShallPutInNarrative(target)
* insert ProducerShallPutInNarrative(occurredDateTime)
* insert ProducerShallPutInNarrative(activity.coding.code)
* insert ProducerShallPutInNarrative(agent.who)
* insert ProducerShallPutInNarrative(entity.role)
* insert ProducerShallPutInNarrative(entity.what.reference)
* insert ProducerShallPutInNarrative(entity.what.identifier)

// New-message example
Instance: 9c284936-5454-4116-95fc-3c8eeeed2400
InstanceOf: MedComMessagingProvenance
Title: "MedComMessagingProvenance example. The Provenance instance is only valid if used in a bundle (message) - new message"
Description: "MedComMessagingProvenance example. The Provenance instance is only valid if used in a bundle (message) - new message"
Usage: #example
* target = Reference(42c01434-8feb-11ec-b909-0242ac120002)
* occurredDateTime = 2020-09-28T12:34:56Z
* recorded = 2020-09-28T12:34:56Z
* activity.coding = $activityCodes#new-message
* agent.who = Reference(d7056980-a8b2-42aa-8a0e-c1fc85d1f40d)

// Provenance for an empty message
Instance: f61adfbe-d50f-11ec-9d64-0242ac120002
InstanceOf: MedComMessagingProvenance
Title: "Provenance for an empty message - new message"
Description: "Provenance for an empty message - new message"
Usage: #inline
* target = Reference(3881874e-2042-4a00-aee8-23512799f512)
* occurredDateTime = 2020-09-28T12:34:56Z
* recorded = 2020-09-28T12:34:56Z
* activity.coding = $activityCodes#new-message
* agent.who = Reference(d7056980-a8b2-42aa-8a0e-c1fc85d1f40d)