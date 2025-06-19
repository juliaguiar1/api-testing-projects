#!/bin/bash
#Script to run Postman collection using Newman and generate reports

COLLECTION_PATH="../Postman/collections/Hunter_API_Resources.json"
ENVIRONMENT_PATH="../Postman/environments/environment_variables.json"
REPORT_PATH="newman/test-report.html"
DATA_FILE_PATH="scripts/data_file_runner.csv"
TEMPLATE_PATH="scripts/htmlreqres.hbs"

echo "Starting Newman execution..."

#Printing infos about the curreting running.
echo "Collection: $COLLECTION_PATH"
echo "Environment: $ENVIRONMENT_PATH"
echo "CSV File: $DATA_FILE_PATH"
echo "Report will be generated at: $REPORT_PATH"
echo "Using custom template: $TEMPLATE_PATH"

#Running Newman
newman run "$COLLECTION_PATH" -e "$ENVIRONMENT_PATH" -d "$DATA_FILE_PATH" \
  --reporters cli,html \
  --reporter-html-export "$REPORT_PATH" \
  --reporter-html-template "$TEMPLATE_PATH"

# Check if the execution was successful
if [ $? -eq 0 ]; then
    echo "Newman execution completed successfully!"
    echo "Report generated at: $REPORT_PATH"
else
    echo "Error during Newman execution."
    echo "Report generated at: $REPORT_PATH"
fi
