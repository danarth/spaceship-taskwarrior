#!/usr/bin/env zsh

# Required for shunit2 to run correctly
CWD="${${(%):-%x}:A:h}"
setopt shwordsplit
SHUNIT_PARENT=$0

# Use system Spaceship or fallback to Spaceship Docker on CI
typeset -g SPACESHIP_ROOT="${SPACESHIP_ROOT:=/spaceship}"

# Mocked tool CLI
mock_task_count="12"
taskwarrior() {
  echo "$mock_task_count"
}

# ------------------------------------------------------------------------------
# SHUNIT2 HOOKS
# ------------------------------------------------------------------------------

setUp() {
  # Enter the test directory
  cd $SHUNIT_TMPDIR
}

oneTimeSetUp() {
  export TERM="xterm-256color"

  source "$SPACESHIP_ROOT/spaceship.zsh"
  source "$(dirname $CWD)/spaceship-section.plugin.zsh"

  SPACESHIP_PROMPT_ASYNC=false
  SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
  SPACESHIP_PROMPT_ADD_NEWLINE=false
  SPACESHIP_PROMPT_ORDER=(taskwarrior)

  echo "Spaceship version: $(spaceship --version)"
}

oneTimeTearDown() {
  unset SPACESHIP_PROMPT_ASYNC
  unset SPACESHIP_PROMPT_FIRST_PREFIX_SHOW
  unset SPACESHIP_PROMPT_ADD_NEWLINE
  unset SPACESHIP_PROMPT_ORDER
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_mock_task_count() {
  # Prepare the environment
  touch $SHUNIT_TMPDIR/test.foo

  local prefix="%{%B%}$SPACESHIP_TASKWARRIOR_PREFIX%{%b%}"
  local content="%{%B%F{$SPACESHIP_TASKWARRIOR_COLOR}%}$SPACESHIP_TASKWARRIOR_SYMBOL$mock_task_count%{%b%f%}"
  local suffix="%{%B%}$SPACESHIP_TASKWARRIOR_SUFFIX%{%b%}"

  local expected="$prefix$content$suffix"
  local actual="$(spaceship::testkit::render_prompt)"

  assertEquals "render mocked task count" "$expected" "$actual"
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source "$SPACESHIP_ROOT/tests/shunit2/shunit2"
