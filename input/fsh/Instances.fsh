// MedComCoreEncounter instance
/* 
Instance: 7790f964-88d3-4652-bbc8-81d2f3d035f8
InstanceOf: MedComHospitalNotificationEncounter
Title: "MedCom Hospital Notification Encounter in progress"
Description: "Example of MedCom Hospital Noticication inpatient Encounter in progress with 12ee0dde-a672-462f-820d-5efe832d73c9 as serviceProvider"
* identifier.value = "1234567890"
* status = $StatusCodes#in-progress
* class = $ActCodes#IMP 
* episodeOfCare[lpr3identifier].identifier.system = "https://www.esundhed.dk/Registre/Landspatientsregisteret"
* episodeOfCare[lpr3identifier].identifier.value = "87654321-1234-1234-1234-123456789012" 
* subject = Reference(733cef33-3626-422b-955d-d506aaa65fe1)
* period.start = 2020-10-15T13:44:14Z
* serviceProvider = Reference(bf839e87-4e44-4977-b38e-92b5a6f187b5) */

Instance: 733cef33-3626-422b-955d-d506aaa65fe1
InstanceOf: MedComCorePatient
Title: "Eric Flame"
Description: "Patient with a managing organization. Valid only if used in a bundle (message)."
* identifier[cpr].system = "urn:oid:1.2.208.176.1.2"
* identifier[cpr].value = "0102030405"
* name[official].use = #official
* name[official].given = "Eric"
* name[official].family = "Flame"
* telecom.system = #phone
* telecom.value = "12345678"
* telecom.use = #mobile
* address.line = "Flammesvinget 1"
* address.city = "Aarhus"
* address.postalCode = "8000 C"

Instance: 12ee0dde-a672-462f-820d-5efe832d73c9
InstanceOf: MedComCoreOrganization
Title: "Aros Burn Center"
Description: "A core organization with a SOR identifier."
* identifier[sorIdentifier].use = #official
* identifier[sorIdentifier].system = "urn:oid:1.2.208.176.1.1"
* identifier[sorIdentifier].value = "123456789012345"
* name = "Aros Burn Center"
/* 
//HospitalNoficcation Instance - Admit inpatient: 
Instance: 51b27813-8aa8-4fa1-846b-aeabf5afb7d4
InstanceOf: MedComHospitalNotificationMessageHeader
Title: "MessageHeader for a HospitalNotification admit inpatient message. Valid only if used in a bundle (message)."
Description: "MessageHeader for a HospitalNotification admit inpatient message. Valid only if used in a bundle (message)."
* destination.extension[use] = b4e7e16b-9658-4172-acd7-5e7193f2cc5f
* eventCoding.code = $MessageEvents#hospital-notification-message
* destination.endpoint = "http://medcomfhir.dk/unknown"
* destination.receiver = Reference(74cdf292-abf3-4f5f-80ea-60a48013ff6d)
* sender = Reference(d7056980-a8b2-42aa-8a0e-c1fc85d1f40d)
* source.endpoint = "http://medcomfhir.dk/unknown"
* focus = Reference(7790f964-88d3-4652-bbc8-81d2f3d035f8)
* extension[reportOfAdmissionFlag].valueBoolean = true

// HospitalNotification - Discharge patient instance
Instance: e47254da-f170-46f0-b624-4778a9c92b1f
InstanceOf: MedComHospitalNotificationMessageHeader
Title: "MessageHeader for a HospitalNotification discharge inpatient message. Valid only if used in a bundle (message)"
Description: "MessageHeader for a HospitalNotification discharge inpatient message. Valid only if used in a bundle (message)."
* destination.extension[use] = b4e7e16b-9658-4172-acd7-5e7193f2cc5f
* eventCoding.code = $MessageEvents#hospital-notification-message
* destination.endpoint = "http://medcomfhir.dk/unknown"
* destination.receiver = Reference(74cdf292-abf3-4f5f-80ea-60a48013ff6d)
* sender = Reference(d7056980-a8b2-42aa-8a0e-c1fc85d1f40d)
* source.endpoint = "http://medcomfhir.dk/unknown"
* focus = Reference(7790f964-88d3-4652-bbc8-81d2f3d035f8)
* extension[reportOfAdmissionFlag].valueBoolean = false */


/* //HospitalNotification - End admission inpatient. 
Instance: 8efc6d95-6161-4493-99c9-f359488dedb8
InstanceOf: MedComHospitalNotificationMessageHeader
Title: "Message header for a hospital notification discharge message when patient is deceased. Valid only if used in a bundle (message)"
Description: "Message header for a hospital notification discharge message when patient is deceased. Valid only if used in a bundle (message)."
* destination.extension[use] = b4e7e16b-9658-4172-acd7-5e7193f2cc5f
* eventCoding = $MessageEvents#hospital-notification-message
* destination.endpoint = "http://medcom.dk/unknown"
* destination.receiver = Reference(74cdf292-abf3-4f5f-80ea-60a48013ff6d)
* sender = Reference(d7056980-a8b2-42aa-8a0e-c1fc85d1f40d)
* source.endpoint = "http://medcom.dk/unknown"
* focus = Reference(8405ba2d-467a-4e92-9acc-9dc2a629760fWhenDeceased)
* extension[reportOfAdmissionFlag].valueBoolean = false */ 


// CareCommunication reply to hospital notification example
/* Instance: aac67161-d0de-4933-a78c-060beafb4814
InstanceOf: MedComCareCommunicationMessageHeader
Title: "Message header for care communication forward message. Valid only if used in a bundle (message)."
Description: "Message header for care communication forward message. Valid only if used in a bundle (message)."
Usage: #inline
* destination.extension[use] = b4e7e16b-9658-4172-acd7-5e7193f2cc5f
* eventCoding = $MessageEvents#care-communication-message
* destination.endpoint = "http://medcom.dk/unknown"
* destination.receiver = Reference(d7056980-a8b2-42aa-8a0e-c1fc85d1f40d)
* sender = Reference(74cdf292-abf3-4f5f-80ea-60a48013ff6d)
* source.endpoint = "http://medcom.dk/unknown"
* focus = Reference(0f8cde6a-d369-4d94-a2ce-c2cc45fd75fb) */

/* // CareCommunication reply example
Instance: b0d424f8-33a9-4cc2-a528-a6cc1c58727b
InstanceOf: MedComCareCommunicationMessageHeader
Title: "MessageHeader for CareCommunicationc message. Valid only if used in a bundle (message)."
Description: "MessageHeader for CareCommunicationc message. Valid only if used in a bundle (message)."
Usage: #inline
* destination.extension[use] = b4e7e16b-9658-4172-acd7-5e7193f2cc5f
* eventCoding.code = $MessageEvents#care-communication-message
* destination.endpoint = "http://medcom.dk/unknown"
* destination.receiver = Reference(d7056980-a8b2-42aa-8a0e-c1fc85d1f40d)
* sender = Reference(74cdf292-abf3-4f5f-80ea-60a48013ff6d)
* source.endpoint = "http://medcom.dk/unknown"
* focus = Reference(0f8cde6a-d369-4d94-a2ce-c2cc45fd75fb)


// CareCommunication example
Instance: 42cb9200-f421-4d08-8391-7d51a2503cb4
InstanceOf: MedComCareCommunicationMessageHeader
Title: "Message header for care communication message. Valid only if used in a bundle (message)."
Description: "Message header for care communication message. Valid only if used in a bundle (message)."
* eventCoding.code = $MessageEvents#care-communication-message
* destination[primary].extension[use] = b4e7e16b-9658-4172-acd7-5e7193f2cc5f
* destination[primary].endpoint = "http://medcomfhir.dk/unknown"
* destination[primary].receiver = Reference(74cdf292-abf3-4f5f-80ea-60a48013ff6d)
* sender = Reference(d7056980-a8b2-42aa-8a0e-c1fc85d1f40d)
* source.endpoint = "http://medcomfhir.dk/unknown"
* focus = Reference(0f8cde6a-d369-4d94-a2ce-c2cc45fd75fb)


// CareCommunication reply to hospital notification example
Instance: 0f8cde6a-d369-4d94-a2ce-c2cc45fd75fb
InstanceOf: MedComCareCommunication
Title: "Example of Care Communication Content"
Description: "Content of care communication message. Valid only if used in a bundle (message)."
Usage: #inline
* status = $EventStatus#unknown
* category = $CategoryCodes#carecoordination
* subject = Reference(733cef33-3626-422b-955d-d506aaa65fe1)
* sent = 2020-10-16T13:43:16Z
* payload[0].contentString = "The patient is easily confused. Speaking loudly and slow reduced this."
* payload[0].extension[date].valueDateTime = 2020-01-01
* payload[0].extension[author].valueReference = Reference(58c811a5-4082-44eb-9d66-ccbb112d4973)
 */

// Practitioners
Instance: 58c811a5-4082-44eb-9d66-ccbb112d4973
InstanceOf: MedComCorePractitioner
Title: "Simple practitioner with a name"
Description: "Simple practitioner with a name"
* name.given = "Michael"
* name.family = "Burns"

/* Instance: 6b027613-c442-406d-bc53-3d913f73e0a8
InstanceOf: MedComMessagingAcknowledgementHeader
Title: "Message header for a fatal-error message with provenance"
Description: "Message header for a fatal-error message with provenance"
* destination.extension[use] = b4e7e16b-9658-4172-acd7-5e7193f2cc5f
* eventCoding.code = $MessageEvents#empty-message
* destination.endpoint = "http://medcomfhir.dk/unknown"
* destination.receiver = Reference(74cdf292-abf3-4f5f-80ea-60a48013ff6d)
* sender = Reference(d7056980-a8b2-42aa-8a0e-c1fc85d1f40d)
* source.endpoint = "http://medcomfhir.dk/unknown"
* response.identifier = "15e5b880-c087-4055-b9ec-99108695f81d"
* response.code = $AcknowledgementCode#fatal-error
* response.details = Reference(d0055484-2a56-4da2-81b8-a9d5087d865c) */


Instance: d0055484-2a56-4da2-81b8-a9d5087d865c
InstanceOf: OperationOutcome
Title: "Example of an error operationOutcome with provenance"
Description: "Example of an error operationOutcome with provenance"
* issue.severity = $ServerityCode#error
* issue.code =  $CodeCode#structure
* issue.diagnostics = "Error parsing resource XML"
* issue.expression = "Bundle.meta"