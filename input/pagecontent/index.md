### Introduction

This Implementation Guide (IG) is provided by MedCom to describe the use of FHIR &reg;&copy; in message based exchange of data in Danish healthcare.

The IG contains profiles, which defines a general messaging model for MedCom messages, like HospitalNotification, CareCommunication and Acknowledgement. 

The profiles are in general made open and allow further profiling for specific purposes defined by the communicating parties.

__Note:__ Be aware that entries in a message in general are unordered. Recipients of a message can therefore not assume any particular sequences of elements.

### General Messaging Model

The general messaging model contains the basic messaging template, which all messages (including Acknowledgement messages) will comply to. The following diagram depicts the structure of a message.

<img alt="Shows the general MedCom messaging model. Each message must at least contain the following resources: Bundle, MessageHeader, Organization and Provenance." src="./MessagingModel.png" style="float:none; display:block; margin-left:auto; margin-right:auto;" />

These profiles are prefixed "MedComMessaging". The general messaging model also include some core resources that are useful in profiling of the actual messages. The following sections describe the overall purpose of each messaging profile.

#### MedComMessagingMessage

The root of the message, which constrains the Bundle resource to be a message type with a MessageHeader. All profiles included in a message shall be included in referenced from the entry element in the MedComMessagingMessage profile. 

#### MedComMessagingMessageHeader

The MessageHeader shall at least include a sender and a primary receiver organization. In some messages it is optional to include a list of carbon-copy receiver organizations. 

#### MedComMessagingOrganization

This profile inherits from MedComCoreOrganization and is used to describe a sender and organization in all messages. The resource constrains the MedComCoreOrganization profile to contain both a SOR identifier and an EAN identifier (also known as GLN) for addressing purposes.


#### MedComMessagingProvenance

The Provenance resource describes the activity and who has triggered the message. Further is it used to describes the history of message activities e.g., if the message is releated to a previously exchanged message. 


### Content

This document presents MedCom Messaging concepts defined via FHIR processable artefacts:

* [Profiles](profiles.html) - contain the constraints to core FHIR resources and datatype for use in MedCom messages
* [Extensions](extensions.html) - are FHIR extensions that are added for local use, covering needed concepts for the messaging
* [Terminologies](terminology.html) - are defined or referenced code systems and value sets for the messaging context

### Governance

FHIR profiles are managed under MedCom:

* [Source](https://github.com/hl7dk/dk-medcom)
* [Wiki](https://github.com/hl7dk/dk-medcom)
