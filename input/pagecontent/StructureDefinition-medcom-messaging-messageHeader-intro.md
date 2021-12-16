### Scope and usage 

This profile describes the MedComMessagingMessageHeader resource that shall be used in all MedCom FHIR Messages. A MedComMessagingMessageHeader shall include a sender and receiver and it may also include a carbon-copy (CC) depended on type of standard. Furthermore shall each MedComMessagingMessageHeader include a globally unique id, which is used to describe the messagehistory from the MedComMessagingProvenance profile. 

__Note:__ This profile acts as a core-profile as each standard inherits the MedComMessagingMessageHeader. E.g. is a MedComHospitalNotificationMessageHeader used in the HospitalNotification standard. 

<img alt="Shows the MedComMessageHeader, which references the MedComMessagingOrganization as a sender, reciever and carbon-copy." src="./MedComMessageHeader.png" style="float:none; display:block; margin-left:auto; margin-right:auto;" />

Please refer to the tab "Snapshot Table(Must support)" below for the definition of the required content of a MedComMessagingMessageHeader.
