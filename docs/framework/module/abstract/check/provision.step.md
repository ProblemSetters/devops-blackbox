# framework/module/abstract/check/provision.step

https://github.com/ProblemSetters/devops-blackbox/blob/2204/framework/module/abstract/check/provision.step

## Overview

Abstract module "check" action "provision" step

## Index

* [blackbox.framework.module.abstract.check.provision](#blackboxframeworkmoduleabstractcheckprovision)

## blackbox.framework.module.abstract.check.*

### blackbox.framework.module.abstract.check.provision

#### Example

```bash
#!/usr/bin/env bash
# Example of a module "check" action "provision" step inheriting an abstraction
blackbox.module.my-module.check.provision() {
  # do something (if needed), then specify where the abstraction should be applied
  : <<< blackbox.framework.module.abstract.check.provision:step
  # do something (if needed)
}
```

#### Arguments

* **$1** (type=...mixed): Step args

