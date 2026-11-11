## Scope and usage 

This profile is used as the Provenance resource for MedCom FHIR messages. The Provenance resource tracks information about the activity what was created, revised, or deleted, while referencing the current message and previous messages if such exist. This is why the Provenance resource is valuable in MedCom messaging.

MedComMessagingProvenance describes the activity and history of a message. The element `Provenance.agent.who` contains information about the organisation that was involved in the activity. The element `Provenance.target` references the MessageHeader in the current message, this is used to distinguish between current and previous messages. The element `Provenance.entity.what` references the event that initiated a message e.g., a previous message.

The figure below illustrates the references from the Provenance resource.

<img alt="MedComMessagingProvenance handles information about the involved organization in the element *who*, references the MessageHeader related to current message in the element *target*, and references to the event that initiated a message in the element *what*." src="./MedComMessagingProvenance.png" style="float:none; display:block; margin-left:auto; margin-right:auto;" />
 
## Activity

In MedCom messaging, the `Provenance.target` shall always be a reference to a [MedComMessagingMessageHeader](StructureDefinition-medcom-messaging-messageHeader.html) or a profile which inherits from / has a base resource of `MedComMessagingMessageHeader`. 
The target references the resources on which the new activity has occurred. For instance if `Provenance.activity` is `reply-message`, it references a MessageHeader in the Bundle which will point to the contents of the reply. While other Provenances in the bundle, might point to earlier activities, such as the first activtiy `new-message` which will point to another messageheader that describes the contents of the first message.

The activitycodes used to describe the activity of the MedCom message may differ between standard e.g. [HospitalNotification](http://medcomfhir.dk/ig/hospitalnotification/) and [CareCommunication](http://medcomfhir.dk/ig/carecommunication/). Due to the different requirements of activities in a standard, it should be expected that there will be different invariants pointing at specific ValueSets for the given standard.

Provenance.agent describes the actor who is responsible for the activity that took place, by referencing the organisation responsible for the activity. The referenced organisation shall be an [MedComMessagingOrganization](StructureDefinition-medcom-messaging-organization.html).

#### History
{: #history}

| ID | Requirement |
|:---|:---|
| <a id="PROV-02" href="#PROV-02">PROV-02</a> | A MedCom FHIR Message **SHALL** contain one bundled MedComMessagingProvenance resource for each message exchange the message has been involved in. |
| <a id="PROV-03" href="#PROV-03">PROV-03</a> | An Acknowledgement message **SHALL** contain no more than two bundled MedComMessagingProvenance resources. |
{: .medcom-governance-rules}

These history and count requirements are not enforced by this Provenance profile. The Bundle's `medcom-messaging-2` constraint already enforces the presence of at least one Provenance resource.

MedComMessagingProvenance handles the message history in the Provenance.entity element. This element shall be included if the message is a response to a previous message. In this case the element Provenance.entity.role is used to describe how the entity is used in the message. Provenance.entity.role shall be: 
* *revision* when a message is a response, a correction, or a forwarding.
* *removal* when the message is a cancellation of a previously send message.

When a message is a response to a previous message, the previous message shall be referenced from the element Provenance.entity.what. The reference depends on the type of the previous message, which can be a MedCom FHIR message or a EDIFACT/OIOXML message. In the latter case, the reference shall be [lokationsnummer]#[brevid].

#### Timestamps
{: #provenance-timestamps}

In MedComMessagingProvenance there are two timestamps, that represents the date and time the message was sent but in two different ways. Provenance.occurredDateTime is a human readable date and time and Provenance.recorded is a machine readable date and time. 

