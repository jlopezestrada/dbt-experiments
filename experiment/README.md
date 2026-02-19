# dbt Experimental Environment

This repository serves as a sandbox for the research and development of dbt (data build tool) transformation patterns. The environment utilizes DuckDB as a high-performance, local analytical engine, enabling rapid experimentation without the overhead of a cloud-based data warehouse.

## Setup and Configuration

### 1. Environment Initialization
Before proceeding, ensure that a Python virtual environment is active and all necessary dependencies are installed from the project root:

```bash
# Execute from the project root
python -m venv venv
source venv/bin/activate  # Or venv\Scripts\activate on Windows
pip install -r requirements.txt
```

### 2. Profile Configuration
dbt requires a connection profile to interface with the local database. A template is provided within this directory for initialization:

```bash
cp profiles.yml.example profiles.yml
```

The default configuration is optimized for local development, persisting data to a local `experiment.duckdb` file.

## Development Lifecycle

To execute the standard data transformation pipeline, follow the sequence below:

### Data Ingestion (Seeding)
Populate the local database with raw source data defined in the `seeds/` directory:
```bash
dbt seed
```

### Model Transformation
Execute the SQL models to apply transformations and build the defined datasets:
```bash
dbt run
```

### Quality Assurance
Validate data integrity and transformation logic by executing the project's test suite:
```bash
dbt test
```

## Project Architecture

The project follows a modular design pattern to ensure scalability and clarity:

- **Seeds**: Located in `seeds/`, these files represent static raw data inputs used for prototyping and testing.
- **Staging Layer**: Residing in `models/staging/`, these models are responsible for the initial cleaning, normalization, and standardization of raw source data.
- **Source Specifications**: `models/staging/src_main.yml` defines the upstream source properties and enforces foundational data quality constraints such as uniqueness and non-nullity.
- **Macros and Tests**: Placeholder directories are provided for reusable SQL logic and custom validation scripts respectively.

## Administrative Commands

- **Compilation**: Use `dbt compile` to inspect the generated SQL without executing it against the database.
- **Documentation**: Execute `dbt docs generate && dbt docs serve` to produce and view the interactive documentation and lineage graph.
- **Cleanup**: Use `dbt clean` to remove build artifacts and transient files.

## References

- [Official dbt Documentation](https://docs.getdbt.com/)
- [dbt-duckdb Adapter Specification](https://github.com/jwills/dbt-duckdb)
- [dbt Project Structuring Best Practices](https://docs.getdbt.com/best-practices/how-we-structure/1-guide-overview)
