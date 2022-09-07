<!-- <a href="https://medcomdk.github.io/MedComLandingPage/">Return</a> -->

# MedCom Messaging

<hr/>

**Table of Contents**

* [1 Standard Documentation](#1-standard-documentation)
  * [1.1 Use Cases](#11-uses-cases)
  * [1.2 Technical Specifications](#11-technical-specifications)

  * [1.2. MedComMessagingMessage](#12-medcommessagingmessage-bundle)
  * [1.3. MedComMessagingHeader](#13-medcommessagingmessageheader)
  * [1.4. MedComMessagingOrganization](#14-medcommessagingorganization)
  * [1.5. MedComMessagingProvenance](#15-medcommessagingprovenance)
<!-- * [2 Release Notes](#2-release-notes) -->
<hr/>
 
 > Note: Clinical guidelines and use cases are in both Danish and English. The remaining documentation will be in English.

This page represents the messaging profiles (DK: Meddelelsesprofiler) used in MedComs FHIR®© standards.The MedCom Messaging Implementation Guide (IG) includes the following profiles:

* <a href="https://build.fhir.org/ig/medcomdk/dk-medcom-messaging/StructureDefinition-medcom-messaging-message.html">MedComMessagingMessage</a>
* <a href="https://build.fhir.org/ig/medcomdk/dk-medcom-messaging/StructureDefinition-medcom-messaging-messageHeader.html">MedComMessagingMessageHeader</a>
* <a href="https://build.fhir.org/ig/medcomdk/dk-medcom-messaging/StructureDefinition-medcom-messaging-organization.html"> MedComMessagingOrganization</a>
* <a href="https://build.fhir.org/ig/medcomdk/dk-medcom-messaging/StructureDefinition-medcom-messaging-provenance.html">MedComMessagingProvenance </a>

<br><br>

These profiles describe fundamental information when exchanging information as messages. Therefore one or more profiles are included in all MedComs FHIR messages. The messaging profiles do not alone constitute a standard, but one or more profiles can be used in a standard. Thus, this page includes the IG solely, and technical uses cases and does not include clinical guidelines and test protocols.





This page presents a MedCom FHIR Message Standard. The standard is the term for a collection of documentation covering most aspects of the standard.

* Clinical Documentation
  * Clinical description
  * Use Cases
* Technical Documentation
  * One or more FHIR IGs (the specific Profile IG for the standard, the inherited Profile IGs within this standard and supporting IGs for the standard, Terminology IG for instance.). These cover what in former MedCom non-FIR standards were specific rules regarding syntax and qualifiers.
* Additional Documentation
  * A GitHub Page linking it all together with further descriptions and specifications
  * This Governance



## 1 Standard Documentation

### 1.1 Uses Cases 
Use cases describe the different scenarios a standard support. For a certain real-world scenario, it describes the requirements for the content of a message. The purpose of the use cases is to ensure a coherent implementation and use of the HospitalNotification. The descriptions are targeted IT-system vendors and the people responsible for the implementation in regions and municipalities.

The use cases for HospitalNotification are qualified in collaboration with EPR- and vendors catering to the municipalities.

<b>The use cases are currently in preparation, as soon as they are ready they will be presented below in Danish and English:</b> 

<a href="https://medcomtest-my.sharepoint.com/:b:/g/personal/mbu_medcom_dk/ER1QbA8QQ-JLgE6xHpETTokBbSy64xVsCkuo8wzBSYP7gw?e=ncm8kT"> Uses cases</a>
  
  > Be aware that new version of uses cases will come soon!

### 1.1.2 What is a MedCom FHIR Message Standard

A MedCom FHIR Message Standard is the term for a collection of documentation covering most aspects of the standard.

* Clinical Documentation
  * Clinical description
  * Use Cases
* Technical Documentation
  * One or more FHIR IGs (the specific Profile IG for the standard, the inherited Profile IGs within this standard and supporting IGs for the standard, Terminology IG for instance.). These cover what in former MedCom non-FIR standards were specific rules regarding syntax and qualifiers.
* Additional Documentation
  * A GitHub Page linking it all together with further descriptions and specifications
  * This Governance

The technical specifications for MedCom Messaging profiles are defined in an IG. As mentioned previously does the MedCom Messaging profiles not alone compose a standard but are used to describe central information in MedComs messaging standards. <a href="https://build.fhir.org/ig/medcomdk/dk-medcom-messaging/" target="_blank">Here you can find the MedCom Messaging IG.</a>

## 1.2 MedComMessagingMessage (Bundle)

MedComMessagingMessage is a Bundle resource of type "message", which is a container for a collection of other resources.

<br>

Below you see the basic MedCom FHIR Messaging Model.

As shown in the diagram below there are 4 MedCom profiled FHIR resources involved in a MedCom FHIR Message:

* A MedComMessagingMessage is a Bundle resource of type "message"
* The MedComMessagingMessage's first resource is a MedComMessagingMesssageHeader, which is a MesssageHeader resource
* The MedComMessagingMesssageHeader points to at least two organizations for the MedComMessagingMessage:
  * a source organization called a MedComMessagingOrganization, which is an Organization resource
  * a destination organization also a MedComMessagingOrganization, which too is an Organization resource
* The MedComMessagingMessage's MedComMessagingProvennance, which is a Provennance resource

<br>

<figure style="margin-left: 0px; margin-right: 0px; width: 100%;">
<a href="https://medcomdk.github.io/MedCom-FHIR-Communication/assets/images/MessagingModel.png" target="blank"> <img src="https://medcomdk.github.io/MedCom-FHIR-Communication/assets/images/MessagingModel.png" alt="The basic MedCom Messaging Model"  style="width:100%" id="Fig2" style="align-left"></a>
<figcaption text-align="left"><b>Figure 2: The basic MedCom Messaging Model</b></figcaption>
</figure>

<br>

| Links for MedComMessingMessage|
|:---|
| <a href="https://build.fhir.org/ig/medcomdk/dk-medcom-messaging//StructureDefinition-medcom-messaging-message.html" target="_blank"> Detailed specification for MedComMessingMessage in MedComMessingMessage IG</a> |
| <a href="http://hl7.org/fhir/R4/Bundle.html" target="_blank">Detailed specification for Bundle in FHIR R4</a> |

<br>

## 1.2.1 Scope and Usage

One common operation performed with resources is to gather a collection of resources into a single instance with containing context. In FHIR this is referred to as "bundling" the resources together. These resource bundles are useful for a variety of different reasons, including sending a set of resources as part of a message exchange (see Messaging)

### 1.2.2 MedComMessingMessage Identifiers

A MedComMessingMessage contains two identifiers:

* the Bundle.id and
* the MessageHeader.id.

Each time a new MedComMessingMessage is created, it **SHALL** be assigned an identifier (MessageHeader.id) that is unique. This **SHALL** be achieved by using a UUID. Each time a message is sent, the Bundle.id **SHALL** be changed to a new value.

When a receiver receives and processes the MedComMessingMessage, it **SHALL** respond with a new MedComMessingMessage with a new identifier, wrapped in a bundle which also has a new id. The response message **SHALL** also quote the request MessageHeader.id in MessageHeader.response.identifier so that the source system can relate the response to its request.

### 1.2.3 MedComMessingMessage Timestamps

A MedComMessingMessage has 2 important timestamps:

* Bundle.timestamp: the time the message was sent
* Bundle.meta.lastUpdated: the last time the message was updated (either by storing, or by modification)

In addition, the message **MAY** have additional timestamps in additional resources in the MedComMessingMessage, either .meta.lastUpdated or others throughout the resources. The meaning of these will depend on the MedComMessingMessage event.

## 1.3 MedComMessagingMessageHeader

[TBD]

<br>

<figure style="margin-left: 0px; margin-right: 0px; width: 100%;">
<a href="https://medcomdk.github.io/MedCom-FHIR-Communication/assets/images/MedComMessageHeader.png" target="_blank"> <img src="https://medcomdk.github.io/MedCom-FHIR-Communication/assets/images/MedComMessageHeader.png" alt="MedComMessageHeader"  style="width:100%" id="Fig1" style="align-left"></a>
<figcaption text-align="left"><b>Figure 3: MedComMessageHeader</b></figcaption>
</figure>

<br>

| Links for MedComMessagingMessageHeader|
|:---|
| <a href="https://build.fhir.org/ig/medcomdk/dk-medcom-messaging//StructureDefinition-medcom-messaging-messageHeader.html" target="_blank"> Detailed specification for MedComMessageHeader in MedComMessingMessage IG</a> |
| [MedComMessageHeader](/assets/documents/MedComMessagingMessageHeader.md) |
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
| [MedComMessagingOrganization](/assets/documents/MedComMessagingOrganization.md) |
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
| [MedComs use of Provenance](/assets/documents/MedComMessagingProvenance.md) |
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

### 5.5 MustSupport

Labeling an element MustSupport means that implementations that produce or consume resources SHALL provide "support" for the element in some meaningful way. Because the base FHIR specification is intended to be independent of any particular implementation context, no elements are flagged as mustSupport=true as part of the base specification. This flag is intended for use in profiles that have a defined implementation context.

For this reason, the specification itself never labels any elements as MustSupport. This is done in StructureDefinitions, where the profile labels an element as mustSupport=true. When a profile does this, it SHALL also make clear exactly what kind of "support" is required, as this could involve expectations around what a system must store, display, allow data capture of, include in decision logic, pass on to other data consumers, etc.

Note that an element that has the property IsModifier is not necessarily a "key" element (e.g. one of the important elements to make use of the resource), nor is it automatically mustSupport - however both of these things are more likely to be true for IsModifier elements than for other elements.

<br>

#### 5.5.1 Scope and Usage

In MedCom FHIR Messaging MustSupport denotes the MedCom FHIR Message. While FHIR resources can contain a lot of different elements, a MedCom FHIR Message is defined to be exactly what is outlined by the MustSupport flag in the IG

<!-- ## 2 Release Notes
[Updates in the latest release.](assets/documents/ReleaseNote-ENG.md) -->

### 5.6 Narrative Texts

A Narrative Text is a human-readable narrative that contains a summary of the resource and can be used to represent the content of the resource to a human. The narrative **SHALL** encode all the structured data pointed out by the ∑-symbol and it is required to contain sufficient detail to make it "clinically safe" for a human to just read the narrative.
Contained resources do not have narrative, but their content **SHALL** be represented in the ressource container.

Narratives contains two sub elements, status and div.

#### 5.6.1 The status element

[TBD]
The code system [narrative status](http://hl7.org/fhir/narrative-status) defines the codes for the status element.

In MedCom FHIR Messages The code **SHALL** always be: "additional" meaning that the it is covering the code: extension and allowing for more human readable text in the div element than is produced by: generated and extension.

A narrative in MedCom FHIR Messages **SHALL NEVER** be of code: empty.

#### 5.6.2 The div element

The contents of the div element are XHTML fragments that **SHALL** contain only the basic HTML formatting elements described in chapters 7-11 (except section 4 of chapter 9) and 15 of the HTML 4.0 standard, '<a>' elements (either name or href), images and internally contained style attributes.

The XHTML content **SHALL NOT** contain a head, a body element, external stylesheet references, deprecated elements, scripts, forms, base/link/xlink, frames, iframes, objects or event related attributes (e.g. onClick). This is to ensure that the content of the narrative is contained within the resource and that there is no active content. Such content would introduce security issues and potentially safety issues with regard to extracting text from the XHTML. Note that even with these restrictions, there are still several important security risks associated with displaying the narrative.

The div element **SHALL** have some non-whitespace content (text or an image).

#### 5.6.3 Scope and Usage

[TBD]
The narrative element is a human-readable summary of the resource (essential clinical and business information)

#### 5.6.4 General Narrative Text Rules

* All resources in a MedComMessingMessage **SHALL** contain a Narrative Text defined by the [resource].Text element
* The Narrative Text **SHALL** have a status with value "extensions". Extensions means that the contents of the narrative are entirely generated from the core elements in the content and some of the content is generated from extensions.
* The narrative **SHALL** reflect the impact of all modifier extensions.

#### 5.6.5 Links for Narrative Text

| Links for Narrative Text|
|:---|
|[Narrative Text description in FHIR R4](http://hl7.org/fhir/R4/narrative.html#Narrative) |
|[NarrativeStatus in FHIR R4](http://hl7.org/fhir/R4/codesystem-narrative-status.html#4.3.14.424.2)|
|[Styling the XHTML in FHIR R4](http://hl7.org/fhir/R4/narrative.html#css)|
