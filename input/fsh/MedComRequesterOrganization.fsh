Profile: MedComRequesterOrganization
Parent: MedComMessagingOrganization
Id: medcom-requesterorganization
Title: "MedComMessagingRequesterOrganization"
Description: "This profile is intended to be used to represent the requester organization of the observations."
* identifier 3.. MS
* identifier[Ydernummer] 1.. 
* identifier[Ydernummer] MS 
* contact 1..1 MS
* contact.name 0..1 MS
* contact.name.given 1..1 MS
* contact.name.given ^short = "Initials of the practitioner that request the observation."
// * extension contains MedComMessagingRequesterInit named RequesterInitials 0..1
* contact.extension contains data-absent-reason named InitialsNotKnown 0..1
* contact obeys medcom-homecareObservation-4

Invariant: medcom-homecareObservation-4
Description: "There shall either be a RequesterInitials or a InitialsNotKnown."
Expression: "name.exists() or extension('http://hl7.org/fhir/StructureDefinition/data-absent-reason').exists()"
Severity: #error


// Reciever instance - new message
Instance: 42541447-b58c-4a1a-9514-02b80494bbd3
InstanceOf: MedComRequesterOrganization 
Title: "Example of a reciever organization with a SOR, an EAN  and Ydrenummer identifier."
Description: "Example of an organization with a SOR and an EAN and Ydrenummer identifier."
* identifier[SOR-ID].value = "52581000016005" 
* identifier[EAN-ID].value = "5790000127092"
* identifier[Ydernummer].value = "061654"
* contact.name.given = "OKM"
* name = "Skødstrup Lægepraksis"

// Extension: MedComMessagingRequesterInit
// Id: MedComMessagingRequesterInit
// Title: "MedComMessagingRequesterInit"
// Description: "Initials of the practitioner that request observations"
// * valueHumanName 0..1 MS
// * valueHumanName.given 1..1 MS
// * valueHumanName.given ^short = "Initials of the practitioner that request the observation."
