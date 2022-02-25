
  
#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
  CREATE DATABASE client_funds_development;
  CREATE DATABASE client_funds_test;
EOSQL
