[Return](../../index.md)


# Introduction to the Technical Content
<hr/>

**Tabel of contents**
* [1 Content Overview](#1-content-overview)
  * [1.1 Narrative text](#11-narative-text)
* [2 General Messaging Model](#2-general-messaging-model) 
  * [2.1  MedComMessagingMessage (Bundle)](#21-medcommessagingmessage-bundle)
    * [2.1.1 MedComMessingMessage Identifiers](#211-medcommessingmessage-identifiers)
    * [2.1.2 MedComMessingMessage Timestamps](#212-medcommessingmessage-timestamps)
  * [2.2 MedComMessagingMessageHeader](#22-medcommessagingmessageheader)
  * [2.3 MedComMessagingOrganization](#23-medcommessagingorganization)
  * [2.4 MedComMessagingProvenance](#24-medcommessagingprovenance)
  * [2.5 MustSupport](#25-mustsupport)
  * [2.6 Narrative text](#26-narrative-texts)
    * [2.6.1 The status element](#261-the-status-element)
    * [2.6.2 The div element](#262-the-div-element)
<hr/>

  > In case of discrepancies between the <a href="https://build.fhir.org/ig/medcomdk/dk-medcom-messaging/" target="_blank">MedCom Messaging Implementation Guide (IG)</a>
  and this page, it is the IG which should be followed. Please contact <fhir@medcom.dk> if you find discrepandies.
  <br>

## 1 Content overview
The <a href="https://build.fhir.org/ig/medcomdk/dk-medcom-messaging/" target="_blank">MedCom Messaging IG</a> describes currently four FHIR profiles, which can be seen below. 

<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;width:85%}
.tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  overflow:hidden;padding:10px 5px;word-break:normal;}
.tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
.tg .tg-tysj{color:#333333;text-align:left;vertical-align:top}
.tg .tg-wqo7{color:#2c415c;text-align:left;vertical-align:top}
</style>
<table class="tg">
<caption style="color:#2c415c; font-weight:bold;text-align:center"> Tabel 1: Overview of MedCom Messaging Profiles  </caption>
<thead>
  <tr>
    <th class="tg-wqo7"><span style="font-weight:bold">Profile</span></th>
    <th class="tg-wqo7"><span style="font-weight:bold">Resource</span></th>
    <th class="tg-wqo7"><span style="font-weight:bold">Description</span></th>
    <th class="tg-wqo7"><span style="font-weight:bold">Must Support elements</span></th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-tysj"><a href="https://build.fhir.org/ig/medcomdk/dk-medcom-messaging/StructureDefinition-medcom-messaging-message.html"  target="_blank">MedComMessagingMessage</a></td>
    <td class="tg-tysj">Bundle</td>
    <td class="tg-tysj">Acts as a container for the content of the message. The type of the Bundle shall always be 'message'.</td>
    <td class="tg-tysj">Message id<br>Timestamp<br>Reference to all included profiles</td>
  </tr>
  <tr>
    <td class="tg-tysj"><a href="https://build.fhir.org/ig/medcomdk/dk-medcom-messaging/StructureDefinition-medcom-messaging-messageHeader.html" target="_blank">MedComMessagingMessageHeader</a></td>
    <td class="tg-tysj">MessageHeader</td>
    <td class="tg-tysj">The header of a message. This profile holds references to the fundamental information in a message such as sender, receiver, and the content of the message.</td>
    <td class="tg-tysj">MessagHeader id<br>Narrative text<br>Type of message<br>Sender Organization<br>Receiver Organization<br>Carbon Copy<br>Receiver of the receipt</td>
  </tr>
  <tr>
    <td class="tg-tysj"><a href="https://build.fhir.org/ig/medcomdk/dk-medcom-messaging/StructureDefinition-medcom-messaging-organization.html" target="_blank">MedComMessagingOrganization</a></td>
    <td class="tg-tysj">Organization</td>
    <td class="tg-tysj">Information usefull to identify a messaging organization</td>
    <td class="tg-tysj">Identifier (SOR-id)<br>Identifier (EAN/GLN-number)<br>Name</td>
  </tr>
  <tr>
    <td class="tg-tysj"><a href="https://build.fhir.org/ig/medcomdk/dk-medcom-messaging/StructureDefinition-medcom-messaging-provenance.html" target="_blank">MedComMessagingProvenance</a></td>
    <td class="tg-tysj">Provenance</td>
    <td class="tg-tysj">Information about the activity of the current message and which organization has triggered the message. Further it describes the history of message activities.</td>
    <td class="tg-tysj">Targets the MessageHeader<br>Timestamps<br>Activity of the message<br>Sender organization<br>If the message is a response to a previuos message</td>
  </tr>
</tbody>
</table>

<br>

## 2 General messaging model
The <a href="#Fig1" rel="noopener noreferrer"> figure 1 </a> illustrates the general messaging model, which all MedCom FHIR messages will comply to. 

As shown below in the diagram  there are four MedCom profiled FHIR resources involved in a MedCom FHIR Message:

1. A MedComMessagingMessage is a Bundle resource of type "message", which is a container for a collection of other resources:
2. The MedComMessagingMessage's first resource is a MedComMessagingMesssageHeader, which is a MesssageHeader resource
3. The MedComMessagingMesssageHeader points to at least two organizations for the MedComMessagingMessage:
  * a source organisation called a MedComMessagingOrganization, which is an Organization resource
  * a destination organisation called a MedComMessagingOrganization, which too is an Organization resource
4. The MedComMessagingMessage's MedComMessagingProvenance, which is a Provenance resource

<figure style="margin-left: 0px; margin-right: 0px; width: 100%;">
<a href="https://medcomdk.github.io/MedCom-FHIR-Communication/assets/images/MessagingModel.png" target="blank"> <img src="https://medcomdk.github.io/MedCom-FHIR-Communication/assets/images/MessagingModel.png" alt="The basic MedCom Messaging Model"  style="width:100%" id="Fig1" style="align-left"></a>
<figcaption text-align="left"><b>Figure 1: The basic MedCom Messaging Model</b></figcaption>
</figure>

Below you will finde a thorough explanation of the resources in MedCom's FHIR message profiles. 

### 2.1 MedComMessagingMessage (Bundle)

One common operation performed with resources is to gather a collection of resources into a single instance containing context. In a FHIR context this is referred to as "bundling" the resources together. These resource bundles are useful for a variety of reasons, including sending a set of resources as part of a message exchange (see Messaging)

| Links for MedComMessingMessage|
|:---|
| <a href="https://build.fhir.org/ig/medcomdk/dk-medcom-messaging//StructureDefinition-medcom-messaging-message.html" target="_blank"> Detailed specification for MedComMessingMessage in MedComMessingMessage IG</a> |
| <a href="http://hl7.org/fhir/R4/Bundle.html" target="_blank">Detailed specification for Bundle in FHIR R4</a> |

#### 2.1.1 MedComMessingMessage Identifiers

A MedComMessingMessage contains two identifiers:

* the Bundle.id and
* the MessageHeader.id.
<br><br>

Each time a new MedComMessingMessage is created, it **SHALL** be assigned an identifier (MessageHeader.id) that is unique. This **SHALL** be achieved by using a UUID. Each time a message is sent, the Bundle.id **SHALL** be changed to a new value.

When a receiver receives and processes the MedComMessingMessage, it **SHALL** respond with a new MedComMessingMessage with a new identifier, wrapped in a bundle which also has a new id. The response message **SHALL** also quote the request MessageHeader.id in MessageHeader.response.identifier so that the source system can relate the response to its request.

#### 2.1.2 MedComMessingMessage Timestamps
A MedComMessingMessage has 2 important timestamps:

* Bundle.timestamp: the time the message was sent
* Bundle.meta.lastUpdated: the last time the message was updated (either by storing, or by modification)
<br><br>
In addition, the message **MAY** have additional timestamps in additional resources in the MedComMessingMessage, either .meta.lastUpdated or others throughout the resources. The meaning of these will depend on the MedComMessingMessage event.

### 2.2 MedComMessagingMessageHeader
The MedComMessageHeader profile is a resource that shall be used in all MedCom FHIR Messages. A MedComMessagingMessageHeader shall include a sender and receiver and it may include a carbon-copy receiver, however, this depends on the type of standard. Each MedComMessagingMessageHeader shall include a globally unique id, which shall be used to reference the message in the message history from the MedComMessagingProvenance profile.

The element event shall be defined in accordance with the type of standard the message concerns e.g., HospitalNotification and CareCommunication. Due to the different requirements for each standard, it shall be expected that the MedComMessagingMessageHeader is inherited in each standard.

<figure style="margin-left: 0px; margin-right: 0px; width: 100%;">
<a href="https://medcomdk.github.io/MedCom-FHIR-Communication/assets/images/MedComMessageHeader.png" target="_blank"> <img src="https://medcomdk.github.io/MedCom-FHIR-Communication/assets/images/MedComMessageHeader.png" alt="MedComMessageHeader"  style="width:100%" id="Fig2" style="align-left"></a>
<figcaption text-align="left"><b>Figure 2: MedComMessageHeader</b></figcaption>
</figure>

<br>

| Links for MedComMessagingMessageHeader|
|:---|
| <a href="https://build.fhir.org/ig/medcomdk/dk-medcom-messaging//StructureDefinition-medcom-messaging-messageHeader.html" target="_blank"> Detailed specification for MedComMessageHeader in MedComMessingMessage IG</a> |
| [MedComMessageHeader](/assets/documents/MedComMessagingMessageHeader.md) |
| <a href="http://hl7.org/fhir/R4/MessageHeader.html" target="_blank">Detailed specification for MessageHeader in FHIR R4</a> |


### 2.3 MedComMessagingOrganization
This profile describes the Organization resource that shall be used in all MedCom FHIR Messages. MedComMessagingOrganization inherits from MedComCoreOrganization as it shall include both a SOR and EAN/GLN identifier. MedComMessagingOrganization shall be used to describe the sender and receiver organizations of all MedCom FHIR Messages.

| Links for MedComMessagingOrganization|
|:---|
| <a href="https://build.fhir.org/ig/medcomdk/dk-medcom-messaging/StructureDefinition-medcom-messaging-organization.html" target="_blank"> Detailed specification for MedComMessagingOrganization in MedComMessingMessage IG</a> |
| [MedComMessagingOrganization](/assets/documents/MedComMessagingOrganization.md) |
| <a href="http://hl7.org/fhir/R4/Organization.html" target="_blank">Detailed specification for Organization in FHIR R4</a> |


### 2.4 MedComMessagingProvenance
The MedComMessagingProvenance resource tracks information about the activity that created, revised, deleted or signed a version of a resource, and describes the entities and agents involved. This information can be used to form assessments about its quality, reliability,and trustworthiness or provide pointers for where to go to further investigate the origins of the resource and the information in it.

The provenance resources are a record-keeping assertion that gathers information about the context in which the information in a resource was obtained. Provenance resources are prepared by the application that initiates the creation/update etc. of the resource. An AuditEvent resource contains overlapping information but is created as events occur to track and audit the events. AuditEvent resources are often (though not exclusively) created by the application responding to the read/query/create/update/etc. event.

<!-- Provenance of a resource is a record that describes entities and processes involved in producing and delivering or otherwise influencing that resource. Provenance provides a critical foundation for assessing authenticity, enabling trust, and allowing reproducibility. Provenance assertions are a form of contextual metadata and can themselves become important records with their own provenance. Provenance statement indicates clinical significance in terms of confidence in authenticity, reliability, and trustworthiness, integrity, and stage in lifecycle (e.g. Document Completion - has the artifact been legally authenticated), all of which may impact security, privacy, and trust policies. -->
<br>
<figure style="margin-left: 0px; margin-right: 0px; width: 100%;">
<a href="https://medcomdk.github.io/MedCom-FHIR-Communication/assets/images/MedComMessagingProvenance.png" target="_blank"> <img src="https://medcomdk.github.io/MedCom-FHIR-Communication/assets/images/MedComMessagingProvenance.png" alt="MedComMessageHeader"  style="width:100%" id="Fig1" style="align-left"></a>
<figcaption text-align="left"><b>Figure 4: MedComMessagingProvenance</b></figcaption>
</figure>
<br>
<br>

| Links for MedComMessagingOrganization|
|:---|
| <a href="https://build.fhir.org/ig/medcomdk/dk-medcom-messaging/StructureDefinition-medcom-messaging-organization.html" target="_blank"> Detailed specification for MedComMessagingOrganization in MedComMessingMessage IG</a> |
| [MedComMessagingOrganization](/assets/documents/MedComMessagingOrganization.md) |
| <a href="http://hl7.org/fhir/R4/Organization.html" target="_blank">Detailed specification for Organization in FHIR R4</a> |
  <br>


### 2.5 MustSupport

Labeling an element MustSupport means that implementations that produce or consume resources SHALL provide "support" for the element in some meaningful way. Because the base FHIR specification is intended to be independent of any particular implementation context, no elements are flagged as mustSupport=true as part of the base specification. This flag is intended for use in profiles that have a defined implementation context.

For this reason, the specification itself never labels any elements as MustSupport. This is done in StructureDefinitions, where the profile labels an element as mustSupport=true. When a profile does this, it SHALL also make clear exactly what kind of "support" is required, as this could involve expectations around what a system must store, display, allow data capture of, include in decision logic, pass on to other data consumers, etc.

Note that an element that has the property IsModifier is not necessarily a "key" element (e.g. one of the important elements to make use of the resource), nor is it automatically mustSupport - however both of these things are more likely to be true for IsModifier elements than for other elements.

<br>

In MedCom FHIR Messaging MustSupport denotes the MedCom FHIR Message. While FHIR resources can contain a lot of different elements, a MedCom FHIR Message is defined to be exactly what is outlined by the MustSupport flag in the IG

<!-- ## 2 Release Notes
[Updates in the latest release.](assets/documents/ReleaseNote-ENG.md) -->

### 2.6 Narrative Texts

A Narrative Text is a human-readable narrative that contains a summary of the resource and can be used to represent the content of the resource to a human. The narrative **SHALL** encode all the structured data pointed out by the ∑-symbol and it is required to contain sufficient detail to make it "clinically safe" for a human to just read the narrative.
Contained resources do not have narrative, but their content **SHALL** be represented in the ressource container.

Narratives contains two sub elements, status and div.

#### 2.6.1 The status element
The code system [narrative status](http://hl7.org/fhir/narrative-status) defines the codes for the status element.

In MedCom FHIR Messages The code **SHALL** always be: "additional" meaning that the it is covering the code: extension and allowing for more human readable text in the div element than is produced by: generated and extension.

A narrative in MedCom FHIR Messages **SHALL NEVER** be of code: empty.

#### 2.6.2 The div element

The contents of the div element are XHTML fragments that **SHALL** contain only the basic HTML formatting elements described in chapters 7-11 (except section 4 of chapter 9) and 15 of the HTML 4.0 standard, '<a>' elements (either name or href), images and internally contained style attributes.

The XHTML content **SHALL NOT** contain a head, a body element, external stylesheet references, deprecated elements, scripts, forms, base/link/xlink, frames, iframes, objects or event related attributes (e.g. onClick). This is to ensure that the content of the narrative is contained within the resource and that there is no active content. Such content would introduce security issues and potentially safety issues with regard to extracting text from the XHTML. Note that even with these restrictions, there are still several important security risks associated with displaying the narrative.

The div element **SHALL** have some non-whitespace content (text or an image).

#### 2.6.3 General Narrative Text Rules

* All resources in a MedComMessingMessage **SHALL** contain a Narrative Text defined by the [resource].Text element
* The Narrative Text **SHALL** have a status with value "extensions". Extensions means that the contents of the narrative are entirely generated from the core elements in the content and some of the content is generated from extensions.
* The narrative **SHALL** reflect the impact of all modifier extensions.

| Links for Narrative Text|
|:---|
|[Narrative Text description in FHIR R4](http://hl7.org/fhir/R4/narrative.html#Narrative) |
|[NarrativeStatus in FHIR R4](http://hl7.org/fhir/R4/codesystem-narrative-status.html#4.3.14.424.2)|
|[Styling the XHTML in FHIR R4](http://hl7.org/fhir/R4/narrative.html#css)|