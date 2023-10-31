# module/docker-stdl/check/evaluate/expect/file.expect

https://github.com/ProblemSetters/devops-blackbox/blob/master/module/docker-stdl/check/evaluate/expect/file.expect

## Overview

File expressions expectant

## Index

* [blackbox.module.docker-stdl.check.evaluate.expect.file.exists](#blackboxmoduledocker-stdlcheckevaluateexpectfileexists)

## blackbox.module.docker-stdl.check.evaluate.expect.file.*

### blackbox.module.docker-stdl.check.evaluate.expect.file.exists

#### Example

```bash
# Expression that has the existing file
cat <<ASSERT | blackbox.module.docker-stdl.check.evaluate.expect.file.exists - "Success %s" "Fail %s" "message"
  /etc/passwd
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

