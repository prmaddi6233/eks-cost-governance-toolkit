# Governance policy catalog

Policy-as-code guardrails implemented as Kyverno `ClusterPolicy` objects in
[`../policies/kyverno/`](../policies/kyverno/). They move the "boring, correct defaults" from
tribal knowledge into admission control.

| Policy | Action | What it prevents |
|---|---|---|
| `require-resource-requests-limits` | Enforce | Unbounded pods → noisy neighbours, unpredictable cost |
| `disallow-latest-tag` | Enforce | Mutable `:latest` images → non-reproducible rollouts |
| `require-cost-labels` | Enforce | Unattributable namespaces and workloads |
| `require-probes` | Audit | Traffic to unhealthy pods → wasted capacity, bad UX |

## Enforce vs. Audit

- **Enforce** blocks the request at admission. Used where the default is unambiguously correct
  (limits, image tags, cost labels).
- **Audit** records a policy report without blocking. Used to roll out a policy (`require-probes`)
  before flipping it to Enforce, so teams can remediate first.

## Rollout approach

1. Ship a new policy as `Audit`.
2. Watch policy reports for violations; help teams fix them.
3. Flip to `Enforce` once the violation count is near zero.

This staged approach is how you add guardrails to a live multi-tenant cluster without breaking
existing workloads.
