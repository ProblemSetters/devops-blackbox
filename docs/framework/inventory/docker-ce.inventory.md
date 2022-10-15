# framework/inventory/docker-ce.inventory

https://github.com/ProblemSetters/devops-blackbox/blob/master/framework/inventory/docker-ce.inventory

## Overview

Inventory "docker-ce"

## Index

* [blackbox.framework.inventory.docker-ce](#blackboxframeworkinventorydocker-ce)

## blackbox.framework.inventory.*

### blackbox.framework.inventory.docker-ce

#### Example

```bash
# Provision the "docker-ce" inventory
blackbox.framework.inventory.provision docker-ce
```

#### Arguments

* **$1** (readonly,type=string,default=docker-ce): Inventory name
* **$2** (type=...string): Inventory additional packages

#### See also

* [blackbox.framework.inventory.provision](#blackboxframeworkinventoryprovision)

