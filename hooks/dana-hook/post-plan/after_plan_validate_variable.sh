#!/usr/bin/env bash
# After-plan hook: validates the variable created by the pre-plan hook and fails if invalid.
# Use as "After plan" hook in Scalr. Requires pre_plan_set_variable.sh as "Before plan" hook.

set -e

PRE_PLAN_VAR_FILE="${PRE_PLAN_VAR_FILE:-.pre_plan_variable}"

if [[ ! -f "$PRE_PLAN_VAR_FILE" ]]; then
  echo "After-plan hook failed: variable file not found ($PRE_PLAN_VAR_FILE). Pre-plan hook may not have run."
  exit 1
fi

VALUE=$(cat "$PRE_PLAN_VAR_FILE")
if [[ -z "$VALUE" ]]; then
  echo "After-plan hook failed: variable is empty in $PRE_PLAN_VAR_FILE."
  exit 1
fi

# Validate format: must start with "plan-" and contain only allowed chars
if [[ ! "$VALUE" =~ ^plan-[0-9]{14}-[0-9]+$ ]]; then
  echo "After-plan hook failed: variable has invalid format (expected plan-YYYYMMDDHHMMSS-PID, got: $VALUE)."
  exit 1
fi

echo "After-plan hook: variable validated successfully (PLAN_RUN_ID=$VALUE)."
exit 0
