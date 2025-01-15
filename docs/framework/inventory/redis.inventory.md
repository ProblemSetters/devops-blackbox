# framework/inventory/redis.inventory

https://github.com/ProblemSetters/devops-blackbox/blob/2204/framework/inventory/redis.inventory

## Overview

Inventory "redis"

## Index

* [blackbox.framework.inventory.redis](#blackboxframeworkinventoryredis)

## blackbox.framework.inventory.*

### blackbox.framework.inventory.redis

#### Example

```bash
# Provision the "redis" inventory
blackbox.framework.inventory.provision redis
```

#### Arguments

* **$1** (readonly,type=string,default=redis): Inventory name
* **$2** (type=...string): Inventory additional packages

#### See also

* [blackbox.framework.inventory.provision](#blackboxframeworkinventoryprovision)

