Profile: MedComProducerOrganization
Parent: MedComMessagingOrganization
Id: medcom-producer-organization
Title: "MedComProducerOrganization"
Description: "This profile is intended to be used to represent the producer of the observations."
* identifier 3.. MS
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #open
* identifier contains
    ProducentID 1..1 
* identifier[ProducentID].system 1..1 MS
* identifier[ProducentID].system = $ProducenID  
* identifier[ProducentID].value 1..1 MS
* identifier[ProducentID] ^short = "Offical MedCom code describing the producer of the observation."


// Sender instance - new message
Instance: ef5cb9a6-835f-4d18-a34e-179c578b9a2a
InstanceOf: MedComProducerOrganization 
Title: "Example of a sender organization with a SOR, an EAN identifier, and ProdcentID"
Description: "Example of an organization with a SOR and an EAN identifier."
* identifier[SOR-ID].value = "1144561000016002" 
* identifier[EAN-ID].value = "5790000123117" 
* identifier[ProducentID].system = $ProducenID
* identifier[ProducentID].value = "KAF"
* name = "Pleje og Rehabilitering"