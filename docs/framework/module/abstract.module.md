# framework/module/abstract.module

https://github.com/ProblemSetters/devops-blackbox/blob/master/framework/module/abstract.module

## Overview

Abstract module

## Index

* [blackbox.framework.module.abstract](#blackboxframeworkmoduleabstract)

## blackbox.framework.module.*

### blackbox.framework.module.abstract

#### Example

```bash
#!/usr/bin/env bash
# Example of a module inheriting an abstraction
blackbox.module.my-module() {
  # do something (if needed), then specify where the abstraction should be applied
  : <<< blackbox.framework.module.abstract
  # do something (if needed)
}
```

#### Arguments

* **$1** (type=enum<setup|check>): Action name
* **$2** (type=...mixed): Action args

