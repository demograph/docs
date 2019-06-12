# Computational model

Odin provides a computational model to operate on the data stored in Odin. The main idea is that it enables you to operate directly on the incremental updates to the underlying datastructures and expose the results as incremental datastructures also.

## Requirements

- Expressive: Use a declarative mechanism to define high level operations on data. Paradigms: Functional Reactive Dataflow
- Extensible: It should be possible to add new datastructures and operations
- Efficient for non-interactive changes (changes that are not actively being observed) 
    - Batch: Non-interactive changes are batched to maximise throughput
    - Lazy: Non-interactive changes are lazily propagated to minimise work done
    - Maintenance schedule: To prevent long spikes in lazy loads, delta-size is tracked and used to periodically propagate the most pressing deltas
    - Multi-threaded: Dataflow is automatically cut up and scheduled over different threads. Cross-thread communication is non-blocking
    - Static dispatch: Parts of the computation that is scheduled to run on the same thread employs static dispatch
- Low latency for interactive changes. Query activition propagates backwards through its dataflow dependencies to configure a prioritized path.

## Functional Reactive Dataflow

In Odin's model, we may employ a SQL dialect to work with data. However, given the generality of the underlying datastructures, this isn't always the most expressive. We would like to enable better modularisation.

Each ORDT will have instances of at least some of these typeclasses, enabling some SQL-like functionality.

- Functor: Anything that can be projected (SELECT)
- Foldable: Anything that can be filtered (WHERE)
- Applicative: Anything that can be joined with an instance of its own type (JOIN)
- Traverse: Anything that is both a Functor and Foldable: (GROUP BY)
- Order: Anything that can be ordered (ORDER BY). Typically implemented by projection and relying on the natural/lexicographic ordering of that projection
- Monad: Anything that uses a form of embedding, whether directly in the datastructure (trees, graphs) or indirectly via references.
- ConsistentJoinSemilattice: A partially defined JoinSemilattice. It is defined whenever the two sides to be joined have a gapless history.