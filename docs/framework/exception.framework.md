# framework/exception.framework

https://github.com/ProblemSetters/devops-blackbox/blob/2204/framework/exception.framework

## Overview

Exception handler

## Index

* [blackbox.framework.exception.raise](#blackboxframeworkexceptionraise)

## blackbox.framework.exception.*

### blackbox.framework.exception.raise

#### Example

```bash
# Raise a formatted exception
blackbox.framework.exception.raise "exception code '%s' message" "code-123"
```

#### Arguments

* **$1** (type=string): Exception message
* **$2** (type=...mixed): Exception args

#### Output on stdout

* Formatted exception

