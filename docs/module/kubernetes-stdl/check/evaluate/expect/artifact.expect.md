# module/kubernetes-stdl/check/evaluate/expect/artifact.expect

https://github.com/ProblemSetters/devops-blackbox/blob/master/module/kubernetes-stdl/check/evaluate/expect/artifact.expect

## Overview

Artifact collection expectant

## Index

* [blackbox.module.kubernetes-stdl.check.evaluate.expect.artifact.collection](#blackboxmodulekubernetes-stdlcheckevaluateexpectartifactcollection)

## blackbox.module.kubernetes-stdl.check.evaluate.expect.artifact.*

### blackbox.module.kubernetes-stdl.check.evaluate.expect.artifact.collection

#### Example

```bash
# Collect a list of artifacts
cat <<ASSERT | blackbox.module.kubernetes-stdl.check.evaluate.expect.artifact.collection
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

