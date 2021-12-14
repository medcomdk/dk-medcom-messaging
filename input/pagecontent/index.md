### Implementation guide for MedCom FHIR Messaging

### Introduction

This implementation guide is provided by MedCom to describe the use of FHIR &reg;&copy; in message based exchange of data in Danish healthcare.

The implementation guide contains profiles in this area

* A general messaging model to be used by all defined MedCom FHIR messages

The profiles are in general made open for additional content to allow further profiling for specific purposes defined by the communicating parties.

__Note:__ Be aware that entries in a message in general are unordered. Recipients of a message can therefore not assume any particular sequences of elements.

__Note:__ We intend to split the implementation guide into three separate packages in a future version.

For description regarding the transportation layer please refer to this guide:

English:

* [MedCom FHIR-message and enclosing envelope](Enclosing_envelope_for_FHIR-messages.html)

Danish:

* [MedComs FHIR-meddelelser og forsendelseskuvert](Forsendelseskuvert_for_FHIR-meddelelser.html)

### General Messaging Model

The general messaging model containS the basic messaging template, which all messages (including acknowledgement messages) will comply with. The following diagram depicts the structure of a message.

<img alt="Messaging Model" src="./MessagingModel.png" style="float:none; display:block; margin-left:auto; margin-right:auto;" />

These profiles are prefixed "MedComMessaging". The general messaging model also include some core resources that are useful in profiling the actual messages. These are prefixed "MedComCore". The following sections describe the overall purpose of each profiled resource.

#### MedComMessagingMessage

The top level message bundle, which constrains the bundle resource to be a message type with a message header and a list of provenance resources to describe the message history.

#### MedComMessagingMessageHeader

The top level message header, which constrains the message header resource to have at least one sender and split the destination list into one primary destination organization and optionally a list of carbon-copy destination organizations. The message header uses a valueset of all message type allowed.

#### MedComMessagingOrganization


Organization resource used for sender and destination information in the messages. The resource contrains the organization resource to contain a SOR identifier as well as an EAN number for addressing purposes.


#### MedComMessagingProvenance

The provenance resource describes the activity an who has triggered the message. The provenance list describes the history of message activities if the message is releated to a previously exchanged message. Provenance information about previous activities refer to the previous message through its message header id.

#### MedComCorePatient

The core patient constrains the dk core patient resource, making the name and managing organization mandatory.

#### MedComCoreOrganization

The core organization resource contrains the organization resource to contain a SOR identifier.

#### MedComCoreEncounter

The core encounter resource constrains the encounter resource to enforce a MedCom core patient as subject and the optional service provider to be a core organization (with a SOR identifier). The core encounter also add the optional possibility to specify an lpr3 identifier.

#### MedComCoreLpr3Encounter

The core lpr3 encounter makes the lpr3 identifier mandatory.

### MedCom Acknowledgment Message

#### MedComAcknowledgmentMessage

A Message Acknowledgment is required in MedCom FHIR Messaging and follows the recommandations from HL7 FHIR ValueSet [response-code](http://hl7.org/fhir/R4/valueset-response-code.html "response-code").

#### MedComAcknowledgmentMessageHeader

Message Acknowledgment is handled through the response element in the MedComAcknowledgmentMessageHeader.

### General references

All referenced resources within the message are contained in the entry list.

#### Content

This document presents MedCom messaging concepts defined via FHIR processable artefacts:

* [Profiles](profiles.html) - contain the constraints to core FHIR resources and datatype for use in MedCom messages
* [Extensions](extensions.html) - are FHIR extensions that are added for local use, covering needed concepts for the messaging
* [Terminologies](terminology.html) - are defined or referenced code systems and value sets for the messaging context

#### Governance

FHIR profiles are managed under MedCom:

* [Source](https://github.com/hl7dk/dk-medcom)
* [Wiki](https://github.com/hl7dk/dk-medcom)
