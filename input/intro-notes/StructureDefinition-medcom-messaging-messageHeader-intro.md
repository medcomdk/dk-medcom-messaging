### Scope and usage

MedComMessagingMessageHeader provides the routing and event information for a MedCom message. Individual messaging standards specialize this profile for their events and workflow. Required elements, destination slices, reference types, and narrative requirements are defined in the snapshot and element descriptions below.

<img alt="MedComMessagingMessageHeader references the sender, primary receiver and carbon-copy receiver organizations." src="./MedComMessageHeader.png" style="float:none; display:block; margin-left:auto; margin-right:auto;" />

## Message identity and acknowledgements
{: #message-identity-and-acknowledgements}

MessageHeader.id corresponds to the LetterId in MedCom OIOXML messages and identifies the message independently of the Bundle used to dispatch it. Its element definition specifies uniqueness for new messages and retention of the id for retransmissions. Carbon copies and forwards are new messages; see [copy and forward scenarios](message-exchange.html#scenario-2-sending-copies-of-a-medcommessagingmessage).

The id is used when describing message history in [MedComMessagingProvenance](StructureDefinition-medcom-messaging-provenance.html#history). When processing a message other than an Acknowledgement, the receiving system **SHALL** return an [Acknowledgement](https://medcomfhir.dk/ig/acknowledgement/) whose MessageHeader.response.identifier quotes the request's MessageHeader.id, so the sender can correlate the response with its request.

## Additional governance
{: #message-focus}

| ID | Requirement |
|:---|:---|
| <a id="HDR-07" href="#HDR-07">HDR-07</a> | A MedCom FHIR Message **SHALL** contain one bundled focused resource referenced by MessageHeader.focus. |
{: .medcom-governance-rules}

This requirement is not enforced by the base Messaging profile constraints. Hence why it's a rule here.
