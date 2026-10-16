# coco-de-guide

Project plugin for the CoCo Desktop data engineering guide (dbt on TPCH sample data, built into `DEMO_DB.TPCH_TRANSFORMED`).

It includes:

- **Skills** (`./skills`) — workflows such as creating new dbt models that follow the project conventions: `dbt build`, primary key tests in `_schema.yml`, and `source()` references to raw tables.
- **Agents** (`./agents`) — subagents the main agent can delegate dbt and data engineering work to.
- **Hooks** (`./hooks/hooks.json`) — commands that run automatically around tool calls to enforce project rules.
