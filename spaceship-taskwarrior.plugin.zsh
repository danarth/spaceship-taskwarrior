#
# Taskwarrior
#
# Taskwarrior is a really useful tool for managing to-do lists and projects on the command line.
# Link: https://taskwarrior.org

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_TASKWARRIOR_SHOW="${SPACESHIP_TASKWARRIOR_SHOW=true}"
SPACESHIP_TASKWARRIOR_ASYNC="${SPACESHIP_TASKWARRIOR_ASYNC=true}"
SPACESHIP_TASKWARRIOR_PREFIX="${SPACESHIP_TASKWARRIOR_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_TASKWARRIOR_SUFFIX="${SPACESHIP_TASKWARRIOR_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_TASKWARRIOR_SYMBOL="${SPACESHIP_TASKWARRIOR_SYMBOL="󰱒 "}"
SPACESHIP_TASKWARRIOR_COLOR="${SPACESHIP_TASKWARRIOR_COLOR="green"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show taskwarrior status
# spaceship_ prefix before section's name is required!
# Otherwise this section won't be loaded.
spaceship_taskwarrior() {
  # If SPACESHIP_TASKWARRIOR_SHOW is false, don't show taskwarrior section
  [[ $SPACESHIP_TASKWARRIOR_SHOW == false ]] && return

  # Check if task command is available for execution
  spaceship::exists task || return

  # Show taskwarrior section only when there are taskwarrior-specific files in current
  # working directory.

  local task_count="$(task status:pending count)"

  # Display taskwarrior section
  # spaceship::section utility composes sections. Flags are optional
  spaceship::section::v4 \
    --color "$SPACESHIP_TASKWARRIOR_COLOR" \
    --prefix "$SPACESHIP_TASKWARRIOR_PREFIX" \
    --suffix "$SPACESHIP_TASKWARRIOR_SUFFIX" \
    --symbol "$SPACESHIP_TASKWARRIOR_SYMBOL" \
    "$task_count"
}
