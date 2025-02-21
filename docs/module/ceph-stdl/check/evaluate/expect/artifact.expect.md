# module/ceph-stdl/check/evaluate/expect/artifact.expect

https://github.com/ProblemSetters/devops-blackbox/blob/2204/module/ceph-stdl/check/evaluate/expect/artifact.expect

## Overview

Artifact collection expectant

## Index

* [blackbox.module.ceph-stdl.check.evaluate.expect.artifact.collection](#blackboxmoduleceph-stdlcheckevaluateexpectartifactcollection)

## blackbox.module.ceph-stdl.check.evaluate.expect.artifact.*

### blackbox.module.ceph-stdl.check.evaluate.expect.artifact.collection

#### Example

```bash
# Collect a list of artifacts
cat <<ASSERT | blackbox.module.ceph-stdl.check.evaluate.expect.artifact.collection
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

