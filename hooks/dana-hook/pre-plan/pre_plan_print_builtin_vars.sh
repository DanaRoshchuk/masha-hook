# Use as a hook or run manually. Uses POSIX sh so it works when Scalr runs with sh.

set -e

echo "=== Built-in workspace environment variables ==="

# Scalr built-in env vars (see https://docs.scalr.io/docs/run-environment)
for var in \
  SCALR_RUN_ID \
  SCALR_TERRAFORM_OPERATION \
  SCALR_RUN_MODE \
  SCALR_RUN_IS_DESTROY \
  SCALR_WORKSPACE_NAME \
  SCALR_WORKSPACE_ID \
  SCALR_ENVIRONMENT_ID \
  SCALR_ENVIRONMENT_NAME \
  SCALR_RUN_VCS_BRANCH \
  SCALR_RUN_VCS_COMMIT \
  SCALR_HOSTNAME \
  SCALR_RUN_CONTENT_ROOT \
  SCALR_RUN_SOURCE \
  SCALR_TERRAFORM_EXIT_CODE
do
  eval "val=\${$var-(unset)}"
  printf '%s=%s\n' "$var" "$val"
done
