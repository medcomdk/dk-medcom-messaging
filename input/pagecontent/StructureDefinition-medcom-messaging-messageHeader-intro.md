### Scope and usage 

This profile describes the MessageHeader resource that shall be used in all MedCom FHIR Messages. A MedComMessagingMessageHeader shall include a sender and receiver and it may include a carbon-copy, however this is depended on type of standard. Each MedComMessagingMessageHeader shall include a globally unique id, which is used to describe the message history from the MedComMessagingProvenance profile. 

This profile acts as a core-profile since each standard inherits from the MedComMessagingMessageHeader e.g., is a MedComHospitalNotificationMessageHeader used in the HospitalNotification standard. In the element event it shall be defined which type of standard the message concerns.

<img alt="Shows the MedComMessageHeader, which references the MedComMessagingOrganization as a sender, reciever and carbon-copy." src="./MedComMessageHeader.png" style="float:none; display:block; margin-left:auto; margin-right:auto;" />

Please refer to the tab "Snapshot Table(Must support)" below for the definition of the required content of a MedComMessagingMessageHeader.
