#!/usr/bin/env sh
# After-plan hook: verifies SCALR_WORKSPACE_NAME starts with "DEV-".
# Uses built-in env vars (same as print_builtin_env.sh). Fails the run if check fails.
# Use as "After plan" hook in Scalr. Uses POSIX sh so it works when Scalr runs with sh.

set -e

REQUIRED_PREFIX="DEV-"

if [ -z "${SCALR_WORKSPACE_NAME}" ]; then
  echo "After-plan hook failed: SCALR_WORKSPACE_NAME is not set or empty."
  exit 1
fi

WS_NAME="$SCALR_WORKSPACE_NAME"

# Check prefix using case (POSIX, works in sh and bash)
case "$WS_NAME" in
  DEV-*)
    echo "After-plan hook: SCALR_WORKSPACE_NAME verified (starts with $REQUIRED_PREFIX): $WS_NAME"
    exit 0
    ;;
  *)
    echo "After-plan hook failed: SCALR_WORKSPACE_NAME must start with \"$REQUIRED_PREFIX\" (got: \"$WS_NAME\")."
    exit 1
    ;;
esac
