- Removed **‘correction’** from the description of the element *role* to align with the definition in *CareCommunicationProvenance*.  

- Clarified documentation for **Provenance.entity[preceedingMessage].what.reference**: the reference must point to the *MessageHeader/id* of the preceding message.  

- Moved profiles **MedComMessagingMessageDefinition** and **MedComMessagingMessageDefinitionFhir** to their own Implementation Guide.  

- **Dependencies** tab in the menu bar is added.  

- The following **cardinalities**, **MustSupport**, and **Obligation (SHALL:in-narrative)** have been added:  

  - **Profile: MedComMessagingMessageHeader**  
    - MustSupport + Obligation (SHALL:in-narrative): `event[x].code`, `destination:primary.extension:use.value[x].code`, `destination:cc.extension:use.value[x].code`  
    - MustSupport: `id`, `text.status`, `text.div`, `destination`, `destination:primary`, `destination:primary.extension:use.url`, `destination:primary.extension:use.value[x]`, `destination:primary.extension:use.value[x].system`, `destination:cc`, `destination:cc.extension:use.url`, `destination:cc.extension:use.value[x]`, `destination:cc.extension:use.value[x].system`  
    - Cardinality 1..1: `text.status`, `text.div`  
    - Obligation (SHALL:in-narrative):, `destination:primary.endpoint`, `destination:primary.receiver`, `destination:cc.endpoint`, `destination:cc.receiver`, `sender`, `source.endpoint`

  - **Profile: MedComMessagingOrganization**  
    - MustSupport + Obligation (SHALL:in-narrative): `id`  
    - MustSupport: `text.status`, `text.div`  
    - Cardinality 1..1: `text.status`, `text.div`  
    - Obligation (SHALL:in-narrative):, `identifier:EAN-ID`, `identifier:SOR-ID`, `name`  

  - **Profile: MedComMessagingProvenance**  
    - MustSupport + Obligation (SHALL:in-narrative): `id`  
    - MustSupport: `text.status`, `text.div`, `occurred[x]`, `activity.coding.system`
    - Cardinality 1..1: `text.status`, `text.div`, `activity.coding`, `activity.coding.system`
    - Obligation (SHALL:in-narrative): `target`, `occurred[x]:occurredDateTime`, `activity.coding.code`, `agent.who`, `entity.role`, `entity.what.reference`, `entity.what.identifier`  
