# Introduction
This Implementation Guide (IG) is provided by MedCom to describe the use of FHIR &reg;&copy; in message based exchange of data in Danish healthcare.

# Scope of the messaging framework
{: #scope-of-the-messaging-framework}

MedCom has profiled the <a href="http://hl7.org/fhir/R4/messaging.html" target="_blank">HL7 FHIR Messaging Framework</a> to work in a Danish context.
Governance for MedCom HL7 FHIR Messaging describes the basic ruleset of how MedCom Messages must be exchanged in the Danish Healthcare Messaging Network.
The Danish ruleset is based on:

* the ruleset for the Danish VANS Network
* the general <a href="http://hl7.org/fhir/R4/messaging.html" target="_blank">HL7 FHIR Communication Rules for FHIR Messaging</a>
* the Danish profiling of FHIR messaging.

These MedCom FHIR Messaging Governance rules are intended to clarify the use of MedCom’s FHIR messages for the health and social area. Formerly, these kinds of rules for other MedCom Messaging paradigms were known as ”Syntax & Communication Rules”.

It is the intention that the MedCom FHIR Messaging Governance rules together with MedCom’s FHIR standards for the individual messages form the full and sufficient basis for implementing MedCom’s healthcare messages.

## General Messaging Model

The figure below illustrates a general messaging model, which all MedCom messages will comply to. Messaging profiles are all prefixed "MedComMessaging". Beside the profiles on the figure, a MedCom message will also include some MedComCore profiles and profiles made to support a specific use case. All together they constitute the actual content of a MedCom message. The following sections describe the overall purpose of each messaging profile.

<img alt="Shows the general MedCom messaging model. Each message must at least contain the following resources: Bundle, MessageHeader, Organization and Provenance." src="./MessagingModel.png" style="float:none; display:block; margin-left:auto; margin-right:auto;" />

### MedComMessagingMessage

A Bundle resource defined to be of the type 'message'. All profiles included in a message shall be referenced from the entry element in the MedComMessagingMessage profile, with a MessageHeader as the first resource.

__Note:__ Be aware that entries in a message in general are unordered. Recipients of a message cannot assume any sequences of profiles.

### MedComMessagingMessageHeader

The MessageHeader defines the sender and receiver organization of a message. In some messages it is optional to include a one or more carbon-copy receiver organization(s). From the focus element is the actual content of the message often referenced, like a Communication or Encounter resource.

### MedComMessagingOrganization

This profile inherits from MedComCoreOrganization and is used to describe a sender and receiver organization. The resource constrains the MedComCoreOrganization profile to contain both a SOR identifier and an EAN identifier (also known as GLN) for addressing purposes.

### MedComMessagingProvenance

The Provenance resource describes the activity of the message and who has triggered the message. Further is it used to describes the history of message activities e.g., if the message is related to a previously exchanged message.

# Terms and abbreviations
{: #terms-used-in-governance-for-medcom-fhir-messaging}

This table presents the most commonly used terms and abbreviations used to describe the Governance for MedCom FHIR messaging. In the table below, each term or abbreviation has an associated description that eloborates the meaning of the term. For some terms is a link provided, which includes more information about the term.

| Terms |Description|Link|
|:------|:-----|:-----|
| EAN       | Location Number issued by the GS1 organization through its partners all over the world - in Denmark SDS ( also known as GLN, Location number). Location numbers and related electronic message types are used for electronic message-based communication between the health service parties | <a href="https://www.medcom.dk/opslag/support/sundhedsvaesenets-organisationsregister-sor">Only Danish</a>- further links on that page|
| SDS       | Sundhedsdatastyrelsen (The Danish Health Data Authority) |<a href ="https://sundhedsdatastyrelsen.dk/da/" target="_blank">Danish</a> & <a href ="https://sundhedsdatastyrelsen.dk/da/english" target="_blank">English</a>|
| SOR       | Sundhedsvæsenets Organisations Register (Healthcare Organization Register in Denmark ) | <a href="https://sundhedsdatastyrelsen.dk/da/rammer-og-retningslinjer/organisationsregistrering" target="blank">Only Danish</a>|
| VANS      | VANS is an abbreviation of Value Added Network Services, in Denmark an Asynchronous Network run by 3 private suppliers |<a href ="https://www.kmd.dk/" target="_blank">KMD</a>, <a href ="https://www.multimed.dk/kommunikation/" target="_blank">MiltiMed A/S</a>, <a href ="https://www.truecommerce.com/dk-da/" target="_blank">TrueCommerce</a>|
| Dispatch  | Dispatch of a message means the process in the Sending System, where a message is send|N/A|
| Shipment  | Shipment of a message means the whole process from dispatchment in the Sending System to reception in the Receiving System|N/A|
| Sending System | The system that dispatches a message |N/A|
| Receiving System | The system that receives a shipped message |N/A|
| MSH | Abbreviation for Message Service Handler. The part of a system that dispatches a message or receives a message |N/A|
| FHIR MSH | FHIR Message Service Handler. The part of a system that dispatches a FHIR message or receives a FHIR message |N/A|
| VANSEnvelope MSH | VANSEnvelope Message Service Handler. The part of a system that dispatches a VANSEnvelope message or receives a VANSEnvelope message |N/A|
| Sending Ecosystem | The collection of Sending System, Sending FHIR MSH and Sending VANSEnvelope MSH, that dispatches a message |N/A|
| Receiving Ecosystem | The collection of Receiving System, Receiving FHIR MSH and Receiving VANSEnvelope MSH, that receives a message |N/A|