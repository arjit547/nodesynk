#!/bin/bash

if [ "$DEPLOYMENT_GROUP_NAME" == "test-frontend-1" ]; then
    if [ -e /home/my-temp-dir/.env ]; then
        echo "Waiting for 2 minutes...."
        sleep 120
        cp -R /home/my-temp-dir/. /var/www/html
        rm -rf /home/my-temp-dir
        chown -R ubuntu:ubuntu /var/www/html
        cd /var/www/html
        npm install

        # Run npm build and check its exit code
        npm run build

        if [ $? -ne 0 ]; then
            echo "Error: npm run build failed."
        fi
    else
        cp -R /home/my-temp-dir/. /var/www/html
        rm -rf /home/my-temp-dir
        chown -R ubuntu:ubuntu /var/www/html
        cd /var/www/html
        npm install

        # Run npm build and check its exit code
        npm run build

        if [ $? -ne 0 ]; then
            echo "Error: npm run build failed."
        fi
    fi
fi
