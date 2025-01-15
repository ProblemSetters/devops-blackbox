# framework/module/abstract/check/evaluate/score.evaluate

https://github.com/ProblemSetters/devops-blackbox/blob/2204/framework/module/abstract/check/evaluate/score.evaluate

## Overview

Step "evaluate" score calculator

## Index

* [blackbox.framework.module.abstract.check.evaluate.score.calculate](#blackboxframeworkmoduleabstractcheckevaluatescorecalculate)
* [blackbox.framework.module.abstract.check.evaluate.score.__init](#blackboxframeworkmoduleabstractcheckevaluatescoreinit)

## blackbox.framework.module.abstract.check.evaluate.score.*

### blackbox.framework.module.abstract.check.evaluate.score.calculate

#### Example

```bash
# Calculates a score: 10 if success or 0 if failure
blackbox.framework.module.abstract.check.evaluate.score.calculate 10
# Calculates a score: automatic average  if success or 0 if failure
blackbox.framework.module.abstract.check.evaluate.score.calculate -
```

#### Arguments

* **$1** (type=enum<1..100|->): Score value: absolute (if integer) or relative (if "-")

#### Output on stdout

* Calculated score

### blackbox.framework.module.abstract.check.evaluate.score.__init

_Function has no arguments._

#### Variables set

* **BLACKBOX_CHECK_EVALUATE_SCORE_CALCULATE_CACHE** (readonly,type=string,default=auto): Path to the question evaluation cache (sets automatically, do not override)

#### See also

* [blackbox.framework.module.abstract.check.evaluate.score](#blackboxframeworkmoduleabstractcheckevaluatescore)

