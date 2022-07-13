### Scope and usage 
This profile is used as the Provenance resource for all MedCom FHIR messages. MedComMessagingProvenance describes the activity and history of a message. The element who handles information about the involved organization, the element target references the MessageHeader in the current message, and the element what references the event that initiated a message e.g., a previous message. The figure below illustrates the references from the Provenance resource.

<img alt="MedComMessagingProvenance handles information about the involved organization in the element *who*, references the MessageHeader related to current message in the element *target*, and references to the event that initiated a message in the element *what*." src="./MedComMessagingProvenance.png" style="float:none; display:block; margin-left:auto; margin-right:auto;" />

The codes used to describe the activity of the MedComMessagingProvenance may differ between standard e.g., HospitalNotification and CareCommunication. Due to the different requirements of activities in a standard, it should be expected that there will be different invariants pointing at specific ValueSets for each standard. 

Please refer to the tab "Snapshot Table(Must support)" below for the definition of the required content of a MedComMessagingProvenance.

#### Previuos entities
MedComMessagingProvenance handles the message history in the entity element. This element shall be included if the message is a response to a previous message. In this case is the element entity.role used to describe how the entity is used in the message. The element entity.role and shall be: 
* *revision* when a message is a response, a correction, or a forwarding.
* *removal* when the message is a cancellation of a previously send message.

When the message is a response to a previous message, the previous message shall be referenced from the element entity.what. The reference depends on the type of the previous message, which can be a MedCom FHIR message or a EDIFACT/OIOXML message. 