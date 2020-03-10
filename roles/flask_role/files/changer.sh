#!/bin/bash
DSN=`cat file_with_dsn`
sudo sed "s,\dsn..*,\dsn="$DSN",g" -i .env

