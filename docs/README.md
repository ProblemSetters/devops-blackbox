# blackbox

https://github.com/ProblemSetters/devops-blackbox/blob/master/blackbox

## Overview

Blackbox evaluation framework

## Index

* [blackbox](#blackbox)
* [blackbox.framework.import](#blackboxframeworkimport)
* [blackbox.framework.trace](#blackboxframeworktrace)
* [blackbox.__init](#blackbox__init)

### blackbox

Main executable

#### Example

```bash
# Setup the "git" module question with the id "1234567-git-question-id"
/path/to/blackbox git setup "1234567-git-question-id"
# Evaluate the "git" module question with the id "1234567-git-question-id"
/path/to/blackbox git check "1234567-git-question-id"
```

#### Arguments

* **$1** (type=enum<ansible|aws|chef|docker|git|kubernetes|linux|puppet|shell|terraform>): Module name
* **$2** (type=enum<setup|check>): Action name
* **$3** (type=string): Question ID

#### Variables set

* **BLACKBOX_FLAG__DEBUG_MODE** (type=enum<yes|no>): Debug flag
* **BLACKBOX_FLAG__STEP_PROVISION** (type=enum<yes|no>): Provision step flag, indicates whether the "provision" step is included or excluded (for development process only)
* **BLACKBOX_FLAG__STEP_BUILD** (type=enum<yes|no>): Build step flag, indicates whether the "build" step is included or excluded (for development process only)
* **BLACKBOX_FLAG__STEP_EVALUATE** (type=enum<yes|no>): Evaluate step flag, indicates whether the "evaluate" step is included or excluded (for development process only)
* **BLACKBOX_PROVISION_WITH_OPTS** (type=function,default=auto): Provision hook definition, a function that implements an additional set of instructions that must be executed during the "provision" step
* **BLACKBOX_BUILD_WITH_OPTS** (type=function,default=auto): Build hook definition, a function that implements an additional set of instructions that must be executed during the "build" step
* **BLACKBOX_DIR** (readonly,type=string,default=auto): Path to the Blackbox installation directory (sets automatically, do not override)
* **BLACKBOX_SPAWN** (readonly,type=string,default=auto): Name of the docker container in which the question is being evaluated (sets automatically, do not override)
* **BLACKBOX_USER** (readonly,type=uid,default=auto): ID of the user in the docker container in which the question is being evaluated (sets automatically, do not override)
* **BLACKBOX_USER_NAME** (readonly,type=string,default=auto): Name of the user in the docker container in which the question is being evaluated (sets automatically, do not override)
* **BLACKBOX_USER_HOME** (readonly,type=path,default=auto): Path to the home directory of the user in the docker container in which the question is being evaluated (sets automatically, do not override)
* **BLACKBOX_USER_QUESTION_DIR** (readonly,type=path,default=auto): Path to the question directory in the docker container in which the question is being evaluated (sets automatically, do not override)
* **BLACKBOX_VERSION** (readonly,type=string,default=auto): [DEPRECATED] Version of the Blackbox to use (sets automatically, do not override)
* **BLACKBOX_HEAP_DIR** (readonly,type=path,default=auto): Path to the question "heap" directory, a place where question assets might be generated (sets automatically, do not override)
* **BLACKBOX_STORAGE_DIR** (readonly,type=path,default=auto): Path to the question "artifacts" directory, a place where question artifacts will be generated (sets automatically, do not override)
* **BLACKBOX_BUILD_LOG** (readonly,type=path,default=auto): Path to the build log (sets automatically, do not override)
* **BLACKBOX_BUILD_STREAM_DISPLAY_LINES** (readonly,type=integer,default=auto): Number of output lines before trim and ellipsis

#### See also

* [blackbox.__init](#blackbox__init)

## blackbox.framework.*

### blackbox.framework.import

#### Example

```bash
# Include a path as namespace, handles if file has "OOP encapsulation" instruction
blackbox.framework.import blackbox.framework.exception
# Include a path as namespace, handles if file has "OOP encapsulation" instruction with args
blackbox.framework.import "blackbox.module.git.setup.provision:step" "arg1" "arg2"
```

#### Arguments

* **$1** (type=string): Namespace to load
* **$2** (type=...mixed): Namespace args

### blackbox.framework.trace

#### Example

```bash
# Output the formatted trace with header
blackbox.framework.trace "${FUNCNAME[@]}" "$*" <<<"initialize"
# Output the formatted trace without header
blackbox.framework.trace "${FUNCNAME[@]}" "$*" <<<""
```

#### Arguments

* **$1** (type=string): Entrypoint
* **$2** (type=...mixed): Trace args
* **$3** (type=...mixed): Trace opts

#### Input on stdin

* Trace header

#### Output on stdout

* Formatted trace with optional header

## blackbox.*

### blackbox.__init

#### Arguments

* **$1** (type=enum<ansible|aws|chef|docker|git|kubernetes|linux|puppet|shell|terraform>): Module name
* **$2** (type=...mixed): Module args

#### See also

* [blackbox](#blackbox)

