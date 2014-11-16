#!/bin/sh
# Uses the -U $DBUSER -h $DBHOST -d $DBNAME environment variables.

(
  # \COPY opendata_projects FROM PSTDIN WITH CSV HEADER
  cat opendata_projects.csv
  echo '\.'

  # \COPY opendata_resources FROM PSTDIN WITH CSV HEADER
  cat opendata_resources.csv
  echo '\.'

  # \COPY opendata_essays FROM PSTDIN WITH CSV HEADER
  cat opendata_essays.csv
  echo '\.'

  # \COPY opendata_donations FROM PSTDIN WITH CSV HEADER
  cat opendata_donations.csv
  echo '\.'

  # \COPY opendata_giftcards FROM PSTDIN WITH CSV HEADER
  cat opendata_giftcards.csv
  echo '\.'
) \
| psql -U postgres -d donors -f donorschoose-load-script.sql
