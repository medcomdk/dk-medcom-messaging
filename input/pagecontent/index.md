### Introduction

This Implementation Guide (IG) is provided by MedCom to describe the use of FHIR &reg;&copy; in message based exchange of data in Danish healthcare.

The IG contains profiles, which defines a general messaging model for MedCom messages, like HospitalNotification, CareCommunication and Acknowledgement. 

__Note:__ Be aware that entries in a message in general are unordered. Recipients of a message can therefore not assume any sequences of elements.

#### General Messaging Model

The figure below illustrates a general messaging model, which all MedCom messages will comply to. The general messaging profiles are all prefixed "MedComMessaging". Besides the profiles on the figure, a MedCom message will also include some MedComCore profiles and profiles made to support a specific use case. All together the constitutes the actual content of the messages. The following sections describe the overall purpose of each messaging profile.

<img alt="Shows the general MedCom messaging model. Each message must at least contain the following resources: Bundle, MessageHeader, Organization and Provenance." src="./MessagingModel.png" style="float:none; display:block; margin-left:auto; margin-right:auto;" />

##### MedComMessagingMessage

A Bundle resource defined to be of the type 'message'. All profiles included in a message shall be referenced from the entry element in the MedComMessagingMessage profile, with a MessageHeader as the first resource. 

##### MedComMessagingMessageHeader

The MessageHeader defines the sender and receiver organization of the message. In some messages it is optional to include a one or more carbon-copy receiver organization(s). From the focus element is the actual content of the message referenced, like a Communication or Encounter resource. 

##### MedComMessagingOrganization

This profile inherits from MedComCoreOrganization and is used to describe a sender and receiver organization. The resource constrains the MedComCoreOrganization profile to contain both a SOR identifier and an EAN identifier (also known as GLN) for addressing purposes.

##### MedComMessagingProvenance

The Provenance resource describes the activity of the message and who has triggered the message. Further is it used to describes the history of message activities e.g., if the message is related to a previously exchanged message. 

#### Dependencies
This IG has a dependency to the [MedComCore IG](https://build.fhir.org/ig/hl7dk/dk-medcom-core/) and [DK-core](https://hl7.dk/fhir/core/) v. 1.1.0, defined by [HL7 Denmark](https://hl7.dk/). This is currently reflected in MedComMessagingOrganization which MedComCoreOrganization. 

### Scope

This document presents MedCom Messaging concepts defined via FHIR processable artefacts:

* [Profiles](profiles.html) - contain the constraints to core FHIR resources and datatype for use in MedCom messages
* [Extensions](extensions.html) - are FHIR extensions that are added for local use, covering needed concepts for the messaging
* [Terminologies](terminology.html) - are defined or referenced code systems and value sets for the messaging context

### Governance

FHIR profiles are managed under MedCom:

* [Source](https://github.com/hl7dk/dk-medcom)
* [Wiki](https://github.com/hl7dk/dk-medcom)

### Other

#### Quality Assurance Report

In the Quality Assurance report (QA-report) for this IG, there are a few errors which MedCom are aware of, described with the message: _Reference is remote which isn’t supported by the specified aggregation mode(s) for the reference (bundled)_. The error is due to some references in the profiles with a 'Bundled' flag indicated by {b}. However, the referenced profile is not included in a Bundle in one or more of the example, as not all examples includes the Bundle profile. This should not influence the implementation by vendors.

### Contact

[MedCom](https://www.medcom.dk/) is responsible for this site.<br> 
If you have any questions regarding the IG, please contact <fhir@medcom.dk> or write to MedCom's stream on [Zulip](https://chat.fhir.org/#narrow/stream/315677-denmark.2Fmedcom.2FFHIRimplementationErfaGroup).
