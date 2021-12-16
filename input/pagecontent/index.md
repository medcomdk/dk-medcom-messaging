### Introduction

This Implementation Guide (IG) is provided by MedCom to describe the use of FHIR &reg;&copy; in message based exchange of data in Danish healthcare.

The IG contains profiles, which defines a general messaging model for MedCom messages, like:
* HospitalNotification message for informing other healthcare parties about hospitalization of a patient
* CareCommunication message for exchange of various information between health organizations about a patient

The profiles are in general made open for additional content to allow further profiling for specific purposes defined by the communicating parties.

__Note:__ Be aware that entries in a message in general are unordered. Recipients of a message can therefore not assume any particular sequences of elements.

### General Messaging Model

The general messaging model contains the basic messaging template, which all messages (including acknowledgement messages) will comply to. The following diagram depicts the structure of a message.

<img alt="Shows the general MedCom messaging model. Each message must contain the following resources: Bundle, MessageHeader, Organization and Provenance." src="./MessagingModel.png" style="float:none; display:block; margin-left:auto; margin-right:auto;" />

These profiles are prefixed "MedComMessaging". The general messaging model also include some core resources that are useful in profiling of the actual messages. The following sections describe the overall purpose of each messaging profile.

#### MedComMessagingMessage

The root of the bundle, which constrains the bundle resource to be a message type with a message header and a list of provenance resources to describe the message history.

#### MedComMessagingMessageHeader

The message header, which constrains the message header resource to have at least one sender and split the destination list into one primary destination organization and optionally a list of carbon-copy destination organizations. 

#### MedComMessagingOrganization


Organization resource used for sender and destination information in the messages. The resource constrains the organization resource to contain a SOR identifier as well as an EAN number for addressing purposes.


#### MedComMessagingProvenance

The provenance resource describes the activity and who has triggered the message. The provenance is used to describes the history of message activities e.g., if the message is releated to a previously exchanged message. Provenance information about previous activities refer to the previous message through its message header id.


#### Content

This document presents MedCom messaging concepts defined via FHIR processable artefacts:

* [Profiles](profiles.html) - contain the constraints to core FHIR resources and datatype for use in MedCom messages
* [Extensions](extensions.html) - are FHIR extensions that are added for local use, covering needed concepts for the messaging
* [Terminologies](terminology.html) - are defined or referenced code systems and value sets for the messaging context

#### Governance

FHIR profiles are managed under MedCom:

* [Source](https://github.com/hl7dk/dk-medcom)
* [Wiki](https://github.com/hl7dk/dk-medcom)
