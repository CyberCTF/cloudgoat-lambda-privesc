#!/bin/sh
# The starting user's access key works (it authenticates as that user), and the scenario's roles exist.
set -eu
arn=$(env -u AWS_SESSION_TOKEN -u AWS_PROFILE -u AWS_CREDENTIAL_EXPIRATION \
  AWS_ACCESS_KEY_ID="$ISOLOOM_OUTPUT_ACCESS_KEY_ID" AWS_SECRET_ACCESS_KEY="$ISOLOOM_OUTPUT_SECRET_KEY" \
  aws sts get-caller-identity --query Arn --output text)
case "$arn" in */chris-*) ;; *) echo "the key authenticates as $arn" >&2; exit 1 ;; esac
aws iam get-role --role-name cg-lambdaManager-role-isoloom --query Role.Arn --output text >/dev/null
aws iam get-role --role-name cg-debug-role-isoloom --query Role.Arn --output text >/dev/null
