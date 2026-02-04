#!/usr/bin/env bash
# General post-plan hook: always fails the run.
# Use this script as the "After plan" hook in Scalr workspace/environment policy
# when you need to intentionally fail every plan (e.g. for testing or gating).

set -e

echo "Post-apply hook: run failed by design (general post-apply fail hook)."
exit 1
