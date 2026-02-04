#!/usr/bin/env bash
# After-plan hook: fails the run if the workspace name is not "VCS".
# Use as "After plan" hook in Scalr. Only runs in workspace named "VCS" succeed.

set -e

# Scalr / TFC-style env vars (adjust if your platform uses a different name)
SCALR_WORKSPACE_NAME="${SCALR_WORKSPACE_NAME:-${TFC_WORKSPACE_NAME:-${WORKSPACE_NAME:-}}}"

if [ -z "$SCALR_WORKSPACE_NAME" ]; then
  echo "After-plan hook failed: could not determine workspace name (set SCALR_WORKSPACE_NAME or equivalent)."
  exit 1
fi

if [ "$SCALR_WORKSPACE_NAME" != "VCS" ]; then
  echo "After-plan hook failed: this hook only allows workspace named \"VCS\". Current workspace: \"$SCALR_WORKSPACE_NAME\"."
  exit 1
fi

exit 0
