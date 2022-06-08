# Introduction to the Technical Content

> In case of discrepancies between the <a href="https://build.fhir.org/ig/medcomdk/dk-medcom-messaging/" target="_blank">MedCom Messaging Implementation Guide (IG)</a>
 and this page, it is the IG which should be followed. Please contact <fhir@medcom.dk> if you find discrepandies.

## Content Overview

The <a href="https://build.fhir.org/ig/medcomdk/dk-medcom-messaging/" target="_blank">MedCom Messaging IG</a> describes currently four FHIR profiles, which can be seen below. 

<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;max-width:65%;}
.tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  overflow:hidden;padding:10px 5px;word-break:normal;}
.tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
.tg .tg-uaof{color:#343434;font-weight:bold;text-align:left;vertical-align:top}
.tg .tg-ne9s{color:#343434;text-align:left;vertical-align:top}
</style>
<table class="tg">
<thead>
  <tr>
    <th class="tg-uaof">Profile</th>
    <th class="tg-uaof">Resource</th>
    <th class="tg-uaof">Describtion</th>
    <th class="tg-uaof">MustSupport elements</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-ne9s">MedComMessagingMessage</td>
    <td class="tg-ne9s">Bundle</td>
    <td class="tg-ne9s">Acts as a container for the content of the message. The type of the Bundle shall always be 'message'.</td>
    <td class="tg-ne9s">Message id<br>Timestamp<br>Reference to all included profiles</td>
  </tr>
  <tr>
    <td class="tg-ne9s">MedComMessagingMessageHeader</td>
    <td class="tg-ne9s">MessageHeader</td>
    <td class="tg-ne9s">The header of a message, from this profile is the vital information in a message referenced. This profile shall always be the first referenced profile, when the type of the Bundle is 'message'.</td>
    <td class="tg-ne9s">MessagHeader id<br>Narrative text<br>Type of message<br>Sender Organization<br>Receiver Organization<br>Carbon Copy<br>Receiver of the receipt</td>
  </tr>
  <tr>
    <td class="tg-ne9s">MedComMessagingOrganization</td>
    <td class="tg-ne9s">Organization</td>
    <td class="tg-ne9s">Information usefull to identify a messaging organization</td>
    <td class="tg-ne9s">Identifier (SOR-id)<br>Identifier (EAN/GLN-number)<br>Name</td>
  </tr>
  <tr>
    <td class="tg-ne9s">MedComMessagingProvenance</td>
    <td class="tg-ne9s">Provenance</td>
    <td class="tg-ne9s">Information about the activity of the current message and which organization has triggered the message. Further it describes the history of message activities.</td>
    <td class="tg-ne9s">Targets the MessageHeader<br>Timestamps<br>Activity of the message<br>Sender organization<br>If the message is a response to a previuos message</td>
  </tr>
</tbody>
</table>

## General Messaging Model

The figure below illustrates the general messaging model, which all MedCom FHIR messages will comply to. From the entry element in profile MedComMessagingMessage all included profiles shall be referenced, as illustrated with MedComMessagingMessageHeader and MedComMessagingProvenance. MedComMessagingMessageHeader references the sender, receiver and carbon-copy organizations, which all shall be a MedComMessagingOrganization. Additional content, like an Encounter or a Communication profile in the message, is referenced from the focus element inMedComMessagingMessageHeader.

![General Messaging Model when exchanging a MedCom FHIR Message.](../images/MessagingModel.png) 