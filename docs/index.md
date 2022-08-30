<!-- <a href="https://medcomdk.github.io/MedComLandingPage/">Return</a> -->

# MedCom Messaging 
<hr/>

**Table of Content**
* [1 Documentation](#1-documentation)
  + [1.1 Technical Specifications](#11-technical-specifications)
<!-- * [2 Release Notes](#2-release-notes) -->
<hr/>

This page represents the messaging profiles (DK: Meddelelsesprofiler) used in MedComs FHIR®© standards.The MedCom Messaging Implementation Guide (IG) includes the following profiles:
* <a href="https://build.fhir.org/ig/medcomdk/dk-medcom-messaging/StructureDefinition-medcom-messaging-message.html">MedComMessagingMessage</a> 
* <a href="https://build.fhir.org/ig/medcomdk/dk-medcom-messaging/StructureDefinition-medcom-messaging-messageHeader.html">MedComMessagingMessageHeader</a> 
* <a href="https://build.fhir.org/ig/medcomdk/dk-medcom-messaging/StructureDefinition-medcom-messaging-organization.html"> MedComMessagingOrganization</a> 
* <a href="https://build.fhir.org/ig/medcomdk/dk-medcom-messaging/StructureDefinition-medcom-messaging-provenance.html">MedComMessagingProvenance </a> <br><br>

These profiles describe fundamental information when exchanging information as messages and therefore one or more profiles are included in all MedComs FHIR messages. The messaging profiles do not alone constitute a standard, but one or more profiles can be used in a standard. Therefore, does this page only include the Implementation Guide (IG) and not clinical guidelines, use cases, test protocols.

## 1 Documentation 
### 1.1 Technical Specifications
The technical specifications for MedCom Messaging profiles are defined in an IG. As mentioned previously does the MedCom Messaging profiles not alone compose a standard but are used to describe central information in MedComs messaging standards. <a href="https://build.fhir.org/ig/medcomdk/dk-medcom-messaging/" target="_blank">Here you can find the MedCom Messaging IG.</a> 

IGs might be difficult for people with little or no knowledge about FHIR and how to understand an IG. Therefor has MedCom developed a webpage describing the content of the messaging IG. The link below gives an overview of which profiles are included, what their purpose are, and which elements that shall be supported in a system
[Overview of the content of the messaging profiles.](assets/documents/Intro-Technical-Spec-ENG.md)

## 1.2 MedComMessagingMessage (Bundle)

MedComMessagingMessage is a Bundle resource of type "message", which is a container for a collection of other resources.

<br>

| Links for MedComMessingMessage|
|:---|
| <a href="https://build.fhir.org/ig/medcomdk/dk-medcom-messaging//StructureDefinition-medcom-messaging-message.html" target="_blank"> Detailed specification for MedComMessingMessage in MedComMessingMessage IG</a> |
| <a href="http://hl7.org/fhir/R4/Bundle.html" target="_blank">Detailed specification for Bundle in FHIR R4</a> |

<br>

## 1.2.1 Scope and Usage

One common operation performed with resources is to gather a collection of resources into a single instance with containing context. In FHIR this is referred to as "bundling" the resources together. These resource bundles are useful for a variety of different reasons, including sending a set of resources as part of a message exchange (see Messaging)

## 1.3 MedComMessagingMessageHeader

[TBD]

<figure style="margin-left: 0px; margin-right: 0px; width: 100%;">
<a href="https://medcomdk.github.io/MedCom-FHIR-Communication/assets/images/MedComMessageHeader.png" target="_blank"> <img src="https://medcomdk.github.io/MedCom-FHIR-Communication/assets/images/MedComMessageHeader.png" alt="MedComMessageHeader"  style="width:100%" id="Fig1" style="align-left"></a>
<figcaption text-align="left"><b>Figure 3: MedComMessageHeader</b></figcaption>
</figure>

<br>

| Links for MedComMessagingMessageHeader|
|:---|
| <a href="https://build.fhir.org/ig/medcomdk/dk-medcom-messaging//StructureDefinition-medcom-messaging-messageHeader.html" target="_blank"> Detailed specification for MedComMessageHeader in MedComMessingMessage IG</a> |
| [MedComMessageHeader](/assets/documents/MessageHeader.md) |
| <a href="http://hl7.org/fhir/R4/MessageHeader.html" target="_blank">Detailed specification for MessageHeader in FHIR R4</a> |

<br>

### 1.3.1 Scope and Usage

The MedComMessageHeader profile is a resource that **shall** be used in all MedCom FHIR Messages. A MedComMessagingMessageHeader **shall** include a sender and receiver and it **may** include a carbon-copy receiver, however this is depended on type of standard. Each MedComMessagingMessageHeader **shall** include a globally unique id, which **shall** be used to reference the message in the message history from the MedComMessagingProvenance profile.

The element event **shall** be defined in accordance with the type of standard the message concerns e.g., HospitalNotification and CareCommunication. Due to the different requirements for each standard, it **shall** be expected that the MedComMessagingMessageHeader is inherited in each standard.

### 1.4 MedComMessagingOrganization

[TBD]

<br>

| Links for MedComMessagingOrganization|
|:---|
| <a href="https://build.fhir.org/ig/medcomdk/dk-medcom-messaging/StructureDefinition-medcom-messaging-organization.html" target="_blank"> Detailed specification for MedComMessagingOrganization in MedComMessingMessage IG</a> |
| <a href="http://hl7.org/fhir/R4/Organization.html" target="_blank">Detailed specification for Organization in FHIR R4</a> |

<br>

### 1.4.1 Scope and Usage

This profile describes the Organization resource that **shall** be used in all MedCom FHIR Messages. MedComMessagingOrganization inherits from MedComCoreOrganization as it **shall** include both a SOR and EAN/GLN identifier. MedComMessagingOrganization **shall** be used to describe the sender and receiver organizations of all MedCom FHIR Messages.

<br>

### 1.5 MedComMessagingProvenance

Provenance of a resource is a record that describes entities and processes involved in producing and delivering or otherwise influencing that resource. Provenance provides a critical foundation for assessing authenticity, enabling trust, and allowing reproducibility. Provenance assertions are a form of contextual metadata and can themselves become important records with their own provenance. Provenance statement indicates clinical significance in terms of confidence in authenticity, reliability, and trustworthiness, integrity, and stage in lifecycle (e.g. Document Completion - has the artifact been legally authenticated), all of which may impact security, privacy, and trust policies.

<br>

| Links for MedComMessagingProvenance|
|:---|
| <a href="https://build.fhir.org/ig/medcomdk/dk-medcom-messaging/StructureDefinition-medcom-messaging-provenance.html" target="_blank"> Detailed specification for MedComMessagingProvenance in MedComMessingMessage IG</a> |
| [MedComs use of Provenance](/assets/documents/Provenance.md) |
| <a href="http://hl7.org/fhir/R4/Provenance.html" target="_blank">Detailed specification for Provenance in FHIR R4</a> |

<br>

#### 1.5.1 Scope and Usage

The MedComMessagingProvenance resource tracks information about the activity that created, revised, deleted, or signed a version of a resource, describing the entities and agents involved. This information can be used to form assessments about its quality, reliability, trustworthiness, or to provide pointers for where to go to further investigate the origins of the resource and the information in it.

Provenance resources are a record-keeping assertion that gathers information about the context in which the information in a resource was obtained. Provenance resources are prepared by the application that initiates the create/update etc. of the resource. An AuditEvent resource contains overlapping information, but is created as events occur, to track and audit the events. AuditEvent resources are often (though not exclusively) created by the application responding to the read/query/create/update/etc. event.

<br>
<figure style="margin-left: 0px; margin-right: 0px; width: 100%;">
<a href="https://medcomdk.github.io/MedCom-FHIR-Communication/assets/images/MedComMessagingProvenance.png" target="_blank"> <img src="https://medcomdk.github.io/MedCom-FHIR-Communication/assets/images/MedComMessagingProvenance.png" alt="MedComMessageHeader"  style="width:100%" id="Fig1" style="align-left"></a>
<figcaption text-align="left"><b>Figure 4: MedComMessagingProvenance</b></figcaption>
</figure>
<br>

<!-- ## 2 Release Notes
[Updates in the latest release.](assets/documents/ReleaseNote-ENG.md) -->
