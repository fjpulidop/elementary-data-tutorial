#!/bin/bash

# Execute dbt
cd dbt_project/ && dbt deps
dbt run-operation elementary.generate_elementary_cli_profile
dbt run -m models/my_model.sql --target elementary
dbt run --select elementary
dbt run --vars "{'anomalies': True}"
dbt test --target elementary
dbt run --target elementary
edr report -t elementary

# Keep the container running
tail -f /dev/null
