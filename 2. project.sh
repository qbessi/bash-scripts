#!/bin/bash

# Print a decorative header for the backup script
echo "  _ \    _ \    _ \       |  ____|   ___| __ __|"
echo " |   |  |   |  |   |      |  __|    |        |  "
echo " ___/   __ <   |   |  \   |  |      |        |  "
echo "_|     _| \_\ \___/  \___/  _____| \____|   _|  "
echo "--------------------------------------------------"
echo "Set and export environment variables for a project."
echo "--------------------------------------------------"

RED='\033[0;31m'

echo ""
echo "Set Project Name:"
read PROJECT_NAME

echo ""
echo "Set Project Path:"
read PROJECT_PATH

echo ""
echo "Set Database URL:"
read DATABASE_URL

echo ""
echo "Set API Key:"
read API_KEY

echo "Enviroment variables set for: $PROJECT_NAME"
echo "Project Path: $PROJET_PATH"
echo "Database URL: $DATABASE_URL"
echo "API Key: $API_KEY"

echo ""
echo "Do you want these variables added to your ~/.bashrc? (Yes/No)"
read ADDTO_BASHRC

if [[ "${ADDTO_BASHRC,,}" == "yes" ]]; then
    {
        echo "export PROJECT_NAME='$PROJECT_NAME'"
        echo "export PROJECT_PATH='$PROJECT_PATH'"
        echo "export DATABASE_URL='$DATABASE_URL'"
        echo "export APT_KEY='$API_KEY'"
    } >> ~/.bashrc
    echo "Variables added to ~/.bashrc. Run 'source ~/.bashrc' to apply changes"
else 
    echo "Varaibles not added to ~/.bashrc"
fi