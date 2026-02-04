#!/usr/bin/env bash
# After-plan hook: fails the run if the workspace Terraform template contains
#   resource "null_resource" "resourceHello" { count = 1 }
# Use this script as the "After plan" hook in Scalr workspace/environment policy.

set -e

# Check if any .tf file contains null_resource "resourceHello" and count = 1
for f in $(find . -maxdepth 3 -name '*.tf' 2>/dev/null); do
  if grep -q 'null_resource.*"resourceHello"' "$f" 2>/dev/null && \
     grep -q 'count\s*=\s*1' "$f" 2>/dev/null; then
    echo "After-plan hook failed: workspace template must not contain null_resource \"resourceHello\" with count = 1 (found in $f)."
    exit 1
  fi
done

exit 0
