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


# Misc.
$$
\require{AMScd}
\begin{CD}

(MV)Register    @<{min-size=1}<<    Option(TopK)\\
@A{max-size=1}AA                    @A{max-size=1(K)}AA\\
NonEmptyList    @<{min-size=1}<<    List              @<{ordering}<<   MultiSet / Bag\\
                @.                  @A{multiplicity}AA                 @A{multiplicity}AA \\
                @.                  OrderedSet        @<<{ordering}<   Set
\end{CD}
$$

- Sort
- Fold (Left/Right)
- Traverse


### Constraints
- `maxSize1` / `maxSizeN(n)`
- `minSize1` / `minSizeN(n)`
- `maxOccurrence1`  / `maxOccurenceN(n)`
- `ordered`

### Manipulations
- `insertValue(v)`
- `insertValueAtIndex(d, v)` (`prepend`, `append`)
- `insertKeyValue(k, v)`
- `deleteValue(v)`
- `deleteValueAtIndex(d)`
- `deleteKey(k)`
- `replaceValue(v_old, v_new)`
- `replaceValueAtIndex(d, v)`
- `replaceValueAtKey(k, v)`
- `swapValues(v1, v2)`
- `swapValuesByIndex(d1, d2)`
- `swapValuesByKey(k1, k2)`

### Constraint conflicts

- constraint `maxSize`, operation `insertX`
- constraint `minSize`, operation `deleteX`
- constraint `maxOccurrence`, operation `replace`

### Concurrent conflicts

#### Self-conflicting
- `insertValueAtIndex(d, v)`: resolve with arbitrary user-id ordering
- `insertKeyValue(k, v)`: resolve by merging the values or by lifting value to `MVRegister`
- `deleteValueAtIndex(d)`: past dependent: requires operational transform - solution: don't try to maintain history between arrays and lists
- `replaceValueAtIndex(d, v)`: resolve by merging values or by lifting value to `MVRegister`



#### Others
- `replaceValue(v_old, v_new)` Conflicts with constraint `maxSize` when its treshold has been reached and the same value is replaced concurrently with different values.

## Traits

- `Traverse` (Functor, Foldable)
- `Reduce`
- `Update[D]` (update a single element in the position with coordinates in dimension D)
- `Insert` (insertAt and derivatives: prepend, append)
- `Add` (add an element)
- `Delete` (delete an element by identity)