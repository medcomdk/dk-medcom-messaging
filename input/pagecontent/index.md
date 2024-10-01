### Introduction

This Implementation Guide (IG) is provided by MedCom to describe the use of FHIR &reg;&copy; in message based exchange of data in Danish healthcare.

The IG contains profiles which are used to define a general messaging model for MedCom messages, like [HospitalNotification](http://medcomfhir.dk/ig/hospitalnotification/), [CareCommunication](http://medcomfhir.dk/ig/carecommunication/) and [Acknowledgement](http://medcomfhir.dk/ig/acknowledgement/). 

#### General Messaging Model

The figure below illustrates a general messaging model, which all MedCom messages will comply to. Messaging profiles are all prefixed "MedComMessaging". Beside the profiles on the figure, a MedCom message will also include some MedComCore profiles and profiles made to support a specific use case. All together they constitute the actual content of a MedCom message. The following sections describe the overall purpose of each messaging profile.

<img alt="Shows the general MedCom messaging model. Each message must at least contain the following resources: Bundle, MessageHeader, Organization and Provenance." src="./MessagingModel.png" style="float:none; display:block; margin-left:auto; margin-right:auto;" />

##### MedComMessagingMessage

A Bundle resource defined to be of the type 'message'. All profiles included in a message shall be referenced from the entry element in the MedComMessagingMessage profile, with a MessageHeader as the first resource. 

__Note:__ Be aware that entries in a message in general are unordered. Recipients of a message cannot assume any sequences of profiles.

##### MedComMessagingMessageHeader

The MessageHeader defines the sender and receiver organization of a message. In some messages it is optional to include a one or more carbon-copy receiver organization(s). From the focus element is the actual content of the message often referenced, like a Communication or Encounter resource. 

##### MedComMessagingOrganization

This profile inherits from MedComCoreOrganization and is used to describe a sender and receiver organization. The resource constrains the MedComCoreOrganization profile to contain both a SOR identifier and an EAN identifier (also known as GLN) for addressing purposes.

##### MedComMessagingProvenance

The Provenance resource describes the activity of the message and who has triggered the message. Further is it used to describes the history of message activities e.g., if the message is related to a previously exchanged message. 

#### Terminology
On [MedCom Terminology IG](http://medcomfhir.dk/ig/terminology/) all referenced CodeSystem and ValueSets developed by MedCom can be found.

#### Dependencies
This IG has a dependency to the [MedComCore IG](http://medcomfhir.dk/ig/core/) and [DK-core](https://hl7.dk/fhir/core/) v. 2.0.0, defined by [HL7 Denmark](https://hl7.dk/). This is currently reflected in MedComMessagingOrganization which inherits from MedComCoreOrganization. 

### Documentation

[More information about MedCom Messaging](https://medcomdk.github.io/dk-medcom-messaging/) can be found here. MedComMessaging profiles does not alone constitute a standard, why the documentation is limited.

### Governance

FHIR profiles are managed under MedCom: [Source code](https://github.com/medcomdk/dk-medcom-messaging). 

A description of [governance concerning change management and versioning](https://medcomdk.github.io/MedComLandingPage/#4-change-managment-and-versioning) of MedComs FHIR artefacts, can be found on the link.

#### Quality Assurance Report

In the Quality Assurance report (QA-report) for this IG, there is an error with the following description: *Reference is remote which isn’t supported by the specified aggregation mode(s) for the reference (bundled)*. The error occurs when creating instances of the profiles and is due to some elements having a Bundled flag {b}, however the referenced profile is not included in a Bundle in an instance, since the instance only represents a part of the entire message. This should not influence the implementation by IT-vendors.

### Contact

[MedCom](https://www.medcom.dk/) is responsible for this IG.

If you have any questions, please contact <fhir@medcom.dk> or write to MedCom's stream in [Zulip](https://chat.fhir.org/#narrow/stream/315677-denmark.2Fmedcom.2FFHIRimplementationErfaGroup).
