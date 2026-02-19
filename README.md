# dbt Experiments Sandbox

This repository serves as a dedicated environment for exploring and implementing data transformation patterns using dbt (data build tool). The project is architected for local development using a modern, serverless data stack.

## Architecture and Technology Stack

The project utilizes a serverless data stack designed for local execution:

*   **Transformation Layer:** [dbt-core](https://docs.getdbt.com/docs/introduction) (v1.11.5) provides the framework for modular SQL development, testing, and documentation.
*   **Database Engine:** [DuckDB](https://duckdb.org/) serves as the OLAP database. It is an in-process SQL engine that provides high-performance analytics without the overhead of a dedicated server.
*   **Database Management:** [Harlequin](https://harlequin.sh/) is integrated as a terminal-based SQL IDE, allowing for immediate inspection of transformed data and schema structures.
*   **Environment Management:** Python virtual environments ensure isolated and reproducible dependency management.

## Project Structure

```text
.
├── experiment/         # The primary dbt project directory
├── venv/               # Python virtual environment (local only)
├── requirements.txt    # Project dependencies
└── README.md           # Project overview
```

Detailed documentation for the dbt models and workflow can be found in the [experiment/ directory](./experiment/README.md).

## Getting Started

### Prerequisites

*   Python 3.10 or higher
*   Virtual environment module (`venv`)

### Installation and Setup

1.  **Initialize the Environment:**
    Execute these commands from the project root:
    ```bash
    python3 -m venv venv
    source venv/bin/activate
    pip install -r requirements.txt
    ```

2.  **Navigate to the dbt Project:**
    All dbt operations should be performed within the `experiment` directory:
    ```bash
    cd experiment
    ```

## External Tools

### Database Inspection

To interactively query the DuckDB database and inspect the results of your models, use the Harlequin IDE from the project root (after running dbt models):
```bash
harlequin experiment/experiment.duckdb
```

### Documentation

To view the interactive documentation and lineage graph:
1. Generate the docs: `cd experiment && dbt docs generate`
2. Serve the docs: `dbt docs serve`
