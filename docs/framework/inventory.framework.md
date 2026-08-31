# framework/inventory.framework

https://github.com/ProblemSetters/devops-blackbox/blob/2404/framework/inventory.framework

## Overview

Inventory handler

## Index

* [blackbox.framework.inventory.install.directory](#blackboxframeworkinventoryinstalldirectory)
* [blackbox.framework.inventory.install.file](#blackboxframeworkinventoryinstallfile)
* [blackbox.framework.inventory.heap.allocate](#blackboxframeworkinventoryheapallocate)
* [blackbox.framework.inventory.heap.release](#blackboxframeworkinventoryheaprelease)
* [blackbox.framework.inventory.snapshot.path](#blackboxframeworkinventorysnapshotpath)
* [blackbox.framework.inventory.snapshot.push](#blackboxframeworkinventorysnapshotpush)
* [blackbox.framework.inventory.snapshot.pull](#blackboxframeworkinventorysnapshotpull)
* [blackbox.framework.inventory.snapshot.digest](#blackboxframeworkinventorysnapshotdigest)
* [blackbox.framework.inventory.snapshot.verify](#blackboxframeworkinventorysnapshotverify)
* [blackbox.framework.inventory.snapshot.__init](#blackboxframeworkinventorysnapshotinit)
* [blackbox.framework.inventory.ecr.token.read](#blackboxframeworkinventoryecrtokenread)
* [blackbox.framework.inventory.ecr.token.login](#blackboxframeworkinventoryecrtokenlogin)
* [blackbox.framework.inventory.ecr.login](#blackboxframeworkinventoryecrlogin)
* [blackbox.framework.inventory.ecr.logout](#blackboxframeworkinventoryecrlogout)
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

## blackbox.framework.inventory.heap.*

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

## blackbox.framework.inventory.snapshot.*

### blackbox.framework.inventory.snapshot.path

#### Example

```bash
# Gets a snapshot path of file at the specified path
blackbox.framework.inventory.snapshot.path cat /path/to/filename
# Gets a snapshot path of DynamoDB table
blackbox.framework.inventory.snapshot.path aws dynamodb scan --table-name UserSteps --query "Items[]"
```

#### Arguments

* **$1** (type=source): Source

### blackbox.framework.inventory.snapshot.push

#### Example

```bash
# Pushes a snapshot of file at the specified path
blackbox.framework.inventory.snapshot.push cat /path/to/filename
# Pushes a snapshot of DynamoDB table
blackbox.framework.inventory.snapshot.push aws dynamodb scan --table-name UserSteps --query "Items[]"
```

#### Arguments

* **$1** (type=source): Source

### blackbox.framework.inventory.snapshot.pull

#### Example

```bash
# Pulls a snapshot of file at the specified path
blackbox.framework.inventory.snapshot.pull cat /path/to/filename
# Pulls a snapshot of DynamoDB table
blackbox.framework.inventory.snapshot.pull aws dynamodb scan --table-name UserSteps --query "Items[]"
```

#### Arguments

* **$1** (type=source): Source

### blackbox.framework.inventory.snapshot.digest

#### Example

```bash
# Gets a snapshot digest path of file at the specified path
blackbox.framework.inventory.snapshot.digest cat /path/to/filename
# Gets a snapshot digest path of DynamoDB table
blackbox.framework.inventory.snapshot.digest aws dynamodb scan --table-name UserSteps --query "Items[]"
```

#### Arguments

* **$1** (type=source): Source

### blackbox.framework.inventory.snapshot.verify

#### Example

```bash
# Verifies a snapshot of file at the specified path
blackbox.framework.inventory.snapshot.verify cat /path/to/filename
# Verifies a snapshot of DynamoDB table
blackbox.framework.inventory.snapshot.verify aws dynamodb scan --table-name UserSteps --query "Items[]"
```

#### Arguments

* **$1** (type=source): Source

### blackbox.framework.inventory.snapshot.__init

_Function has no arguments._

## blackbox.framework.inventory.ecr.*

### blackbox.framework.inventory.ecr.token.read

#### Example

```bash
# Read the private ECR password
blackbox.framework.inventory.ecr.token.read private-password
```

#### Arguments

* **$1** (type=enum<private-password|public-password>): Token file name

#### Exit codes

* **0**: If a non-empty token was read, which is printed to stdout
* **1**: If the token was missing or empty

#### See also

* [blackbox.framework.inventory.ecr.token.login](#blackboxframeworkinventoryecrtokenlogin)

### blackbox.framework.inventory.ecr.token.login

#### Example

```bash
# Log in to the private registry
blackbox.framework.inventory.ecr.token.login 134148934511.dkr.ecr.us-east-1.amazonaws.com private-password
```

#### Arguments

* **$1** (type=string): Registry
* **$2** (type=enum<private-password|public-password>): Token file name

#### Exit codes

* **0**: If both the root and "$BLACKBOX_USER_NAME" logins succeeded
* **1**: If no token could be read, or either login failed

#### See also

* [blackbox.framework.inventory.ecr.token.read](#blackboxframeworkinventoryecrtokenread)

### blackbox.framework.inventory.ecr.login

#### Example

```bash
# Logs in to Amazon ECR
blackbox.framework.inventory.ecr.login
```

_Function has no arguments._

#### Exit codes

* **0**: If the private registry login succeeded
* **1**: If the private registry login failed

#### See also

* [blackbox.framework.inventory.ecr.logout](#blackboxframeworkinventoryecrlogout)

### blackbox.framework.inventory.ecr.logout

#### Example

```bash
# Logs out of Amazon ECR
blackbox.framework.inventory.ecr.logout
```

_Function has no arguments._

#### See also

* [blackbox.framework.inventory.ecr.login](#blackboxframeworkinventoryecrlogin)

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

