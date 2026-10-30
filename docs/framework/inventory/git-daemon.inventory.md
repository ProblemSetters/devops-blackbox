# framework/inventory/git-daemon.inventory

https://github.com/ProblemSetters/devops-blackbox/blob/2404/framework/inventory/git-daemon.inventory

## Overview

Inventory "git-daemon"

## Index

* [blackbox.framework.inventory.git-daemon](#blackboxframeworkinventorygit-daemon)

## blackbox.framework.inventory.*

### blackbox.framework.inventory.git-daemon

#### Example

```bash
# Provision the "git-daemon" inventory
blackbox.framework.inventory.provision git-daemon
```

#### Arguments

* **$1** (readonly,type=string,default=git-daemon): Inventory name
* **$2** (type=...string): Inventory additional packages

#### See also

* [blackbox.framework.inventory.provision](#blackboxframeworkinventoryprovision)

