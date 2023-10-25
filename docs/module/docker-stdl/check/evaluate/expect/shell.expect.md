# module/docker-stdl/check/evaluate/expect/shell.expect

https://github.com/ProblemSetters/devops-blackbox/blob/master/module/docker-stdl/check/evaluate/expect/shell.expect

## Overview

Shell expressions expectant

## Index

* [blackbox.module.docker-stdl.check.evaluate.expect.shell.debug](#blackboxmoduledocker-stdlcheckevaluateexpectshelldebug)
* [blackbox.module.docker-stdl.check.evaluate.expect.shell.failure](#blackboxmoduledocker-stdlcheckevaluateexpectshellfailure)
* [blackbox.module.docker-stdl.check.evaluate.expect.shell.stderr](#blackboxmoduledocker-stdlcheckevaluateexpectshellstderr)
* [blackbox.module.docker-stdl.check.evaluate.expect.shell.stdout](#blackboxmoduledocker-stdlcheckevaluateexpectshellstdout)
* [blackbox.module.docker-stdl.check.evaluate.expect.shell.success](#blackboxmoduledocker-stdlcheckevaluateexpectshellsuccess)

## blackbox.module.docker-stdl.check.evaluate.expect.shell.*

### blackbox.module.docker-stdl.check.evaluate.expect.shell.debug

#### Example

```bash
# Debug output
cat <<ASSERT | blackbox.expect.shell.debug
  printf "debug message"
ASSERT
```

_Function has no arguments._

#### Input on stdin

* Assert expression

#### Output on stdout

* Formatted assert

### blackbox.module.docker-stdl.check.evaluate.expect.shell.failure

#### Example

```bash
# Expression that should fail
cat <<ASSERT | blackbox.module.docker-stdl.check.evaluate.expect.shell.failure - "Success %s" "Fail %s" "message"
  true -eq false
ASSERT
```

#### Arguments

* **$1** (type=enum<1..100|->): Score value: absolute (if integer) or relative (if "-")
* **$3** (type=string): Assert failure message
* **$4** (type=...mixed): Assert message args

#### Input on stdin

* Assert expression

#### Output on stdout

* Formatted assert

### blackbox.module.docker-stdl.check.evaluate.expect.shell.stderr

#### Example

```bash
# Expression that should have a stderr
cat <<ASSERT | blackbox.module.docker-stdl.check.evaluate.expect.shell.stderr - "Success %s" "Fail %s" "message"
  command-that-does-not-exist
ASSERT
```

#### Arguments

* **$1** (type=enum<1..100|->): Score value: absolute (if integer) or relative (if "-")
* **$3** (type=string): Assert failure message
* **$4** (type=...mixed): Assert message args

#### Input on stdin

* Assert expression

#### Output on stdout

* Formatted assert

### blackbox.module.docker-stdl.check.evaluate.expect.shell.stdout

#### Example

```bash
# Expression that should have a stdout
cat <<ASSERT | blackbox.module.docker-stdl.check.evaluate.expect.shell.stdout - "Success %s" "Fail %s" "message"
  whoami
ASSERT
```

#### Arguments

* **$1** (type=enum<1..100|->): Score value: absolute (if integer) or relative (if "-")
* **$3** (type=string): Assert failure message
* **$4** (type=...mixed): Assert message args

#### Input on stdin

* Assert expression

#### Output on stdout

* Formatted assert

### blackbox.module.docker-stdl.check.evaluate.expect.shell.success

#### Example

```bash
# Expression that should succeed
cat <<ASSERT | blackbox.module.docker-stdl.check.evaluate.expect.shell.success - "Success %s" "Fail %s" "message"
  true -eq true
ASSERT
```

#### Arguments

* **$1** (type=enum<1..100|->): Score value: absolute (if integer) or relative (if "-")
* **$3** (type=string): Assert failure message
* **$4** (type=...mixed): Assert message args

#### Input on stdin

* Assert expression

#### Output on stdout

* Formatted assert

