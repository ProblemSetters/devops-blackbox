# framework/flag.framework

https://github.com/ProblemSetters/devops-blackbox/blob/master/framework/flag.framework

## Overview

Flag handler

## Index

* [blackbox.framework.flag.enabled](#blackboxframeworkflagenabled)

## blackbox.framework.flag.*

### blackbox.framework.flag.enabled

#### Example

```bash
# Check if the flag of the specified name is enabled
if ( blackbox.framework.flag.enabled STEP_PROVISION ); then
  # do something
fi
```

#### Arguments

* **$1** (type=string): Flag name

#### Exit codes

* **0**: If the flag is enabled
* **1**: If the flag is disabled

