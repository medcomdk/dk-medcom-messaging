Profile: MedComMessagingMessageDefinition
Parent: MessageDefinition
Id: medcom-messaging-messagedefinition
Description: "An example profile of the MessageDefinition resource."
//* url from ehmi-medcom-message-definition-uri-valueset
* identifier 1..1 MS
//* identifier.system from ehmi-medcom-message-definition-uri-valueset
* identifier.system from $MessageDefinitionIdentifierSystemVS
* identifier.system 1..1 //MS SU
//* identifier.system = $MessageDefinitionIdentifierSystem#MedCom
* identifier.period.start 1..1 MS
* identifier.period.end 0..1 MS
* identifier.type from $MedComMessageDefinitionTypeVS
* identifier.type 1..1 MS
* identifier.type.coding.system = $MedComMessageDefinitionType
* identifier.use 1..1 MS
* identifier.value 1..1 MS
* version 1..1 MS
//* name 1..1 MS SU
* title 1..1 MS
* replaces.value 0..1 MS
* publisher 1..1 MS
* publisher = "MedCom, https://www.medcom.dk"
* contact 0.. MS
* contact ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = id
  * ^slicing.rules = #open //#closed eller #open 
* contact contains
    InteroperabilityConsultant 0..1 MS and
    SubjectMatterExpert 0..1 MS
// InteroperabilityConsultant
* contact[InteroperabilityConsultant].id 1..1 MS
* contact[InteroperabilityConsultant].id = "InteroperabilityConsultant"
* contact[InteroperabilityConsultant].name 1..1 MS
* contact[InteroperabilityConsultant].telecom.system 1..1 MS
* contact[InteroperabilityConsultant].telecom.system = #email (exactly)
* contact[InteroperabilityConsultant].telecom.use 1..1 MS
* contact[InteroperabilityConsultant].telecom.use = #work (exactly)
* contact[InteroperabilityConsultant].telecom.value 1..1 MS
// SubjectMatterExpert
* contact[SubjectMatterExpert].id 1..1 MS
* contact[SubjectMatterExpert].id = "SubjectMatterExpert"
* contact[SubjectMatterExpert].name 1..1 MS
* contact[SubjectMatterExpert].telecom.system 1..1 MS
* contact[SubjectMatterExpert].telecom.system = #email (exactly)
* contact[SubjectMatterExpert].telecom.use 1..1 MS
* contact[SubjectMatterExpert].telecom.use = #work (exactly)
* contact[SubjectMatterExpert].telecom.value 1..1 MS
//* description 1..1 MS SU
//* description only valueMarkdown 
//* description.valueMarkdown = "Natural language description of the message definition" 
//* useContext 1..1 MS SU
//* Message Context
//* useContext.code.system from http://terminology.hl7.org/CodeSystem/usage-context-type
* useContext.code.system = $UsageContextCodeSystem
* useContext.code from $UsageContextCodeSystemVS
* jurisdiction 1..1 MS
* jurisdiction = #DK
//* jurisdiction.coding.system = 
* category 1..1 MS
* category = #notification (exactly)
* responseRequired 1..1 MS 
