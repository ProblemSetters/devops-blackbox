# framework/module/abstract/check/build.step

https://github.com/ProblemSetters/devops-blackbox/blob/master/framework/module/abstract/check/build.step

## Overview

Abstract module "check" action "build" step

## Index

* [blackbox.framework.module.abstract.check.build](#blackboxframeworkmoduleabstractcheckbuild)

## blackbox.framework.module.abstract.check.*

### blackbox.framework.module.abstract.check.build

#### Example

```bash
#!/usr/bin/env bash
# Example of a module "check" action "build" step inheriting an abstraction
blackbox.module.my-module.check.build() {
  # do something (if needed), then specify where the abstraction should be applied
  : <<< blackbox.framework.module.abstract.check.build:step
  # do something (if needed)
}
```

#### Arguments

* **$1** (type=...mixed): Step args

