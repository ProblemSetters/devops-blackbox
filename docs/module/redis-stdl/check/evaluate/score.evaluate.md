# module/redis-stdl/check/evaluate/score.evaluate

https://github.com/ProblemSetters/devops-blackbox/blob/2204/module/redis-stdl/check/evaluate/score.evaluate

## Overview

Step "evaluate" score calculator

## Index

* [blackbox.module.redis-stdl.check.evaluate.score.calculate](#blackboxmoduleredis-stdlcheckevaluatescorecalculate)
* [blackbox.module.redis-stdl.check.evaluate.score.__init](#blackboxmoduleredis-stdlcheckevaluatescoreinit)

## blackbox.module.redis-stdl.check.evaluate.score.*

### blackbox.module.redis-stdl.check.evaluate.score.calculate

#### Example

```bash
# Calculates a score: 10 if success or 0 if failure
blackbox.module.redis-stdl.check.evaluate.score.calculate 10
# Calculates a score: automatic average  if success or 0 if failure
blackbox.module.redis-stdl.check.evaluate.score.calculate -
```

#### Arguments

* **$1** (type=enum<1..100|->): Score value: absolute (if integer) or relative (if "-")

#### Output on stdout

* Calculated score

### blackbox.module.redis-stdl.check.evaluate.score.__init

_Function has no arguments._

#### Variables set

* **BLACKBOX_CHECK_EVALUATE_SCORE_CALCULATE_CACHE** (readonly,type=string,default=auto): Path to the question evaluation cache (sets automatically, do not override)

#### See also

* [blackbox.module.redis-stdl.check.evaluate.score](#blackboxmoduleredis-stdlcheckevaluatescore)

