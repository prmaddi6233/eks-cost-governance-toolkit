# Contributing

Thanks for considering a contribution! This project welcomes issues, discussions, and pull requests.

## Quick Start

1. Fork the repo and create a feature branch from `main`
2. Make your changes
3. Run the CI checks locally (see below)
4. Open a pull request against `main`

## Reporting Issues

- **Bug reports:** include steps to reproduce, expected vs actual behavior, and relevant logs
- **Feature requests:** describe the use case and why existing functionality doesn't cover it
- **Questions:** open a Discussion instead of an Issue

## Pull Requests

- Keep PRs focused — one concern per PR
- Write a clear description: what changed, why, and how to verify
- Ensure CI passes before requesting review
- Follow existing code style and conventions

## Local Checks

Run the same checks CI runs before pushing:

```bash
# Markdown
npx markdownlint-cli2 "**/*.md"

# Terraform (if applicable)
terraform fmt -check -recursive
terraform validate

# Shell scripts (if applicable)
shellcheck scripts/*.sh

# SQL (if applicable)
sqlfluff lint sql/ --dialect athena

# YAML (if applicable)
yamllint .
```

## Code Style

- **Terraform:** `terraform fmt` standard, meaningful resource names, comments for non-obvious decisions
- **SQL:** uppercase keywords, one clause per line, comments explaining business logic
- **Shell:** shellcheck-clean, `set -euo pipefail`, quoted variables
- **Markdown:** pass markdownlint, ATX headings, one sentence per line in source

## Commit Messages

Use [Conventional Commits](https://www.conventionalcommits.org/) style:

```
feat: add month-over-month anomaly detection query
fix: correct partition filter in commitment coverage view
docs: add architecture decision record for data model
chore: update CI to pin sqlfluff version
```

## License

By contributing, you agree that your contributions will be licensed under the project's MIT License.
