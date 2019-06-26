Requirements
============

## Functional requirements



## Non-functional requirements

### Availability

If your device is functional and has Odin installed, Odin should be available. By this we mean that any data locally stored is 100% accessible and modifiable within the authorization granted. No internet connection should be required. Certain more advanced features might be unavailable without internet connection. But, any of those should resume functioning once connectivity is restored.

### Consistency

Consistency in Odin has a subjective component: participants in Odin may choose to maintain different versions of an object with the same identifier. When participants make the same choices, Odin should guarantee eventual consistency up to causal consistency. When participants make different choices, Odin should guarantee the same for the fragments they have in common. Odin may offer stronger guarantees (transactions over Raft), at the cost of availability.

### Scalability

Odin offers primitives that enable collaboration between any number of participants, i.e. it scales to planetary scale for both reads and writes. To extend the use-cases for the infrastructure, certain less scalable mechanisms may be offered. Effort should be taken to make sure that these mechanisms are as fine-grained as they can be, to minimise their impact on scalability.

### Security

Odin is focused on enabling large-scale public interaction. As such, the primary security focus is protecting data integrity.

- Participants are allowed their own version of available data. Participants must have fine-grained control over what changes from other participants are incorporated. No other participant must be able to override this control.
- Document types that include the author(s) in their occurrences should make such provenance data verifiable. This prevents impersonation.

Although data-integrity of public interaction is the primary focus, Odin may offer some additional security mechanisms:

- Some public interactions benefit when anonymity is protected. Odin should incorporate mechanisms to protect anonymity, but not at the cost of data-integrity.
- Some interactions should constrain who participates and how. Certain documents should be readable or writable by many, but not all. For maximal utility, Odin should offer the ability to limit participation for certain objects in this way.

### Latency / Recency

Odin should deliver 100% availability of data previously downloaded. Data _not_ locally available should be prefetched with a priority that correlates with your interest. Odin should use heuristics to estimate interest. Such heuristics may include sources such as frequency of access, duration of activation, or responsiveness to change alerts.