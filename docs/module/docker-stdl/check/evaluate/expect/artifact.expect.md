# module/docker-stdl/check/evaluate/expect/artifact.expect

https://github.com/ProblemSetters/devops-blackbox/blob/2204/module/docker-stdl/check/evaluate/expect/artifact.expect

## Overview

Artifact collection expectant

## Index

* [blackbox.module.docker-stdl.check.evaluate.expect.artifact.collection](#blackboxmoduledocker-stdlcheckevaluateexpectartifactcollection)

## blackbox.module.docker-stdl.check.evaluate.expect.artifact.*

### blackbox.module.docker-stdl.check.evaluate.expect.artifact.collection

#### Example

```bash
# Collect a list of artifacts
cat <<ASSERT | blackbox.module.docker-stdl.check.evaluate.expect.artifact.collection
  printenv
  /etc/passwd
  whoami
  any-other-command-output-or-file
ASSERT
```

_Function has no arguments._

#### Input on stdin

* Assert expression

#### Output on stdout

* Formatted assert

