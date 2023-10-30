Profile: MedComMessagingRequesterOrganization
Parent: MedComMessagingOrganization
Id: medcom-messaging-requesterorganization
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



// Extension: MedComMessagingRequesterInit
// Id: MedComMessagingRequesterInit
// Title: "MedComMessagingRequesterInit"
// Description: "Initials of the practitioner that request observations"
// * valueHumanName 0..1 MS
// * valueHumanName.given 1..1 MS
// * valueHumanName.given ^short = "Initials of the practitioner that request the observation."
