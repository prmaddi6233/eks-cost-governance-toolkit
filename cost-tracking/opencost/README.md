# OpenCost integration

Deploys [OpenCost](https://www.opencost.io/) configured for EKS with **CUR-based net pricing**,
so Kubernetes cost allocation reflects real discounts (RIs, Savings Plans, Graviton).

| File | Purpose |
|---|---|
| `values.yaml` | Helm values for the `opencost/opencost` chart (external Prometheus, CUR mode, IRSA) |
| `cloud-integration.json` | AWS Athena/CUR integration config — mounted as the `cloud-integration` secret |
| `manifests/serviceaccount.yaml` | IRSA service account assuming the CUR-read IAM role |

Full install and query steps are in [`../../docs/cost-tracking.md`](../../docs/cost-tracking.md).

> All identifiers (`111111111111`, `REPLACE-*`) are placeholders — set them for your environment.
