# Governance for MedCom FHIR Message Exchange
{: #governance-for-medcom-fhir-message-exchange}

MedCom FHIR messaging uses asynchronous exchange through the Danish healthcare messaging network. This guidance also applies to corresponding OIOXML versions where the FHIR message defines their content.

## MedCom exchange model
{: #basic-danish-messaging-assumptions}

### Asynchronous messaging
{: #asynchronous-messaging}

A sending system dispatches a message to a receiving system through the messaging network. The response is returned asynchronously. Addressing in the VANS network uses the organization information held in SOR; see [VANS network governance](vans-network-layer.html).

The [Bundle](StructureDefinition-medcom-messaging-message.html), [MessageHeader](StructureDefinition-medcom-messaging-messageHeader.html), and [Provenance](StructureDefinition-medcom-messaging-provenance.html) profiles own the message structure, identifiers, timestamps, routing references, and history requirements. For the general exchange framework and response patterns, see [FHIR messaging](https://hl7.org/fhir/R4/messaging.html).

## Reliable Messaging
{: #reliable-messaging-using-medcom-fhir-messaging}

MedCom Reliable Messaging combines acknowledgements, retries, and duplicate detection. A missing acknowledgement leaves the sender uncertain: either the message or its acknowledgement may have been lost. Retrying must therefore be safe even when the receiver has already processed the message.

### Two acknowledgement layers

| Layer | What the acknowledgement confirms |
|:---|:---|
| VANSEnvelope | The receiving transport handler's result for the envelope. This does not confirm that the FHIR application accepted its content. |
| FHIR message | The receiving application's result: acceptance (AA), error (AE), or rejection (AR). Only AA marks the message as successfully sent and received; AE and AR mark it as failed. |

On the VANS network, each MedCom FHIR message **SHALL** be carried in a VANSEnvelope with reliable transport enabled: `VANSEnvelope/Message/MetaInformation/Transport/Type` is `reliable` or omitted (the default). See [VANS network requirements](vans-network-layer.html#reliable-messaging-using-vansenvelope).

Both primary and copy receivers **SHALL** return a FHIR Acknowledgement for each non-Acknowledgement message. Its `MessageHeader.response.identifier` quotes the original `MessageHeader.id`. A FHIR Acknowledgement **SHALL NOT** itself receive a FHIR Acknowledgement; its envelope still uses reliable transport.

### Rules to make Reliable Messaging work
#### FHIR Messaging rules
{: #fhir-messaging-rules}

AA = Application Accept & AE = Application Error & AR = Application Reject. You can read more in the [Acknowledgement IG](http://medcomfhir.dk/ig/acknowledgement/StructureDefinition/medcom-messaging-acknowledgementHeader).

| ID | Rule |
|:------| :-----|
| MR1.S | A MedCom FHIR Acknowledgement **SHALL** be requested on a FHIR Message |
| MR2.S | A MedCom FHIR Message **SHALL** be marked as sent and received when an AA Acknowledgement has been received |
| MR3.S | A MedCom FHIR Message **SHALL** be marked as failed when an AR, or AE Acknowledgement has been received |
| MR6.R | A MedCom FHIR Message **SHALL NOT** be resent if an AE Acknowledgement has been received |
| MR7.R | A MedCom FHIR Message that is resent **SHALL** be updated with a new `Bundle.id`, `Bundle.timestamp` and `Provenance` timestamps |
| MR8.R | A MedCom FHIR Message is considered a duplicate if it contains the same MessageHeader.Id as a previously received MedCom FHIR Message |
| MR9.R | A duplicate MedCom FHIR Message **SHALL NOT** have different business content compared to the original message |

#### FHIR Messaging Acnowledgement rules
{: #fhir-messaging-acnowledgement-rules}

| ID | Rules |
|:------| :-----|
| KR1.R | A FHIR message **SHALL** be acknowledged |
| KR2.R | An Acknowledgement message **SHALL** not be acknowledged |
| KR3.R | If no errors are found while receiving a message, an AA Acknowledgement **SHALL** be sent |
| KR4.R | If a technical error occurs in the receiver's system while receiving a message, an AR Acknowledgement **SHALL** be sent |
| KR5.R | If a technical error from KR4.R is resolved and the message can be loaded. An AA Acknowledgement **SHALL**  be sent |
| KR6.R | If a message validates negatively against the standard's profiling, it **SHALL** be acknowledged negatively with an AE Acknowledgement |
| KR7.S | If an Acknowledgement of a message is not received within 30 minutes, the original message **MAY** be marked for resending |

## Sending scenarios
{: #handling-sending-scenarios}

The **primary receiver** is the main recipient of a message. A **copy receiver** receives a separate message based on the message sent to the primary receiver.

The scenarios below distinguish between two ways to send a copy:

| Type | When it is used | Business content |
|:---|:---|:---|
| Carbon copy (CC) | The copy receiver is known when the original message is prepared and sent. | The same as the message sent to the primary receiver. |
| Forward | The message is sent later to a receiver who was not included in the original exchange. | Most of the original content is retained; minor changes are allowed, subject to the clarification in Scenario #4. |

In these scenarios, “message” means a MedComMessagingMessage. Each carbon copy or forward is a new message with its own identifiers and message history.

### Scenario #1: Sending to a primary receiver
{: #scenario-1-sending-to-a-primary-receiver}

Use this scenario when sending a new message, replying to a message, withdrawing a message, or sending a correction to the primary receiver.

For example, a hospital sends a new message to a general practitioner. The practitioner is the primary receiver, and the sending activity is `new-message`.

The sender **SHALL** include a MedComMessagingProvenance resource that records the sending activity using one of these codes:

| Activity code | Use it when |
|:---|:---|
| `new-message` | Sending a new message. |
| `reply-message` | Replying to a previous message. |
| `retract-message` | Withdrawing a previous message. |
| `modified-message` | Sending a corrected or updated version of a previous message. |

### Scenario #2: Creating a carbon copy or forward
{: #scenario-2-sending-copies-of-a-medcommessagingmessage}

Use this scenario whenever another receiver needs a carbon copy or a forwarded message. The same preparation steps apply to both; Scenarios #3 and #4 describe their specific requirements.

For example, a hospital sends a message to a general practitioner and also needs to send a carbon copy to a municipality. The municipality receives a separate message with its own identifiers.

1. The sending application **SHALL** create a copy of the original message and send it as a new MedComMessagingMessage.
2. Give the new message its own `MessageHeader.id` and `Bundle.id`, and set its dispatch timestamp according to the [message identity and acknowledgement requirements](StructureDefinition-medcom-messaging-messageHeader.html#message-identity-and-acknowledgements) and [Bundle identifier and dispatch-time requirements](StructureDefinition-medcom-messaging-message.html#bundle-identifiers-and-timestamps).
3. Add a new MedComMessagingProvenance resource. It **SHALL** describe the copy or forward activity and be added to the [message history](StructureDefinition-medcom-messaging-provenance.html#history).

### Scenario #3: Sending when the carbon-copy receivers are already known
{: #scenario-3-sending-to-a-primary-receiver-with-an-already-known-copyreciver}

Use this scenario when the sender knows the primary receiver and the carbon-copy receivers before sending the original message.

Every message sent in this exchange **SHALL** list both the primary destination and all carbon-copy destinations. This lets every receiver see who the main recipient is and who receives a copy.

For example, a hospital sends a message to a general practitioner and a carbon copy to a municipality. Both messages list the practitioner as the primary receiver and the municipality as a carbon-copy receiver.

#### Scenario #3a: Sending the carbon copy
{: #scenario-3a-sending-to-a-copyreceiver-while-also-sending-to-a-primary-receiver}

For each carbon-copy receiver in Scenario #3, prepare a separate message using the steps in Scenario #2.

The carbon copy **SHALL** contain the same content as the message sent to the primary receiver, except for its new `Bundle.id`, new `MessageHeader.id`, and additional MedComMessagingProvenance resource. Dispatch timestamps follow the requirements linked in Scenario #2.

1. Assign the new identifiers. All other MessageHeader content **SHALL NOT** be changed, including the primary and carbon-copy destinations.
2. Add a Provenance entry for the copy activity, following the [Provenance history requirements](StructureDefinition-medcom-messaging-provenance.html#history).
3. All other bundled resources **SHALL NOT** be changed.
4. Create a VANSEnvelope for this copy. It **SHALL** use the carbon-copy receiver's GLN as the receiving EAN.

In the example above, the carbon copy still lists the practitioner as primary receiver and the municipality as copy receiver. Its VANSEnvelope addresses the municipality so that the copy is delivered there.

### Scenario #4: Forwarding a message
{: #scenario-4-forwarding-a-message}

Use this scenario when a message is sent later to a new receiver who was not included when the original message was prepared and sent.

For example, a general practitioner receives a hospital message and later forwards it to a municipality that was not a receiver of the original message.

A forward is a new MedComMessagingMessage. It **SHALL** retain most of the original content and **MAY** contain minor adjustments or minor new content. It **MAY** also copy the original content without changes, apart from the new identifiers and additional Provenance resource.

1. Create the new message as described in Scenario #2, with a new `Bundle.id` and `MessageHeader.id`. All other MessageHeader content **SHALL NOT** be changed.
2. Add a Provenance entry for the forward activity, following the [Provenance history requirements](StructureDefinition-medcom-messaging-provenance.html#history).
3. All other bundled resources **SHALL NOT** be changed.
4. Create a VANSEnvelope for the forward. It **SHALL** use the new receiver's GLN as the receiving EAN.

The new receiver is therefore addressed in the VANSEnvelope, while the MessageHeader retains the original destinations.

> **Clarification needed:** The forwarding rules allow minor content changes but also prohibit changes to other bundled resources. These requirements need to be reconciled to define which content may be changed.

## Receiving scenarios
{: #handling-receiving-scenarios}

A system can receive a MedComMessagingMessage as either the primary receiver or a copy receiver. For example, in Scenario #3, the general practitioner receives the primary message and the municipality receives the carbon copy.

1. The receiver's role as primary receiver or copy receiver **SHALL** be recorded in Provenance.
2. Both primary and copy receivers **SHALL** generate and send a MedCom Acknowledgement for each message other than an Acknowledgement. Each receiver acknowledges the separate message delivered to it.

For example, the practitioner acknowledges the primary message, and the municipality acknowledges its copy. An Acknowledgement message does not receive another FHIR Acknowledgement; see [Two acknowledgement layers](#two-acknowledgement-layers).
