# framework/module/abstract/check/evaluate/expect/snapshot.expect

https://github.com/ProblemSetters/devops-blackbox/blob/2404/framework/module/abstract/check/evaluate/expect/snapshot.expect

## Overview

snapshot collection expectant

## Index

* [blackbox.framework.module.abstract.check.evaluate.expect.snapshot.collection](#blackboxframeworkmoduleabstractcheckevaluateexpectsnapshotcollection)

## blackbox.framework.module.abstract.check.evaluate.expect.snapshot.*

### blackbox.framework.module.abstract.check.evaluate.expect.snapshot.collection

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

