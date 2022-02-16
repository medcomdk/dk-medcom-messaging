Profile: MedComMessagingProvenance
Parent: Provenance
Id: medcom-messaging-provenance
Description: "Provenance information about the messages preceeding the current message"
* target 1..1 MS
* target only Reference(MedComMessagingMessageHeader)
* target ^short = "Targets the MedComMessagingMessageHeader from the previous message."
* occurred[x] 1..
* occurredDateTime 1.. MS
* occurredDateTime ^short = "A human readable date and time for when the message is sent. Shall include a date, a time and timezone."
* recorded MS
* recorded ^short = "A system readable date and time for when the message is sent."
* activity 1.. MS
* activity from MedComMessagingActivityCodesValueset
* activity ^definition = "Activity that occurred and triggered the current or a previous message"
* activity.coding 1.. MS
// * activity.coding.system 1.. MS
// * activity.coding.system = "http://medcomfhir.dk/fhir/messaging/ValueSet/medcom-messaging-activityCodes-ValueSet"
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
* entity.role ^short = "When a message is a response, a correction or a forwarding message the role shall be 'revision' and when the message is a cancellation the role shall be 'removal'."
* entity.what MS
* entity.what ^short = "A reference to the previous message. If the previous message is a FHIR message, the reference element must be used and if the previous message is an EDIFACT or OIOXML, the identifier element must be used."
* entity.what.identifier MS
* entity.what.identifier ^definition = "Shall contain the message header id of messages given as input to the activity if the previous message is not a fhir message"
* entity.what.identifier ^short = "If previous message is EDIFACT or OIOXML, this element must be expressed as [lokationsnummer]#[brevid] from the EDIFACT or OIOXML message."
* entity.what.reference MS
* entity.what.reference ^definition = "Shall contain the message header id of messages given as input to the activity"
* entity.what.reference ^short = "If the previous message is a FHIR message, this element must hold the MessageHeader.id from previous message."

/* // CareCommunication new message
Instance: 9c284936-5454-4116-95fc-3c8eeeed2400
InstanceOf: MedComMessagingProvenance
Title: "CareCommunication example. The Provenance instance is only valid if used in a bundle (message) - new message"
Description: "CareCommunication example. The Provenance instance is only valid if used in a bundle (message) - new message"
Usage: #example
* target = Reference(b0d424f8-33a9-4cc2-a528-a6cc1c58727b)
* occurredDateTime = 2020-09-28T12:34:56Z
* recorded = 2020-09-28T12:34:56Z
* activity.coding = $activityCodes#new-message
* agent.who = Reference(d7056980-a8b2-42aa-8a0e-c1fc85d1f40d)

// CareCommunication reply to a new message
Instance: 80c0f779-783f-46b2-b38f-faebd2bedb3f
InstanceOf: MedComMessagingProvenance
Title: "CareCommunication example. The Provenance instance is only valid if used in a bundle (message) - reply to new message"
Description: "CareCommunication example. The Provenance instance is only valid if used in a bundle (message) - reply to new message"
Usage: #example
* target = Reference(b0d424f8-33a9-4cc2-a528-a6cc1c58727b)
* occurredDateTime = 2020-09-30T10:22:11Z
* recorded = 2020-09-30T10:22:11Z
* activity.coding = $activityCodes#reply-message
* agent.who = Reference(74cdf292-abf3-4f5f-80ea-60a48013ff6d)
* entity.role = #revision
* entity.what = Reference(42cb9200-f421-4d08-8391-7d51a2503cb4)


// CareCommunication reply to hospital notification example
 Instance: a09a5340-f326-4767-916b-d42a7004d909
InstanceOf: MedComMessagingProvenance
Title: "CareCommunication example. The Provenance instance is only valid if used in a bundle (message) - reply to a HospitalNotification message"
Description: "CareCommunication example. The Provenance instance is only valid if used in a bundle (message) - reply to a HospitalNotification message"
Usage: #example
* target = Reference(42cb9200-f421-4d08-8391-7d51a2503cb4)
* occurredDateTime = 2020-10-16T13:43:16Z
* recorded = 2020-10-16T13:43:16Z
* activity.coding = $activityCodes#reply-message
* agent.who = Reference(74cdf292-abf3-4f5f-80ea-60a48013ff6d)
* entity.role = #revision
* entity.what = Reference(51b27813-8aa8-4fa1-846b-aeabf5afb7d4) 


// CareCommunication reply to XDIS message
Instance: 6de0806d-7050-4db8-8003-0c72aee52948
InstanceOf: MedComMessagingProvenance
Title: "CareCommunication example. The Provenance instance is only valid if used in a bundle (message) - reply to OIOXML-message"
Description: "CareCommunication example. The Provenance instance is only valid if used in a bundle (message) - reply to OIOXML-message"
Usage: #example
* target = Reference(b0d424f8-33a9-4cc2-a528-a6cc1c58727b)
* occurredDateTime = 2020-09-30T10:22:11Z
* recorded = 2020-09-30T10:22:11Z
* activity.coding = $activityCodes#reply-message
* agent.who = Reference(74cdf292-abf3-4f5f-80ea-60a48013ff6d)
* entity.role = #revision
* entity.what.identifier.value = "5790000120420#BrevNr00133" */


/* // HospitalNotification Admit inpatient. 
Instance: d7cf3888-6f42-4e4d-929c-d2475d24fba0
InstanceOf: MedComMessagingProvenance
Title: "HospitalNotification example. The Provenance instance is only valid if used in a bundle (message) - admit inpatient"
Description: "HospitalNotification example. The Provenance instance is only valid if used in a bundle (message) -admit inpatient"
Usage: #example
* target = Reference(51b27813-8aa8-4fa1-846b-aeabf5afb7d4)
* occurredDateTime = 2020-10-15T13:44:14Z
* recorded = 2020-10-15T13:45:15Z
* activity.coding = $activityCodes#admit-inpatient
* agent.who = Reference(d7056980-a8b2-42aa-8a0e-c1fc85d1f40d)

// HospitalNotification - discharge inpatient
Instance: d710698c-83eb-4c3e-81c8-fe8e40baf524
InstanceOf: MedComMessagingProvenance
Title: "HospitalNotification example. The Provenance instance is only valid if used in a bundle (message) - discharge inpatient"
Description: "HospitalNotification example. The Provenance instance is only valid if used in a bundle (message) - discharge inpatient"
Usage: #example
* target = Reference(e47254da-f170-46f0-b624-4778a9c92b1f)
* occurredDateTime = 2020-10-28T09:21:26Z
* recorded = 2020-10-28T09:21:26Z
* activity.coding = $activityCodes#discharge-inpatient-home
* agent.who = Reference(d7056980-a8b2-42aa-8a0e-c1fc85d1f40d)
* entity.role = #revision
* entity.what = Reference(51b27813-8aa8-4fa1-846b-aeabf5afb7d4)

// HospitalNotification Cancel admission. 
Instance: d0c17662-8e39-11ec-b909-0242ac120002
InstanceOf: MedComMessagingProvenance
Title: "HospitalNotification example. The Provenance instance is only valid if used in a bundle (message) - admit inpatient"
Description: "HospitalNotification example. The Provenance instance is only valid if used in a bundle (message) -admit inpatient"
Usage: #example
* target = Reference(51b27813-8aa8-4fa1-846b-aeabf5afb7d4)
* occurredDateTime = 2020-10-15T13:44:14Z
* recorded = 2020-10-15T13:45:15Z
* activity.coding = $activityCodes#cancel-admit-inpatient
* agent.who = Reference(d7056980-a8b2-42aa-8a0e-c1fc85d1f40d)
* entity.role = #removal
* entity.what = Reference(51b27813-8aa8-4fa1-846b-aeabf5afb7d4)

// Acknowledgement example
Instance: 21ec3323-3e3b-43d9-8a53-e1155ef29f99
InstanceOf: MedComMessagingProvenance
Title: "Acknowledgement example. The Provenance instance is only valid if used in a bundle (message) - reply"
Description: "Acknowledgement example. The Provenance instance is only valid if used in a bundle (message) - reply"
Usage: #example
* target = Reference(6b027613-c442-406d-bc53-3d913f73e0a8)
* occurredDateTime = 2021-09-21T07:15:43Z
* recorded = 2021-09-21T07:15:43Z
* activity.coding = $activityCodes#reply-message
* agent.who = Reference(d7056980-a8b2-42aa-8a0e-c1fc85d1f40d)
* entity.role = #revision
* entity.what = Reference(51b27813-8aa8-4fa1-846b-aeabf5afb7d4) */



