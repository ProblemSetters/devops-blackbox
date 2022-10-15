# framework/module/abstract/setup/provision.step

https://github.com/ProblemSetters/devops-blackbox/blob/master/framework/module/abstract/setup/provision.step

## Overview

Abstract module "setup" action "provision" step

## Index

* [blackbox.framework.module.abstract.setup.provision](#blackboxframeworkmoduleabstractsetupprovision)

## blackbox.framework.module.abstract.setup.*

### blackbox.framework.module.abstract.setup.provision

#### Example

```bash
#!/usr/bin/env bash
# Example of a module "setup" action "provision" step inheriting an abstraction
blackbox.module.my-module.setup.provision() {
  # do something (if needed), then specify where the abstraction should be applied
  : <<< blackbox.framework.module.abstract.setup.provision:step
  # do something (if needed)
}
```

#### Arguments

* **$1** (type=...mixed): Step args

