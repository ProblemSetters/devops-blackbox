# framework/module/abstract/check.action

https://github.com/ProblemSetters/devops-blackbox/blob/2204/framework/module/abstract/check.action

## Overview

Abstract module "check" action

## Index

* [blackbox.framework.module.abstract.check](#blackboxframeworkmoduleabstractcheck)

## blackbox.framework.module.abstract.*

### blackbox.framework.module.abstract.check

#### Example

```bash
#!/usr/bin/env bash
# Example of a module "check" action inheriting an abstraction
blackbox.module.my-module.check() {
  # do something (if needed), then specify where the abstraction should be applied
  : <<< blackbox.framework.module.abstract.check:action
  # do something (if needed)
}
```

#### Arguments

* **$1** (type=string): Question ID
* **$2** (type=...mixed): Step args

