# Blackbox

---

Blackbox is the codename of micro-framework, built on Bash, and uses to
evaluate devops questions within completely new, clean, environment
(thanks to Docker).

The blackbox unit is "module". Module is the completed implementation
for the concrete technology (for example "ansible", "docker" etc).

Each module contains two actions:
- setup: this action triggers on "setup" flow of hackerrank and using to
  prepare a sandbox for the person, who makes a test
- check: this action triggers on "check" flow of hackerrank and using to
  evaluate "closed" test, calculate score and make the result

## Setup action

This action contains the next steps:
- provision: this step is using to make a provision within the setup
  action, usually it installs the technology stack and perform some
  preparation tasks

Also, might have "rootfs" folder with structure equals to the linux
filesystem as the source of file exchange in action flow (for example,
if some file should be installed)

There is a method to install a folder in blackbox:
`blackbox.framework.inventory.install.directory DESTINATION OWNER=ubuntu
GROUP=ubuntu`

for example, this will create a new directory at a path:
`blackbox.framework.inventory.install.directory /path/to/new/directory`

and this will do the same, but sets owner/group as "root:root":
`blackbox.framework.inventory.install.directory /path/to/new/directory 0 0`

There is a method to install a file in blackbox: `cat /path/to/file |
blackbox.framework.inventory.install.file DESTINATION OWNER=ubuntu GROUP=ubuntu`

for example, this will install a file at a path:
`blackbox.framework.inventory.install.file /path/to/destination/file
</path/to/source/file`

and this will create an empty file: `blackbox.framework.inventory.install.file
/path/to/destination/file </dev/null`

and this will do the same, but sets owner/group as "root:root":
`blackbox.framework.inventory.install.file /path/to/destination/file 0 0
</dev/null`

### Provision step hooks

```
:'
  Does something on provision step
'
BLACKBOX_PROVISION_WITH_OPTS() {
  return
}
```

### Example of usage (setup.sh)

```
#!/usr/bin/env bash
:'
  Does something on provision step
'
BLACKBOX_PROVISION_WITH_OPTS() {
  return
}

# shellcheck disable=SC1090
. <(cat /blackbox/blackbox 2>/dev/null || wget -qO- --no-cache "https://raw.githubusercontent.com/ProblemSetters/devops-blackbox/master/blackbox" || printf "echo 'error: *** blackbox is not available'; exit 1") MODULE_NAME setup "QUESTION_GIT_REPOSITORY_NAME"

# something to execute in post-provision step might be here

exit 0
```

## Check action

This action contains the next steps:
- provision: this step uses to make a provision within the check action,
  usually it installs the remains of technology stack to perform some
  preparation tasks
- build: this step uses to:
  - build a new spawn (docker container, ready-to-use, ubuntu-based
    world, to perform the evaluation in)
  - build a user solution (solved question) to prepare to evaluate
- evaluate: this step uses to make the evaluation of user solved
  question, calculate score and output the results

### Provision step hooks

```
:'
  Does something on provision step
'
BLACKBOX_PROVISION_WITH_OPTS() {
  return
}
```

### Build step hooks

```
:'
  Does something on build step (right after solution builds)
'
BLACKBOX_BUILD_WITH_OPTS() {
  return
}
```

### Example of usage (check.sh)

```
#!/usr/bin/env bash
cat <<<"Partial Credit: 0"

:'
  Does something on provision step
'
BLACKBOX_PROVISION_WITH_OPTS() {
  return
}

:'
  Does something on build step (right after solution builds)
'
BLACKBOX_BUILD_WITH_OPTS() {
  return
}

. /blackbox/blackbox MODULE_NAME check "QUESTION_GIT_REPOSITORY_NAME"

:'
  Gathers an artifacts list to collection, each of artifact should be the valid linux command, for example: whoami
'
cat <<COLLECTION | blackbox.expect.artifact.collection
cat playbook.yml
COLLECTION

:'
  Checks if file exists

  int|string "score" - Integer if manual score (100 is maximum), "-" to skip score calculation, "%" to automatic score calculation (round-weighted)
  ?string "assert_true_message" - Assert "true" message with "printf" support, default argument is "/path/to/file/to/check", if empty -- assert sentence will be used as message
  ?string "assert_false_message" - Assert "false" message with "printf" support, default argument is "/path/to/file/to/check", if empty -- assert sentence will be used as message
  ...string "printf_args" - List of arguments to pass to printf "assert" messages
'
cat <<ASSERT | blackbox.expect.file.exists 10 "assert true message" "assert false message"
/path/to/file/to/check
ASSERT

:'
  Debugs an assert within shell
'
cat <<ASSERT | blackbox.expect.shell.debug
command_to_debug
ASSERT

:'
  Checks for zero exit code

  int|string "score" - Integer if manual score (100 is maximum), "-" to skip score calculation, "%" to automatic score calculation (round-weighted)
  ?string "assert_true_message" - Assert "true" message with "printf" support, default argument is "/path/to/file/to/check", if empty -- assert sentence will be used as message
  ?string "assert_false_message" - Assert "false" message with "printf" support, default argument is "/path/to/file/to/check", if empty -- assert sentence will be used as message
  ...string "printf_args" - List of arguments to pass to printf "assert" messages
'
cat <<ASSERT | blackbox.expect.shell.success - "assert true message" "assert false message"
command_should_success
ASSERT

:'
  Checks for non-zero exit code

  int|string "score" - Integer if manual score (100 is maximum), "-" to skip score calculation, "%" to automatic score calculation (round-weighted)
  ?string "assert_true_message" - Assert "true" message with "printf" support, default argument is "/path/to/file/to/check", if empty -- assert sentence will be used as message
  ?string "assert_false_message" - Assert "false" message with "printf" support, default argument is "/path/to/file/to/check", if empty -- assert sentence will be used as message
  ...string "printf_args" - List of arguments to pass to printf "assert" messages
'
cat <<ASSERT | blackbox.expect.shell.failure 10 "assert true message" "assert false message"
command_should_fail
ASSERT

:'
  Checks for non-empty stdout

  int|string "score" - Integer if manual score (100 is maximum), "-" to skip score calculation, "%" to automatic score calculation (round-weighted)
  ?string "assert_true_message" - Assert "true" message with "printf" support, default argument is "/path/to/file/to/check", if empty -- assert sentence will be used as message
  ?string "assert_false_message" - Assert "false" message with "printf" support, default argument is "/path/to/file/to/check", if empty -- assert sentence will be used as message
  ...string "printf_args" - List of arguments to pass to printf "assert" messages
'
cat <<ASSERT | blackbox.expect.shell.stdout % "assert true message" "assert false message"
command_should_stdout_something
ASSERT

:'
  Checks for non-empty stderr

  int|string "score" - Integer if manual score (100 is maximum), "-" to skip score calculation, "%" to automatic score calculation (round-weighted)
  ?string "assert_true_message" - Assert "true" message with "printf" support, default argument is "/path/to/file/to/check", if empty -- assert sentence will be used as message
  ?string "assert_false_message" - Assert "false" message with "printf" support, default argument is "/path/to/file/to/check", if empty -- assert sentence will be used as message
  ...string "printf_args" - List of arguments to pass to printf "assert" messages
'
cat <<ASSERT | blackbox.expect.shell.stderr % "assert true message" "assert false message"
command_should_stderr_something
ASSERT

exit 0
```

## Development environment

GNU make is using as orchestrator and launcher to provide an ability to work on question development.

Possible targets are:
- debug: meta-target, adds useful debug information to the flow output
- all: alias for "uninstall install setup solve check", usually this is the targets chain is using to full-cycle of question development
- install: creates a question docker-based sandbox (equals to the hackerrank question sandbox), dedicated to particular question (one question = one sandbox)
- setup: executes "setup" action within recently created sandbox
- solve: solves the task
- check: executes "check" action within sandbox
- shell: opens bash shell to the question sandbox
- shell\:spawn: opens bash shell to the question sandbox spawn (where all the evaluation does)
- uninstall: removes the question sandbox
- prune: removes all the questions sandboxes in system, asks to prune all the docker images, containers, networks and volumes --  THIS ACTION CANNOT BE UNDONE
