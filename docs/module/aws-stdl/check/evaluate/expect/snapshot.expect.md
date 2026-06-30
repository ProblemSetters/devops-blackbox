# module/aws-stdl/check/evaluate/expect/snapshot.expect

https://github.com/ProblemSetters/devops-blackbox/blob/2404/module/aws-stdl/check/evaluate/expect/snapshot.expect

## Overview

snapshot collection expectant

## Index

* [blackbox.module.aws-stdl.check.evaluate.expect.snapshot.collection](#blackboxmoduleaws-stdlcheckevaluateexpectsnapshotcollection)

## blackbox.module.aws-stdl.check.evaluate.expect.snapshot.*

### blackbox.module.aws-stdl.check.evaluate.expect.snapshot.collection

#### Example

```bash
# Collect a list of snapshots
cat <<ASSERT | blackbox.expect.snapshot.collection
  cat /path/to/filename
  aws-stdl dynamodb scan --table-name UserSteps --query "Items[]"
ASSERT
```

_Function has no arguments._

#### Input on stdin

* Assert expression

#### Output on stdout

* Formatted assert

