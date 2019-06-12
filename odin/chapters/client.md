# (Client) interactions

We can imagine several types of interaction with an Odin node:

- **High level client**. Enables CRUD using REST+JSON, or GraphQL. Websocket with Reactive streams implementation for streaming
- **Node-like client**: UDP/Quic + Protobuf messages + Flatbuffers log deltas. Useful for external integrations that require low latency.
- **Native**: Rust functions to add new datastructures, or derive topics using embedded dataflow pipelines with minimal latency
- **'Serverless'**: Dataflow code is hosted inside Odin and compiled to WASM. WASM dataflows are deployed to WASM runtime. (Rationale for WASM: security through isolation, dataflow portability, dataflow deployment uniformity)

We can imagine an Odin node being deployed in one of several ways:

- Independent deployment (a process external to and independent of the client)
- Embedded deployment (Odin as library - interesting for native, low-latency interaction. Least flexible as it is tied to Rust)

## Architectural hints

```uml

package webapi {
    [RestApi]
    [GraphQLApi]
    [ReactiveWebsocketApi]
}

package node {
    [OdinNode]
}

package dataflow {
    [DataflowRuntime]
    [DataflowDefinitions]
}

database Datasource {
    [BaseData]
}

[WebClient] --> [RestApi]
[WebClient] --> [GraphQLApi]
[WebClient] --> [ReactiveWebsocketApi]

[RestApi] --> [OdinNode]
[GraphQLApi] --> [OdinNode]
[ReactiveWebsocketApi] --> [OdinNode]

[EmbeddedClient] -> [OdinNode]

[OdinNode] --> [BaseData] 
[DataflowRuntime] --> [BaseData] 
[DataflowRuntime] --> [DataflowDefinitions] 
[DataflowDefinitions] -> [BaseData]
```