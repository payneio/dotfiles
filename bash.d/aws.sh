#!/bin/bash

aws_file="$HOME/.aws/credentials"
if hash aws 2>/dev/null && [ -f $aws_file ]; then
  export AWS_ACCESS_KEY_ID=$(sed -n -e 's/aws_access_key_id = //p' < ~/.aws/credentials)
  export AWS_SECRET_ACCESS_KEY=$(sed -n -e 's/aws_secret_access_key = //p' < ~/.aws/credentials)
  echo "aws ready. AWS_ACCESS_KEY_ID set: $AWS_ACCESS_KEY_ID"
fi
