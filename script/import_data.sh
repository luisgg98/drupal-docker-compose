#!/bin/bash
############################
### LUIS  GARCIA GARCES
### UNIVERSIDAD INTERNACIONAL DE LA RIOJA
############################
importing_data_file=$1
# Set variables
MYSQL_CONTAINER_NAME="mysql-database"
DRUPAL_CONTAINER_NAME="drupal-frontend"
MYSQL_CONTAINER_PATH="/var/lib/mysql"
DRUPAL_CONTAINER_PATH="/var/www/html"
LOCAL_MYSQL_DATA_PATH="./mysql_data/"
LOCAL_DRUPAL_DATA_PATH="./drupal_data/"
# Create a temporary directory
mkdir -p $LOCAL_MYSQL_DATA_PATH $LOCAL_DRUPAL_DATA_PATH 
# Copy data from existing containers to local paths

echo "Extracting  $importing_data_file files"
tar -xvzf  $importing_data_file


#docker cp foo.txt container_id:/foo.txt

echo "Import data from host to containers: $MYSQL_CONTAINER_NAME and $DRUPAL_CONTAINER_NAME"
docker cp $LOCAL_MYSQL_DATA_PATH $MYSQL_CONTAINER_NAME:$MYSQL_CONTAINER_PATH/. 
docker cp $LOCAL_DRUPAL_DATA_PATH $DRUPAL_CONTAINER_NAME:$DRUPAL_CONTAINER_PATH/. 


rm -rf $LOCAL_MYSQL_DATA_PATH
rm -rf $LOCAL_DRUPAL_DATA_PATH
echo "Job done!" 