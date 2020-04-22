#!/usr/bin/env bash

secret="AKIA$(seq -f "A" -s '' 16)"
output=$(mkdir /tmp/gitsecretstest && \
  cd /tmp/gitsecretstest && \
  git init && \
  echo $secret > secret.txt && \
  git add . && \
  git commit --allow-empty-message --no-edit 2>&1)

if [[ "$output" == *"ERROR"* ]]
then
  echo -e "✅ [42;37;1m  git-secrets check passed!  [0m"
else
  echo -e "🚨 [41;37;1m  git-secrets passed failed! Please debug this immediately.  [0m"
fi

rm -rf /tmp/gitsecretstest
