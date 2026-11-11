# Governance for the VANS Network Layer
{: #governance-for-network-layer}

The Danish Healthcare Messaging Network is currently the VANS Network on which the overall shipment of a message is handled through Asynchronous Messaging.

To be able to communicate over the VANS Network, both senders and receivers **SHALL** have a GLN number issued by the SOR. <a href="https://sundhedsdatastyrelsen.dk/da/rammer-og-retningslinjer/organisationsregistrering" target="_blank">Click here to open SOR </a>. The SOR is developed by The Danish Health Data Authority and therefore the information in SOR are in Danish.

To be able to communicate a specific MedCom FHIR message type both senders and receivers **SHALL** be registered in SOR with that message type and version.

The Sending Ecosystem **SHALL** validate the message before dispatching it. Validating a message **SHALL** include validating the correct use of the ValueSets and CodeSystems used in the message.

## VANSEnvelope
{: #vansenvelope}

VANSEnvelope carries XML-based and other non-EDIFACT message types over the VANS network. Unless the individual standard specifies otherwise, MedCom FHIR messages **SHALL** be sent in a VANSEnvelope, whether encoded as `application/fhir+xml` or `application/fhir+json`. Reception may use VANSEnvelope or another envelope, such as KOMBIT's BeskedFordeler envelope.

Envelopment **SHALL** follow the [VANSEnvelope specification](https://svn.medcom.dk/svn/releases/Standarder/Den%20gode%20VANSEnvelope/Dokumentation) (Danish) and the metadata requirements below. Each VANSEnvelope **SHALL** contain only one MedCom FHIR message.

### Payload and transport metadata

The FHIR message **SHALL** be base64-encoded in `VANSEnvelope/Message/Data/`.

Under `VANSEnvelope/Message/MetaInformation/Transport`, `TransformMessage` is handled as usual. `ServiceTag` with the attribute `name="MCM:MIME"` **SHALL** contain `application/fhir+xml` or `application/fhir+json`, matching the message's encoding.

### Document metadata

The following fields are under `VANSEnvelope/Message/MetaInformation/Document/`:

#### Format
{: #format}

`Format` **SHALL** match "Standard type" in MedCom's Standards Directory and **SHALL** be `HL7` for all FHIR standards.

#### Name
{: #name}

`Name` **SHALL** match "Type nr." in MedCom's Standards Directory and **SHALL** be prefixed with `MCM:`. It may include a statistical suffix identifying a message variant, as with GGOP1, GGOP2, and GGOP3. The FHIR-specific names and suffixes are listed below.

#### Version
{: #version}

`Version` **SHALL** match "Version" in MedCom's Standards Directory and therefore depends on the message type and version.

### MedCom FHIR message types
{: #medcom-fhir-message-types}

| Message type         | Sending envelope   | Receiving envelope                                                 | Name                         | Version | Allowed postfix values                                                                                                                  |
| :------------------- | :----------------- | :----------------------------------------------------------------- | :--------------------------- | :------ | :-------------------------------------------------------------------------------------------------------------------------------------- |
| CareCommunication    | VANSEnvelope       | VANSEnvelope                                                       | `MCM:FDIS91#<postfix value>` | `5.0`   | [CareCommunication categories](https://medcomfhir.dk/ig/terminology/ValueSet-medcom-careCommunication-categories.html)                  |
| HospitalNotification | VANSEnvelope (EPJ) | KOMBIT's BeskedFordeler envelope (EOJ and other municipal systems) | `MCM:FDIS20#<postfix value>` | `3.0.0` | [HospitalNotification activity codes](https://medcomfhir.dk/ig/terminology/ValueSet-medcom-hospitalNotification-messageActivities.html) |
| Acknowledgement      | VANSEnvelope       | VANSEnvelope                                                       | `MCM:FCTL#<postfix value>`   | `2.0`   | [FHIR response codes](http://hl7.org/fhir/R4/valueset-response-code.html)                                                               |

For CareCommunication and HospitalNotification, `Name` **SHALL** be taken from [MedComMessagingSorEdiSystem](https://medcomfhir.dk/ig/terminology/CodeSystem-medcom-messaging-sorEdiSystem.html). For Acknowledgement, `Name` **SHALL** be taken from [VansStatisticalCodeCombination](https://medcomfhir.dk/ig/terminology/CodeSystem-medcom-messaging-statisticalCodes.html).

For each type, postfix values **SHALL** come from the linked value set, and the combined name and postfix **SHALL** conform to VansStatisticalCodeCombination.

## Reliable Messaging using VANSEnvelope
{: #reliable-messaging-using-vansenvelope}

Reliable transport for MedCom FHIR messages **SHALL** follow the [VANSEnvelope specification](https://svn.medcom.dk/svn/releases/Standarder/Den%20gode%20VANSEnvelope/Dokumentation) (Danish). These rules cover envelope acknowledgements; [FHIR application acknowledgements](message-exchange.html#reliable-messaging-using-medcom-fhir-messaging) are handled separately. `MessageIdentifier` below means `Message/MetaInformation/Identifier`.

| ID    | Rule                                                                                                                                                                                                           |
| :---- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| VR1.S | `VANSEnvelope/Message/MetaInformation/Transport/Type` **SHALL** be `reliable` or omitted (the default) for envelopes carrying FHIR messages.                                                                   |
| VR2.R | The receiver **SHALL** return a VANSEnvelopeAcknowledgement to the sender                                                                                                                                      |
| VR3.R | The receiver **SHALL** check `EnvelopeIdentifier` and `MessageIdentifier` against previously received envelopes. If both are new, it **SHALL** process the message.                                            |
| VR4.R | An unchanged message with a known `MessageIdentifier` is a duplicate, whether its `EnvelopeIdentifier` is known or new.                                                                                        |
| VR5.S | When retrying an unchanged message, including after a lost acknowledgement, the sender **SHALL** assign a new `EnvelopeIdentifier` and dispatch time, retaining the `MessageIdentifier` and all other content. |
| VR6.S | Changed message content **SHALL** be sent as a new message with new `EnvelopeIdentifier`, `MessageIdentifier`, and applicable timestamps.                                                                      |
| VR7.R | A known `EnvelopeIdentifier` paired with a new `MessageIdentifier` is an error: envelope identifiers **SHALL NOT** be reused. The receiver **MAY** return a negative VANSEnvelopeAcknowledgement.              |

## Sending MedCom FHIR messages
{: #sending-medcom-fhir-messages}

Sending MedCom FHIR messages over the VANS Network requires the sending system to handle the following:

When sending to both primary and cc destinations.

1. A Sending Ecosystem **SHALL** secure that the MedCom FHIR messages for primary and cc receivers differ on ID's as described in [Governance for MedCom FHIR Messaging](message-exchange.html)
2. A Sending Ecosystem MUST ensure that the total size of a MedCom FHIR message, once embedded in a VANSEnvelope, does not exceed 100 MB when sent on the VANS Network. If the size is validated before the message is embedded in a VANSEnvelope, the Sending Ecosystem MAY apply a slightly lower limit to reserve space for the VANSEnvelope overhead and thereby ensure compliance with the 100 MB maximum.

## Receiving MedCom FHIR messages
{: #receiving-medcom-fhir-messages}

A Receiving Ecosystem **SHALL** be able to receive MedCom FHIR messages both as "application/fhir+xml" and "application/fhir+json"

A Receiving Ecosystem **SHALL** be able to handle both primary and cc destinations and route them to the right application.