# #!/bin/bash

# if [ "$DEPLOYMENT_GROUP_NAME" == "arjit-group" ]; then
#     if [ -e /home/my-temp-dir/.env ]; then
#         echo "Waiting for 2 minutes...."
#         sleep 120
#         cp -R /home/my-temp-dir/. /var/www/html
#         rm -rf /home/my-temp-dir
#         chown -R ubuntu:ubuntu /var/www/html
#         cd /var/www/html
#         npm install
#         npm install -g pkg

#         # Run npm build and check its exit code
#         npm run build

#         if [ $? -ne 0 ]; then
#             echo "Error: npm run build failed."
#         fi
#     else
#         cp -R /home/my-temp-dir/. /var/www/html
#         rm -rf /home/my-temp-dir
#         chown -R ubuntu:ubuntu /var/www/html
#         cd /var/www/html
#         npm install

#         # Run npm build and check its exit code
#         npm run build

#         if [ $? -ne 0 ]; then
#             echo "Error: npm run build failed."
#         fi
#     fi
# fi




#!/bin/bash
set -e

if [ "$DEPLOYMENT_GROUP_NAME" == "testnode" ]; then

    echo "Deploying Node.js Backend..."

    cp -R /home/my-temp-dir/. /var/www/html
    rm -rf /home/my-temp-dir
    chown -R ubuntu:ubuntu /var/www/html

    cd /var/www/html
    npm install

    pm2 delete node-app || true
    pm2 start app.js --name node-app
    pm2 save

    systemctl reload nginx
    echo "Backend deployment completed."
fi
