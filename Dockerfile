FROM python:3.9-slim-buster

# Install development tools and dependencies
RUN apt-get update && \
    apt-get install -y gcc libpq-dev python3-dev vim && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Update setuptools and wheel
RUN pip install --upgrade setuptools wheel elementary-data

# Install psycopg2-binary, dbt and great_expectations
RUN pip install psycopg2-binary dbt-core dbt-postgres sqlalchemy

# Create directory for dbt configuration
RUN mkdir -p /root/.dbt

COPY dbt_project/profiles.yml /root/.dbt/profiles.yml

# Copy the entry script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Entry point
ENTRYPOINT ["/entrypoint.sh"]
