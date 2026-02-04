#!/usr/bin/env bash
# After-plan hook: verifies SCALR_WORKSPACE_NAME starts with "DEV-".
# Uses built-in env vars (same as print_builtin_env.sh). Fails the run if check fails.
# Use as "After plan" hook in Scalr.

set -e

REQUIRED_PREFIX="DEV-"

if [[ -z "${SCALR_WORKSPACE_NAME+x}" ]]; then
  echo "After-plan hook failed: SCALR_WORKSPACE_NAME is not set."
  exit 1
fi

if [[ -z "$SCALR_WORKSPACE_NAME" ]]; then
  echo "After-plan hook failed: SCALR_WORKSPACE_NAME is empty."
  exit 1
fi

if [[ "$SCALR_WORKSPACE_NAME" != "$REQUIRED_PREFIX"* ]]; then
  echo "After-plan hook failed: SCALR_WORKSPACE_NAME must start with \"$REQUIRED_PREFIX\" (got: $SCALR_WORKSPACE_NAME)."
  exit 1
fi

echo "After-plan hook: SCALR_WORKSPACE_NAME verified (starts with $REQUIRED_PREFIX): $SCALR_WORKSPACE_NAME"
exit 0
