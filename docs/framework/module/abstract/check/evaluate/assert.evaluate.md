# framework/module/abstract/check/evaluate/assert.evaluate

https://github.com/ProblemSetters/devops-blackbox/blob/master/framework/module/abstract/check/evaluate/assert.evaluate

## Overview

Step "evaluate" asserter

## Index

* [blackbox.framework.module.abstract.check.evaluate.assert.false](#blackboxframeworkmoduleabstractcheckevaluateassertfalse)
* [blackbox.framework.module.abstract.check.evaluate.assert.normalize](#blackboxframeworkmoduleabstractcheckevaluateassertnormalize)
* [blackbox.framework.module.abstract.check.evaluate.assert.true](#blackboxframeworkmoduleabstractcheckevaluateasserttrue)

## blackbox.framework.module.abstract.check.evaluate.assert.*

### blackbox.framework.module.abstract.check.evaluate.assert.false

#### Example

```bash
# Asserts the false expression "(false -eq true)" with missing "10" score and a specific message that has an argument
blackbox.framework.module.abstract.check.evaluate.assert.false "(false -eq true)" 10 "Assert message with argument '%s'" "argument"
```

#### Arguments

* **$1** (type=string): Assert expression
* **$2** (type=enum<1..100|->): Score value: absolute (if integer) or relative (if "-")
* **$3** (type=string): Assert message

#### Output on stdout

* Formatted assert

### blackbox.framework.module.abstract.check.evaluate.assert.normalize

#### Example

```bash
# Normalize assert expression
blackbox.framework.module.abstract.check.evaluate.assert.normalize "(true -eq true)"
```

#### Arguments

* **$1** (type=string): Assert expression

#### Output on stdout

* Normalized assert

### blackbox.framework.module.abstract.check.evaluate.assert.true

#### Example

```bash
# Asserts the true expression "(true -eq true)" with "10" score and a specific message that has an argument
blackbox.framework.module.abstract.check.evaluate.assert.true "(true -eq true)" 10 "Assert message with argument '%s'" "argument"
```

#### Arguments

* **$1** (type=string): Assert expression
* **$2** (type=enum<1..100|->): Score value: absolute (if integer) or relative (if "-")
* **$3** (type=string): Assert message

#### Output on stdout

* Formatted assert

