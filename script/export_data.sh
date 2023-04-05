#!/bin/bash
############################
### LUIS  GARCIA GARCES
### UNIVERSIDAD INTERNACIONAL DE LA RIOJA
############################
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
echo "Exporting data from containers: $MYSQL_CONTAINER_NAME and $DRUPAL_CONTAINER_NAME"
docker cp $MYSQL_CONTAINER_NAME:$MYSQL_CONTAINER_PATH/. $LOCAL_MYSQL_DATA_PATH
docker cp $DRUPAL_CONTAINER_NAME:$DRUPAL_CONTAINER_PATH/. $LOCAL_DRUPAL_DATA_PATH
echo "Creating ./exported_data.tar.gz files"
tar -zcvf ./exported_data.tar.gz $LOCAL_MYSQL_DATA_PATH $LOCAL_DRUPAL_DATA_PATH

rm -rf $LOCAL_MYSQL_DATA_PATH
rm -rf $LOCAL_DRUPAL_DATA_PATH
echo "Job done!" 
