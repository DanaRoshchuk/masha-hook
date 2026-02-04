#!/usr/bin/env bash
# Pre-plan hook: creates a variable and saves it to a file for the after-plan hook.
# Use as "Before plan" hook in Scalr. After-plan hook must validate this variable.

set -e

PRE_PLAN_VAR_FILE="${PRE_PLAN_VAR_FILE:-.pre_plan_variable}"

# Create variable: run id (timestamp + random suffix) so each run has a unique value
PLAN_RUN_ID="plan-$(date -u +%Y%m%d%H%M%S)-$$"
echo "$PLAN_RUN_ID" > "$PRE_PLAN_VAR_FILE"
echo "Pre-plan hook: created variable PLAN_RUN_ID=$PLAN_RUN_ID (saved to $PRE_PLAN_VAR_FILE)."
