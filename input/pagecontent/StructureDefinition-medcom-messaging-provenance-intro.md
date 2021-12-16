### Scope and usage 
This profile is used as the Provenance resource for all MedCom FHIR messages.

The MedComMessagingProvenance handles the message history. The profile handles information about the involved organization in the element *who*, references the MessageHeader related to current message in the element *target*, and references to the event that initiated a message in the element *what*.

<img alt="MedComMessagingProvenance" src="./MedComMessagingProvenance.png" style="float:none; display:block; margin-left:auto; margin-right:auto;" />

The element entity.role describes how an entity was used in the given activity and shall be: 
* *source* when the message is the initial message.
* *revision* when a message is a response, a correction, or a forwarding.
* *removal* when the message is a cancellation of a previously send message.

It is possible to reference a previous message in the element entity.what. Please notice, that the reference to the previuos message depends on the type of message, which can be a MedCom FHIR message or a EDIFACT/OIOXML message. 

Please refer to the tab "Snapshot Table(Must support)" below for the definition of the required content of a MedComMessagingProvenance.

