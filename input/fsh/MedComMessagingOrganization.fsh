Profile: MedComMessagingOrganization
Parent: MedComCoreOrganization
Id: medcom-messaging-organization
Description: "A formally recognized organizations registered for exchanging messages within Danish healthcare, registered with a SOR identifier issued by The Danish Health Data Authority"
* . ^short = "A formally recognized organizations within Danish healthcare"
* text MS
* text ^short = "The narrative text SHALL always be included when exchanging a MedCom FHIR Bundle. For governance of MedCom narratives, see https://medcomdk.github.io/MedCom-FHIR-Communication/assets/documents/050_Governance-for-MedCom-FHIR-Messages.html#6-narrative-texts."
* text.status MS
* text.div MS
* identifier 2.. MS
* identifier[EAN-ID] 1.. 
* identifier[EAN-ID] MS SU

// Reciever instance
 Instance: 74cdf292-abf3-4f5f-80ea-60a48013ff6d
InstanceOf: MedComMessagingOrganization
Title: "Example of a reciever organization with a SOR and an EAN identifier."
Description: "Example of an organization with a SOR and an EAN identifier."
Usage: #example
* identifier[SOR-ID].value = "543210987654321"
* identifier[EAN-ID].value = "5790000121526"
* name = "Receiver Organization" 

// Sender instance
Instance: d7056980-a8b2-42aa-8a0e-c1fc85d1f40d
InstanceOf: MedComMessagingOrganization
Title: "Example of a sender organization with a SOR and an EAN identifier."
Description: "Example of an organization with a SOR and an EAN identifier."
Usage: #example
* identifier[SOR-ID].value = "123456789012345"
* identifier[EAN-ID].value = "5790001382445"
* name = "Sender Organization"

// Service provider instance
Instance: bf839e87-4e44-4977-b38e-92b5a6f187b5
InstanceOf: MedComMessagingOrganization
Title: "Example of a service provider organization with a SOR and an EAN identifier."
Description: "Example of an organization with a SOR and an EAN identifier."
Usage: #example
* identifier[SOR-ID].value = "325421000016001"
* identifier[EAN-ID].value = "5798002472264"