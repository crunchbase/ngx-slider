#!/bin/bash
set -e

SCOPE="@crunchbase"
EMAIL="ci@crunchbase.com"
REGISTRY=http://artifactory5.crunchbase.io/artifactory/api/npm/npm-local/

AUTH=$(echo -n "$ARTIFACTORY_USERNAME:$ARTIFACTORY_PASSWORD" | openssl base64)
BASE64_PASSWORD=$(echo -n "$ARTIFACTORY_PASSWORD" | openssl base64)

# Yes, it needs both "global" auth and "scoped" auth
cat > ~/.npmrc <<EOF
_auth = ${AUTH}
email = ${EMAIL}
always-auth = true

${SCOPE}:registry=http://artifactory5.crunchbase.io/artifactory/api/npm/npm-local/
//artifactory5.crunchbase.io/artifactory/api/npm/npm-local/:_password=${BASE64_PASSWORD}
//artifactory5.crunchbase.io/artifactory/api/npm/npm-local/:username=${ARTIFACTORY_USERNAME}
//artifactory5.crunchbase.io/artifactory/api/npm/npm-local/:email=${EMAIL}
//artifactory5.crunchbase.io/artifactory/api/npm/npm-local/:always-auth=true
EOF

npm run build
cd dist/ng5-slider
npm publish --registry http://artifactory5.crunchbase.io/artifactory/api/npm/npm-local/

