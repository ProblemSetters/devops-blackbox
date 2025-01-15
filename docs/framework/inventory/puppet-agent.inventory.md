# framework/inventory/puppet-agent.inventory

https://github.com/ProblemSetters/devops-blackbox/blob/2204/framework/inventory/puppet-agent.inventory

## Overview

Inventory "puppet-agent"

## Index

* [blackbox.framework.inventory.puppet-agent](#blackboxframeworkinventorypuppet-agent)

## blackbox.framework.inventory.*

### blackbox.framework.inventory.puppet-agent

#### Example

```bash
# Provision the "puppet-agent" inventory
blackbox.framework.inventory.provision puppet-agent
```

#### Arguments

* **$1** (readonly,type=string,default=puppet-agent): Inventory name
* **$2** (type=...string): Inventory additional packages

#### See also

* [blackbox.framework.inventory.provision](#blackboxframeworkinventoryprovision)

