### Scope and usage 

This profile describes the MessageHeader resource that shall be used in all MedCom FHIR Messages. A MedComMessagingMessageHeader shall include a sender and receiver and it may include a carbon-copy receiver, however this is depended on type of standard. Each MedComMessagingMessageHeader shall include a globally unique id, which is used to describe the message history from the [MedComMessagingProvenance](http://medcomfhir.dk/ig/messaging/StructureDefinition-medcom-messaging-provenance.html) profile. 

The element event shall be defined in accordance with the type of standard the message concerns e.g., HospitalNotification and CareCommunication. Due to the different requirements for each standard, it should be expected that the MedComMessagingMessageHeader is inherited in each standard. 

<img alt="Shows the MedComMessageHeader, which references the MedComMessagingOrganization as a sender, reciever and carbon-copy." src="./MedComMessageHeader.png" style="float:none; display:block; margin-left:auto; margin-right:auto;" />

Please refer to the tab "Snapshot Table(Must support)" below for the definition of the required content of a MedComMessagingMessageHeader.
