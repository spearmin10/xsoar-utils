#!/bin/sh

if [ $# -ge 2 ]; then
  echo >&2 "Usage: $(basename $0) backup_file"
  exit 1
fi

GIT_API_TOKEN=xxxxxxxxxxx
GIT_OWNER=owner
GIT_REPOSITORY=rep_name
GIT_BACKUP_FILE=dw-backup.tar.bz2
LOCAL_BACKUP_FILE=$1

FILE_SHA=`curl -X GET -H "Authorization: token ${GIT_API_TOKEN}" https://api.github.com/repos/${GIT_OWNER}/${GIT_REPOSITORY}/contents/ | jq --arg fname $GIT_BACKUP_FILE '.[] | select(.name == $fname) | .sha'`
FILE_SHA=`eval echo "${FILE_SHA}"`

echo "{\
 \"message\": \"update\",\
 \"content\": \"$(base64 "${LOCAL_BACKUP_FILE}" | tr -d '\n')\",\
 \"branch\": \"master\",\
 \"sha\": \"${FILE_SHA}\"\
}" | curl -i -X PUT -H "Authorization: token ${GIT_API_TOKEN}" -d @- https://api.github.com/repos/${GIT_OWNER}/${GIT_REPOSITORY}/contents/${GIT_BACKUP_FILE}
