# AGENTS.md

Guidance for AI agents working in this repository.

## Snowflake Environment

| Setting   | Value              |
|-----------|--------------------|
| Database  | `DEMO_DB`          |
| Schema    | `TPCH_TRANSFORMED` |
| Warehouse | `DEMO_WH`          |

## dbt Commands

Run all commands from the repository root.

- Build the full project:
  ```
  dbt build --project-dir dbt/
  ```
- Build a single model:
  ```
  dbt build --select <model_name> --project-dir dbt/
  ```

## Conventions

- **Model file naming:** use `snake_case` for all model files (e.g. `stg_orders.sql`, `fct_order_items.sql`).
- **Source data:** raw data comes from `SNOWFLAKE_SAMPLE_DATA.TPCH_SF1`. All raw tables must be referenced through `_sources.yml` using `{{ source(...) }}` — never hardcode raw table names in models.

## Git Workflow

- Feature branches must follow the pattern: `feature/<description>`
- Pull requests are required before merging to `main`; do not push directly to `main`.

## Tooling

- This project uses **CoCo Desktop**. Do **not** use the `cortex` CLI command.
