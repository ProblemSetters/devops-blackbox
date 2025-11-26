#!/usr/bin/env bash
cat <<<"Partial Credit: 0"

BLACKBOX_PROVISION_WITH_OPTS() {
  blackbox.framework.inventory.provision jq
}

. /blackbox/blackbox linux-stdl check "test"

cat <<COLLECTION | blackbox.expect.artifact.collection
printenv
COLLECTION

: "Host validation"

cat <<ASSERT | blackbox.expect.shell.success % {%s,%s,"host Ubuntu version"}
set -o errexit
{
  test -f /home/ubuntu/test/solve.assert
}

{
  shopt -os allexport
  . /etc/lsb-release
  shopt -ou allexport
}

diff <(
  printenv DISTRIB_RELEASE
) <(
  printf -- "24.04\n"
)
ASSERT

: "Module setup"

cat <<ASSERT | blackbox.expect.shell.success % {%s,%s,"/usr/local/bin/solve"}
set -o errexit
{
  test -f /home/ubuntu/test/solve.assert
}

test ! -f /usr/local/bin/solve
ASSERT

cat <<ASSERT | blackbox.expect.shell.success % {%s,%s,"Docker binary"}
set -o errexit
{
  test -f /home/ubuntu/test/solve.assert
}

docker info
ASSERT

cat <<ASSERT | blackbox.expect.shell.success % {%s,%s,"Git binary"}
set -o errexit
{
  test -f /home/ubuntu/test/solve.assert
}

git --version
ASSERT

cat <<ASSERT | blackbox.expect.shell.success % {%s,%s,"AWS Cli binary"}
set -o errexit
{
  test -f /home/ubuntu/test/solve.assert
}

diff <(
  awk '{ print \$1 }' <(
    aws --version 2>&1
  )
) <(
  printf -- "aws-cli/2.27.33\n"
)
ASSERT

cat <<ASSERT | blackbox.expect.shell.success % {%s,%s,".git"}
set -o errexit
{
  test -f /home/ubuntu/test/solve.assert
}

test -d .git
ASSERT

cat <<ASSERT | blackbox.expect.shell.success % {%s,%s,"ubuntu@134148934511.dkr.ecr.us-east-1.amazonaws.com"}
set -o errexit
{
  test -f /home/ubuntu/test/solve.assert
}

jq -e '.auths."134148934511.dkr.ecr.us-east-1.amazonaws.com"' /home/ubuntu/.docker/config.json
ASSERT

cat <<ASSERT | blackbox.expect.shell.success % {%s,%s,"root@134148934511.dkr.ecr.us-east-1.amazonaws.com"}
set -o errexit
{
  test -f /home/ubuntu/test/solve.assert
}

jq -e '.auths."134148934511.dkr.ecr.us-east-1.amazonaws.com"' /root/.docker/config.json
ASSERT

cat <<ASSERT | blackbox.expect.shell.success % {%s,%s,"setup@BLACKBOX_PROVISION_WITH_OPTS"}
set -o errexit
{
  test -f /home/ubuntu/test/solve.assert
}

diff /results/setup/BLACKBOX_PROVISION_WITH_OPTS.assert <(
  printf -- "ONCE\n"
)
ASSERT

cat <<ASSERT | blackbox.expect.shell.success % {%s,%s,"environment variable"}
set -o errexit
{
  test -f /home/ubuntu/test/solve.assert
}

diff <(
  printenv ASSERT_ENV_VARIABLE
) <(
  printf -- "ONCE\n"
)
ASSERT

cat <<ASSERT | blackbox.expect.shell.success % {%s,%s,"heap"}
set -o errexit
{
  test -f /home/ubuntu/test/solve.assert
}

diff "${BLACKBOX_HEAP_DIR}/file.heap" <(
  printf -- "ONCE\n"
)
ASSERT

cat <<ASSERT | blackbox.expect.shell.success % {%s,%s,"inline"}
set -o errexit
{
  test -f /home/ubuntu/test/solve.assert
}

diff /results/setup.assert <(
  printf -- "ONCE\n"
)
ASSERT

: "Solution"

cat <<ASSERT | blackbox.expect.shell.success % {%s,%s,"Git config username"}
diff <(
  git config user.name
) <(
  printf -- "Firstname Lastname\n"
)
ASSERT

cat <<ASSERT | blackbox.expect.shell.success % {%s,%s,"Git config email"}
diff <(
  git config user.email
) <(
  printf -- "test@example.com\n"
)
ASSERT

cat <<ASSERT | blackbox.expect.shell.success % {%s,%s,"Git log"}
diff <(
  git log --pretty="format:%s%d" --name-status
) <(
  cat <(
    printf -- "Test commit (HEAD -> master, origin/master)\n"
    printf -- "A\ttest.module\n"
  )
)
ASSERT

exit 0
