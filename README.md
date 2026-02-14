# dbt Experiments Sandbox

This repository serves as a dedicated environment for exploring and implementing data transformation patterns using dbt (data build tool). The project is architected for local development.

## Architecture and Technology Stack

The project utilizes a serverless data stack designed for local execution:

*   **Transformation Layer:** [dbt-core](https://docs.getdbt.com/docs/introduction) (v1.11.5) provides the framework for modular SQL development, testing, and documentation.
*   **Database Engine:** [DuckDB](https://duckdb.org/) serves as the OLAP database. It is an in-process SQL engine that provides high-performance analytics without the overhead of a dedicated server.
*   **Database Management:** [Harlequin](https://harlequin.sh/) is integrated as a terminal-based SQL IDE, allowing for immediate inspection of transformed data and schema structures.
*   **Environment Management:** Python virtual environments ensure isolated and reproducible dependency management.

## Project Structure

The primary dbt project is located in the `experiment/` directory:

```text
experiment/
├── models/         # SQL models
├── seeds/          # Raw CSV data files
├── macros/         # Reusable Jinja logic
├── tests/          # Custom data quality tests
├── target/         # Compiled SQL and artifacts
├── profiles.yml    # Connection configuration for DuckDB
└── dbt_project.yml # Project-level configuration
```

## Getting Started

### Prerequisites

*   Python 3.10 or higher
*   Virtual environment module (`venv`)

### Installation and Setup

1.  **Initialize the Environment:**
    ```bash
    python3 -m venv venv
    source venv/bin/activate
    pip install -r requirements.txt
    ```

2.  **Verify the Connection:**
    Navigate to the project directory and test the dbt profile:
    ```bash
    cd experiment
    dbt debug --profiles-dir .
    ```

## Development Workflow

### Executing Transformations

To compile and execute the dbt models against the DuckDB database:
```bash
dbt run --profiles-dir .
```

### Data Quality Assurance

To execute the defined schema and data tests:
```bash
dbt test --profiles-dir .
```

### Database Inspection

To interactively query the DuckDB database and inspect the results of your models, use the Harlequin IDE:
```bash
harlequin experiment.duckdb
```

### Documentation

To generate and serve the project documentation and lineage graph:
```bash
dbt docs generate --profiles-dir .
dbt docs serve --profiles-dir .
```
