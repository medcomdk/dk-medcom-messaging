### Scope and usage 

This profile describes the Bundle resource that shall be used in all MedCom FHIR Messages. MedComMessagingMessage is the root in all messages, as shown on the figure below. As this profile is the used in a message, shall the element type in MedComMessagingMessage always be *message*. This entails that the first resource in the entry element shall be a MedComMessagingMessageHeader. 

For each messaging standard e.g., HospitalNotification or CareCommunication is a different set of profiles defined, but common to them both is that all included profiles shall be referenced from the entry element. Due to the different requirements for each standard, it should be expected that the MedComMessagingMessage is inherited in each standard. 

<img alt="Shows the general MedCom messaging model. Each message must contain the following resources: Bundle, MessageHeader, Organization and Provenance." src="./MessagingModel.png" style="float:none; display:block; margin-left:auto; margin-right:auto;" />

Please refer to the tab "Snapshot Table(Must support)" below for the definition of the required content of a MedComMessagingMessage.
