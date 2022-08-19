[Return](../../index.md)

# Introduction to the Technical Content

**Tabel of Contents**
* [1 Content Overview](#1-content-overview)
  * [1.1 Narrative text](#11-narative-text)
* [2 General Messaging Model](#2-general-messaging-model) 

<br>
<br>

  > In case of discrepancies between the <a href="https://build.fhir.org/ig/medcomdk/dk-medcom-messaging/" target="_blank">MedCom Messaging Implementation Guide (IG)</a>
  and this page, it is the IG which should be followed. Please contact <fhir@medcom.dk> if you find discrepandies.
  <br>

## 1 Content Overview
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

### 1.1 Narative text 
MedCom FHIR messages shall always contain a human-readable narrative text. The narrative text is a summary of the resource content and contains all resources with a ∑ flag.  An overview of the included resources in narrative text can be found in the standard IG.
For the general MedCom FHIR messages the narrative text contains i.e. information about message type, message destination application(s), actual destination address or id, the primary receiver of the message, system information, extensions and more. To see alle included resources in the narrative text see <a href="https://build.fhir.org/ig/medcomdk/dk-medcom-messaging/" target="_blank">MedCom Messaging IG</a>


## 2 General Messaging Model
The <a href="#Fig1" rel="noopener noreferrer"> figure 1 </a> illustrates the general messaging model, which all MedCom FHIR messages will comply to. From the entry element in profile MedComMessagingMessage all included profiles shall be referenced. MedComMessagingMessageHeader references the sender, receiver, and carbon-copy organizations, which all shall be a MedComMessagingOrganization. Additional content of the message, like an Encounter in HospitalNotification or a Communication in CareCommunication, is referenced from the focus element in MedComMessagingMessageHeader

<figure>
<img src="../images/MessagingModel.png" alt="General Messaging Model when exchanging a MedCom FHIR Message." style="width:50%" id="Fig1">
<figcaption text-align="center"><b>Figure 1: General Messaging Model for MedCom FHIR Message</b> </figcaption>
</figure>

<!-- ## 3 Release Note
[Updates in the latest release.](ReleaseNotesTechnicalContent.md) -->