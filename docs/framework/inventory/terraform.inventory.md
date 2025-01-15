# framework/inventory/terraform.inventory

https://github.com/ProblemSetters/devops-blackbox/blob/2204/framework/inventory/terraform.inventory

## Overview

Inventory "terraform"

## Index

* [blackbox.framework.inventory.terraform](#blackboxframeworkinventoryterraform)

## blackbox.framework.inventory.*

### blackbox.framework.inventory.terraform

#### Example

```bash
# Provision the "terraform" inventory
blackbox.framework.inventory.provision terraform
```

#### Arguments

* **$1** (readonly,type=string,default=terraform): Inventory name
* **$2** (type=...string): Inventory additional packages

#### See also

* [blackbox.framework.inventory.provision](#blackboxframeworkinventoryprovision)

