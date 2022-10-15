# framework/inventory.framework

https://github.com/ProblemSetters/devops-blackbox/blob/master/framework/inventory.framework

## Overview

Inventory handler

## Index

* [blackbox.framework.inventory.install.directory](#blackboxframeworkinventoryinstalldirectory)
* [blackbox.framework.inventory.install.file](#blackboxframeworkinventoryinstallfile)
* [blackbox.framework.inventory.heap.allocate](#blackboxframeworkinventoryheapallocate)
* [blackbox.framework.inventory.heap.release](#blackboxframeworkinventoryheaprelease)
* [blackbox.framework.inventory.provision](#blackboxframeworkinventoryprovision)

## blackbox.framework.inventory.install.*

### blackbox.framework.inventory.install.directory

#### Example

```bash
# Create a directory at the specified path
blackbox.framework.inventory.install.directory /path/to/the/directory
# Create a directory at the specified path with permissions: uid/gid and chmod
blackbox.framework.inventory.install.directory /path/to/the/directory 0 0 0777
```

#### Arguments

* **$1** (type=path): Path
* **$2** (type=uid,default=1000): Owner UID
* **$3** (type=gid,default=1000): Owner GID
* **$4** (type=chmod,default=0775): Mode

### blackbox.framework.inventory.install.file

#### Example

```bash
# Create a file at the specified path
blackbox.framework.inventory.install.file /path/to/the/destination/file </path/to/the/source/file
# Create a file at the specified path with permissions: uid/gid and chmod
blackbox.framework.inventory.install.file /path/to/the/destination/file 0 0 0777 </path/to/the/source/file
```

#### Arguments

* **$1** (type=path): Path
* **$2** (type=uid,default=1000): Owner UID
* **$3** (type=gid,default=1000): Owner GID
* **$4** (type=chmod,default=0664): Mode

#### Input on stdin

* File contents

## blackbox.framework.heap.*

### blackbox.framework.inventory.heap.allocate

#### Example

```bash
# Allocate a "heap" directory
blackbox.framework.inventory.heap.allocate && {
  # do something
  # then release "heap" directory
  blackbox.framework.inventory.heap.release
}
```

_Function has no arguments._

#### See also

* [blackbox.framework.inventory.heap.release](#blackboxframeworkinventoryheaprelease)

### blackbox.framework.inventory.heap.release

#### Example

```bash
# Release a "heap" directory
blackbox.framework.inventory.heap.allocate && {
  # do something
  # then release "heap" directory
  blackbox.framework.inventory.heap.release
}
```

_Function has no arguments._

#### See also

* [blackbox.framework.inventory.heap.allocate](#blackboxframeworkinventoryheapallocate)

## blackbox.framework.inventory.*

### blackbox.framework.inventory.provision

#### Example

```bash
# Provision the inventory named "git"
blackbox.framework.inventory.provision git
```

#### Arguments

* **$1** (type=string): Inventory name
* **$2** (type=...string): Optional deps

#### Exit codes

* **0**: If the inventory is provisioned
* **1**: If the inventory is not provisioned

