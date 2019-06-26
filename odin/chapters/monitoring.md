# Monitoring

Monitoring is vital to software quality. In order to maximize quality, it is important to define what it is in terms of measurable variables. Then, we need to deal with the challenge of measuring on the open internet. Each of the many machines is a possible sensor, ingestion and aggregation becomes expensive fast. Each such machine should also be recognized as potentially malicious, further increasing complexity and costs. Here we will describe answers to the challenges posed here.

## Software quality

- Number of nodes reporting (un)healthy
- Interactive latency
- Replication delay distribution
    - vs topic popularity
- Replication redundancy
- Network utilisation
    - MTU fitting for non-interactive
    - Relaying
        - Total traffic
        - Relative to traffic
    - Replication
        - Redundant
        - Total
- Query response time
- Query result ordering quality (result ranking vs. click order)

### Technical statistics
- Partitions
- Storage redundancy
- Neighbourhood size
- Neighbourhood dynamics
    - Disconnects
    - Dropped
    - Joins
    - Pairings
- Interactive session size distribution

## Measuring

## Aggregating

## Security
