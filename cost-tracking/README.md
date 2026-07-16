# cost-tracking

The **measurement** layer: OpenCost turns the toolkit's cost labels into allocated dollars.

- [`opencost/`](opencost/) — OpenCost deployment configured for EKS with CUR-based net pricing.
- [`queries/`](queries/) — scripts that read the OpenCost `/allocation` API by namespace and team.

See [`../docs/cost-tracking.md`](../docs/cost-tracking.md) for the full flow, prerequisites, and
IAM permissions.
