#!/bin/bash
set -e

AUTH=$(echo "$ARTIFACTORY_USERNAME:$ARTIFACTORY_PASSWORD" | openssl base64)

SCOPE=crunchbase
REGISTRY=http://artifactory5.crunchbase.io/artifactory/api/npm/npm-local/

cat >> ~/.npmrc <<EOF
_auth = ${AUTH}
email = ci@crunchbase.com
always-auth = true
EOF

npm publish --registry http://artifactory5.crunchbase.io/artifactory/api/npm/npm-local/
