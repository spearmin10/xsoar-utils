#!/bin/sh

GIT_API_TOKEN=xxxxxxxxxxx
GIT_OWNER=owner
GIT_REPOSITORY=rep_name
BACKUP_FILENAME=dw-backup.tar.bz2

echo "{\
 \"message\": \"update\",\
 \"content\": \"$(base64 "$1" | tr -d '\n')\",\
 \"branch\": \"master\",\
 \"sha\": $(curl -X GET -H "Authorization: token ${GIT_API_TOKEN}" https://api.github.com/repos/${GIT_OWNER}/${GIT_REPOSITORY}/contents/ | jq --arg fname $BACKUP_FILENAME '.[] | select(.name == $fname) | .sha')\
}" | curl -i -X PUT -H "Authorization: token ${GIT_API_TOKEN}" -d @- https://api.github.com/repos/${GIT_OWNER}/${GIT_REPOSITORY}/contents/${BACKUP_FILENAME}
