# Namespace model

Each team gets a namespace that is **budgeted** and **attributable** by construction.

## What a governed namespace contains

| Object | Purpose |
|---|---|
| `Namespace` | Carries `team`, `cost-center`, `environment` labels for showback |
| `ResourceQuota` | Caps aggregate requests/limits, pod count, and PVCs — the namespace budget |
| `LimitRange` | Sets per-container default requests/limits and a ceiling |
| `NetworkPolicy` (default-deny ingress) | Safe baseline; teams open only what they need |

## Why a quota *and* a limit range

- The **ResourceQuota** bounds the whole namespace — its total cost ceiling.
- The **LimitRange** fixes individual pods: it supplies defaults (so unspecified pods are not
  rejected by the quota) and a per-container maximum (so one pod cannot eat the namespace).

Together they make cost predictable: a namespace cannot exceed its quota, and no single workload
can starve its neighbours.

## Attribution

The `team` / `cost-center` / `environment` labels are the join key between Kubernetes usage
(via OpenCost/Kubecost) and AWS billing analytics. Keeping them identical to the AWS-side tags
means one mental model for cost across the platform.
