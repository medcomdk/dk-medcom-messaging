## Scope and usage

MedComMessagingOrganization represents organizations participating in message exchange.

## Additional governance
{: #organization-use-in-messages}

| ID | Requirement |
|:---|:---|
| <a id="ORG-01" href="#ORG-01">ORG-01</a> | An Organization referenced as a primary receiver **SHALL NOT** also be referenced as a carbon-copy receiver in the same FHIR message. |
| <a id="ORG-04" href="#ORG-04">ORG-04</a> | Additional identifiers **SHOULD NOT** be expected to introduce application logic for the receiver(s) of the message. |
{: .medcom-governance-rules}