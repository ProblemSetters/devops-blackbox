# framework/module/abstract/check/evaluate.step

https://github.com/ProblemSetters/devops-blackbox/blob/master/framework/module/abstract/check/evaluate.step

## Overview

Abstract module "check" action "evaluate" step

## Index

* [blackbox.framework.module.abstract.check.evaluate](#blackboxframeworkmoduleabstractcheckevaluate)

## blackbox.framework.module.abstract.check.*

### blackbox.framework.module.abstract.check.evaluate

#### Example

```bash
#!/usr/bin/env bash
# Example of a module "check" action "evaluate" step inheriting an abstraction
blackbox.module.my-module.check.evaluate() {
  # do something (if needed), then specify where the abstraction should be applied
  : <<< blackbox.framework.module.abstract.check.evaluate:step
  # do something (if needed)
}
```

#### Arguments

* **$1** (type=...mixed): Step args

