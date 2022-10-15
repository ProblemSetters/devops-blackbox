# framework/module/abstract/setup.action

https://github.com/ProblemSetters/devops-blackbox/blob/master/framework/module/abstract/setup.action

## Overview

Abstract module "setup" action

## Index

* [blackbox.framework.module.abstract.setup](#blackboxframeworkmoduleabstractsetup)

## blackbox.framework.module.abstract.*

### blackbox.framework.module.abstract.setup

#### Example

```bash
#!/usr/bin/env bash
# Example of a module "setup" action inheriting an abstraction
blackbox.module.my-module.setup() {
  # do something (if needed), then specify where the abstraction should be applied
  : <<< blackbox.framework.module.abstract.setup:action
  # do something (if needed)
}
```

#### Arguments

* **$1** (type=string): Question ID
* **$2** (type=...mixed): Step args

