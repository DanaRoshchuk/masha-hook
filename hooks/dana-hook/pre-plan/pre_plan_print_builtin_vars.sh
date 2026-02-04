#!/usr/bin/env bash
# Prints built-in workspace environment variables (Scalr / Terraform) to console.
# Use as a hook or run manually to inspect run context.

set -e

# Scalr built-in env vars (see https://docs.scalr.io/docs/run-environment)
SCALR_BUILTIN_VARS=(
  SCALR_RUN_ID
  SCALR_TERRAFORM_OPERATION
  SCALR_RUN_MODE
  SCALR_RUN_IS_DESTROY
  SCALR_WORKSPACE_NAME
  SCALR_WORKSPACE_ID
  SCALR_ENVIRONMENT_ID
  SCALR_ENVIRONMENT_NAME
  SCALR_RUN_VCS_BRANCH
  SCALR_RUN_VCS_COMMIT
  SCALR_HOSTNAME
  SCALR_RUN_CONTENT_ROOT
  SCALR_RUN_SOURCE
  SCALR_TERRAFORM_EXIT_CODE
)

echo "=== Built-in workspace environment variables ==="
for var in "${SCALR_BUILTIN_VARS[@]}"; do
  if [[ -n "${!var+x}" ]]; then
    printf '%s=%s\n' "$var" "${!var}"
  else
    printf '%s=(unset)\n' "$var"
  fi
done
