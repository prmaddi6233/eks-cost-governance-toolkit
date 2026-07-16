# Rightsizing and cost

Guardrails stop waste from entering; rightsizing removes waste already there.

## Signals to watch

| Signal | Meaning | Action |
|---|---|---|
| requests ≫ actual usage | Over-provisioned; quota consumed by idle headroom | Lower requests toward observed P95 |
| limits ≫ requests | Burst headroom cost; risk of noisy neighbours | Tighten limits; verify with load tests |
| Persistent unschedulable pods | Namespace quota too small, or cluster under-provisioned | Adjust quota or node groups |
| Low node bin-packing | Fragmentation; paying for idle nodes | Consolidate; consider Karpenter/consolidation |

## Approach

1. **Measure** with a metrics stack (Prometheus) and a Kubernetes cost tool (OpenCost/Kubecost)
   that reads the same `team` / `cost-center` labels used here.
2. **Recommend** rightsized requests/limits (e.g. from Vertical Pod Autoscaler in recommendation
   mode) rather than changing them blindly.
3. **Bound** with the `ResourceQuota` and `LimitRange` so a team cannot drift back into waste.
4. **Attribute** the result so savings are visible to the owning team, not just central platform.

## Node-level cost

Namespace guardrails control *demand*; node strategy controls *supply*. Pair this toolkit with a
consolidating autoscaler and Graviton/spot node groups where workloads tolerate them — the
biggest EKS savings usually come from better bin-packing, not smaller pods alone.
