# Introduction

This Gitbook is a work-in-progress towards a complete specification of **Webmesh**.

## What is Webmesh and what is it not?

WebMesh has some overlap with service meshes such as `linkerd`, but also some notable differences. A service mesh is employed in a micro-service context. A micro-services architecture decomposes a system in lowly coupled services with an internally cohesive set of functionalities. A service mesh has two major responsibilities towards the services it hosts. It facilitates that services can resolve their service dependencies at runtime. It also facilitates reliable communication which may include retries and circuit-breaking functionality.

Like service meshes, Webmesh concerns itself with discovery and communication. The difference is in the operational context:

From the bottom, Webmesh operates on the public internet instead of a relatively controlled cluster (most commonly Kubernetes). Kubernetes clusters quite comfortably scale up to many thousands of nodes. The public internet however, hosts many millions of nodes. A difference of several orders of magnitude mandates some careful thought around the exact service Webmesh should deliver in comparison to what is delivered by service meshes. Besides the scale, connectivity itself is a concern. Whereas service instances in a cluster can connect unless explicitly restricted not to, computers on the internet more frequently than not find themselves behind midboxes limiting inbound connectivity. This introduces some unique puzzles that Webmesh is well positioned to solve.

From the top, Webmesh provides services towards peers in a peer-to-peer systems, rather than services in a micro-services architecture. The concept of peer is somewhat orthogonal to that of service. There are many types of peer to peer systems, and no exact definition of peer would be exhaustive. At one extreme, peers are like service-instances, as they only consitute a small fragment in a larger service. At the other end, peers outsize services in that a single peer may host multiple service (instance)s. Another distinction, which is more qualitative than absolute, is how often you find such systems organized in terms of interest. Service instances tend to not care about the slice of overall system responsibility they are assigned. Isolation tends to be valuable there because it reduces coordination and therefore minimises overhead. Peers however, are frequently found to represent the interests of the owners of the hosting machine. As such, in peer to peer systems, the overall interest and challenge is in having peers of one service communicate with each other, rather than facilitate inter-service discovery and communication.

> NOTE: On the public internet, service discovery is typically facilitated through URLs (identifying some service name and a version).  Whereas individual micro-service instances may have short livecycles, a public service as a whole has a long one. This holds both from a service-uptime perspective as the API implementation perspective. The wider audience of such a service necessitates this strategy to warrant the services' reliability. More advanced features such as retries and circuit-breakers could be useful on the public internet, but alone don't seem to necessitate an infrastructure.

## Use cases

Employ WebMesh when you want to run your own decentralized service on the public internet.

## Features

In current decentralized system design, each such system becomes responsible for maintaining connectivity. Two subproblems can be identified:

- The scale of planetary systems demands that peers are only partially connected. This introduces a challange: ensuring that partially connected nodes form a single collective whole, i.e. minimise the chance of partitioning with resource constrained devices
- Ensuring that any two nodes can communicate, whereas the actual network topology does not permit direct connectivity in many cases.

The two are somewhat related, which is why it makes sense to attack them in unison.

## Benefits

 - Minimise bootstrap rendez-vous nodes
 - Public service registry
