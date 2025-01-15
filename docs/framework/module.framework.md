# framework/module.framework

https://github.com/ProblemSetters/devops-blackbox/blob/2204/framework/module.framework

## Overview

Module handler

## Index

* [blackbox.framework.module.load](#blackboxframeworkmoduleload)

## blackbox.framework.module.*

### blackbox.framework.module.load

#### Example

```bash
# Load the "git" module with additional module args
blackbox.framework.module.load docker setup "1234567-docker-question-id"
```

#### Arguments

* **$1** (type=enum<ansible|aws|chef|docker|git|kubernetes|linux|puppet|shell|terraform>): Module name
* **$2** (type=...mixed): Module args

#### Exit codes

* **0**: If the module is loaded
* **1**: If the module is not loaded

