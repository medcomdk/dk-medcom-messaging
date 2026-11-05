## Scope and usage

MedComMessagingMessage is the common Bundle profile used by MedCom messaging standards. Individual standards specialize it for their clinical content and corresponding MessageHeader profile. The snapshot and constraints below define the required structure.

<img alt="General MedCom messaging model with Bundle, MessageHeader, Organization and Provenance." src="./MessagingModel.png" style="float:none; display:block; margin-left:auto; margin-right:auto;" />

## Additional governance
{: #message-content-requirements}

The following requirements are not expressed as constraints on this Bundle profile.

| ID                                       | Requirement                                                                                                                                |
| :--------------------------------------- | :----------------------------------------------------------------------------------------------------------------------------------------- |
| <a id="MSG-04" href="#MSG-04">MSG-04</a> | A MedCom FHIR Message **SHALL** contain at least two bundled MedComMessagingOrganization resources.                                        |
| <a id="MSG-10" href="#MSG-10">MSG-10</a> | With the exception of an acknowledgement message; A MedCom FHIR Message **SHALL** contain at least one bundled MedComCorePatient resource. |
{: .medcom-governance-rules}

Validation before dispatch and before processing received messages is governed by [Messaging validation governance](validation-governance.html#fhir-messaging-validation-governance).

## Bundle identifiers and dispatch time
{: #bundle-identifiers-and-timestamps}

Bundle.id corresponds to the EnvelopeId in MedCom OIOXML messages. Each time a message is dispatched, the sender **SHALL** assign a new globally unique Bundle.id; it **SHALL NOT** reuse the id of a previously dispatched Bundle. A new Bundle.id does not change the identity of the message carried in the Bundle; see [MessageHeader identity](StructureDefinition-medcom-messaging-messageHeader.html#message-identity-and-acknowledgements).

The optional Bundle.identifier can be assigned explicitly by the sending application and **MAY** have the same value as Bundle.id.

Bundle.timestamp records the dispatch time of the message. See [Provenance timestamps](StructureDefinition-medcom-messaging-provenance.html#provenance-timestamps) for the sending activity's timestamps and [reliable messaging](message-exchange.html#reliable-messaging-using-medcom-fhir-messaging) for retry handling.
