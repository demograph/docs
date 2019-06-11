# Datastructures

This section describes the data-structures exposed by Odin.

## Requirements

- High availability
    - Can always read a local copy
    - Can always edit a copy, edits converge.
- Partial replication
    - Subset of the namespace
    - Projection of a topic
- Secure
    - Prevent impersonation
    - Enable privacy
- Incremental with very low latency, to enable
    - Real-time collaboration
    - Real-time dataflow
- Concurrent schema evolution

## Non-concurrent primitives

### Scalar
- bool
- unsigned int 8/16/32/64
- signed int 8/16/32/64
- fixed int 8/16/32/64
- float
- double

### Non-scalar
- bytes
- string

## Concurrent primitives

### Multi-value registers

### Sum types

### Product types

### Text

### Collections

#### Set

#### MultiSet / Bag

#### Matrices
- FindAll
- FindOne
- Exists
- ForAll

#### Trees

#### Maps

#### Heterogeneous Maps

#### Graphs
