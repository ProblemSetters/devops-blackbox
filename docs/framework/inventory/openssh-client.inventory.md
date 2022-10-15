# framework/inventory/openssh-client.inventory

https://github.com/ProblemSetters/devops-blackbox/blob/master/framework/inventory/openssh-client.inventory

## Overview

Inventory "openssh-cli"

## Index

* [blackbox.framework.inventory.openssh-client](#blackboxframeworkinventoryopenssh-client)

## blackbox.framework.inventory.*

### blackbox.framework.inventory.openssh-client

#### Example

```bash
# Provision the "openssh-client" inventory
blackbox.framework.inventory.provision openssh-client
```

#### Arguments

* **$1** (readonly,type=string,default=openssh-client): Inventory name
* **$2** (type=...string): Inventory additional packages

#### See also

* [blackbox.framework.inventory.provision](#blackboxframeworkinventoryprovision)

