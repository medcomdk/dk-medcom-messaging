## FHIR Messaging - Validation Governance
{: #fhir-messaging-validation-governance}

### Sender-side validation
{: #sender-side-validation}

* The sender **SHALL** provide valid outgoing FHIR messages according to the relevant FHIR Implementation Guide(s) (IG) before transmission. This includes Acknowledgements.
* Messages with validation errors **SHALL NOT** be sent unless explicitly approved by the responsible authority within the sending organization.

### Receiver-side validation
{: #receiver-side-validation}

Standards released after 2025, you will be able to read the version of the standard through the MessageDefinition. You can find it in the MessageHeader via the `definition` element .e.g. `"definition" : "http://medcomfhir.dk/ig/messagedefinitions/MessageDefinition/MedComCareCommunicationMessageDefinition|5.0"`. Everything after the pipe `|` symbol is the version of the standard. You should only care about the major and minor semantic version. If the pipe also has a patch, ignore it.

* The receiver **SHALL** ensure the validity of the received incoming messages according to the relevant FHIR Implementation Guide(s) (IG) before further processing.
* Receivers **SHALL** accept non-critical warnings but **SHALL** reject messages that violate mandatory constraints and rules.
* The sender **SHALL** ensure the validity of the received incoming acknowledgements and ensure that they correctly reference the original message. If an Acknowledgement is not valid, the receiver **SHALL** contact the sending system through alternative communication channels to inform them that their acknowledgement messages are not conformant.
* If no version has been specificed, the receiver **SHOULD** try and validate with the newest version of the standard. If that doesn't work, then the next-newest, until all major versions have been tried.