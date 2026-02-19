# dbt Experimental Project

This directory contains the primary dbt project. It is configured to use **DuckDB** as a local analytical engine.

## dbt Configuration

### Profile Setup
Before running dbt commands, ensure you have a `profiles.yml` file in this directory:

```bash
cp profiles.yml.example profiles.yml
```

The configuration is set to persist data in a local `experiment.duckdb` file within this directory.

## Project Architecture

The project follows a modular design pattern to ensure scalability and clarity:

- **Seeds**: Located in `seeds/`, these files represent static raw data inputs used for prototyping.
- **Staging Layer**: Residing in `models/staging/`, these models are responsible for the initial cleaning and normalization of raw source data.
- **Source Specifications**: `models/staging/src_main.yml` defines the upstream source properties.
- **Generic Tests**: Defined in `models/staging/schema.yml` to enforce data integrity (uniqueness, null checks).
- **Singular Tests**: Custom SQL validation scripts located in `tests/`.

## Development Lifecycle

Run these commands from within the `experiment/` directory:

### 1. Data Ingestion
Populate the local database with raw source data:
```bash
dbt seed
```

### 2. Model Transformation
Execute the SQL models to apply transformations:
```bash
dbt run
```

### 3. Quality Assurance
Validate data integrity by executing the project's test suite:
```bash
dbt test
```

### 4. Utility Commands
- **Compile**: `dbt compile` to inspect generated SQL.
- **Debug**: `dbt debug` to verify the connection.
- **Clean**: `dbt clean` to remove build artifacts.

> [!IMPORTANT]
> **Data Privacy Note:** The CSV files in `seeds/` are sample data. Real PII should **never** be tracked in Git.
