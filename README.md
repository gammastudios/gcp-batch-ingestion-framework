
# Generic code with examples on ingesting data from multiple sources in to GCP
This code looks at a complete ingest pipeline all the way from capturing files/events 
(upload of files to Cloud Storage), to doing basic processing, error handling, logging and 
inserting in to bigquery. The example captures events from a bucket (object create) with 
Cloud Functions, triggers a DAG for basic scheduling in Composer, hands off to Dataflow for Transform and ultimately lands in BQ.

If something goes wrong, the function logs the results in Cloud Logging, for post analysis. 
Finally the data from the BigQuery can be visualized using DataStudio or a front end Web UI with 
API integration.
