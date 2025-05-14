### Scope and usage 

This profile is used as the Provenance resource for MedCom FHIR messages. The Provenance resource tracks information about the activity what was created, revised, or deleted, while referencing the current message and previous messages if such exist. This is why the Provenance resource is valuable in MedCom messaging.

MedComMessagingProvenance describes the activity and history of a message. The element Provenance.agent.who contains information about the organisation that was involved in the activity, the element Provenance.target references the MessageHeader in the current message, and the element Provenance.what references the event that initiated a message e.g., a previous message. 

The figure below illustrates the references from the Provenance resource.

<img alt="MedComMessagingProvenance handles information about the involved organization in the element *who*, references the MessageHeader related to current message in the element *target*, and references to the event that initiated a message in the element *what*." src="./MedComMessagingProvenance.png" style="float:none; display:block; margin-left:auto; margin-right:auto;" />
 

Please refer to the tab "Snapshot Table(Must support)" below for the definition of the required content of a MedComMessagingProvenance.

#### Activity

In MedCom messaging, the Provenance.target shall always be a reference to a [MedComMessagingMessageHeader](StructureDefinition-medcom-messaging-messageHeader.html) or an inherited of MedComMessagingMessageHeader. 
The target references the resources on which the activity has occurred. For instances if Provenance.activity is 'new-message', it describes that the message referenced from the Messageheader is a new message. 

The activitycodes used to describe the activity of the MedCom message may differ between standard e.g. [HospitalNotification](http://medcomfhir.dk/ig/hospitalnotification/) and [CareCommunication](http://medcomfhir.dk/ig/carecommunication/). Due to the different requirements of activities in a standard, it should be expected that there will be different invariants pointing at specific ValueSets for the given standard.

Provenance.agent describes the actor who is responsible for the activity that took place, by referencing the organisation responsible for the activity. The referenced organisation shall be an [MedComMessagingOrganization](StructureDefinition-medcom-messaging-organization.html).

#### History

MedComMessagingProvenance handles the message history in the Provenacne.entity element. This element shall be included if the message is a response to a previous message. In this case the element Provenance.entity.role is used to describe how the entity is used in the message. Provenance.entity.role shall be: 
* *revision* when a message is a response, a correction, or a forwarding.
* *removal* when the message is a cancellation of a previously send message.

When a message is a response to a previous message, the previous message shall be referenced from the element Provenance.entity.what. The reference depends on the type of the previous message, which can be a MedCom FHIR message or a EDIFACT/OIOXML message. In the latter case, the reference shall be [lokationsnummer]#[brevid].

#### Timestamps

In MedComMessagingProvenance there are two timestamps, that represents the date and time the message was sent but in two different ways. Provenance.occuredDateTime is a human readable date and time and Provenance.recorded is a machine readable date and time. 

