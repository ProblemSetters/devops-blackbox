# module/kubernetes-stdl/check/evaluate/expect/snapshot.expect

https://github.com/ProblemSetters/devops-blackbox/blob/2404/module/kubernetes-stdl/check/evaluate/expect/snapshot.expect

## Overview

snapshot collection expectant

## Index

* [blackbox.module.kubernetes-stdl.check.evaluate.expect.snapshot.collection](#blackboxmodulekubernetes-stdlcheckevaluateexpectsnapshotcollection)

## blackbox.module.kubernetes-stdl.check.evaluate.expect.snapshot.*

### blackbox.module.kubernetes-stdl.check.evaluate.expect.snapshot.collection

#### Example

```bash
# Collect a list of snapshots
cat <<ASSERT | blackbox.expect.snapshot.collection
  cat /path/to/filename
ASSERT
```

_Function has no arguments._

#### Input on stdin

* Assert expression

#### Output on stdout

* Formatted assert

