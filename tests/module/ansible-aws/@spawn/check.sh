#!/usr/bin/env bash
cat <<<"Partial Credit: 0"

BLACKBOX_PROVISION_WITH_OPTS() {
  mkdir -p /results/{setup,check}/{BLACKBOX_PROVISION_WITH_OPTS,BLACKBOX_BUILD_WITH_OPTS}
  cat >>/results/check/BLACKBOX_PROVISION_WITH_OPTS.assert <<<"ONCE"
  cat >>/etc/environment <<<"ASSERT_ENV_VARIABLE=ONCE"
  blackbox.framework.inventory.heap.allocate && {
    cat >>file.heap <<<"ONCE"
    blackbox.framework.inventory.heap.release
  }
}

BLACKBOX_BUILD_WITH_OPTS() {
  cat >>/results/check/BLACKBOX_BUILD_WITH_OPTS.assert <<<"ONCE"
  blackbox.framework.inventory.provision jq
}

. /blackbox/blackbox ansible-aws check "test"

cat <<COLLECTION | blackbox.expect.artifact.collection
printenv
COLLECTION

: "Score calculation"

cat <<ASSERT | blackbox.expect.shell.success 1 {%s,%s,"absolute score calculation"}
test -f /home/ubuntu/test/solve.assert
ASSERT

cat <<ASSERT | blackbox.expect.shell.success % {%s,%s,"relative score calculation"}
test -f /home/ubuntu/test/solve.assert
ASSERT

cat <<ASSERT | blackbox.expect.shell.success - {%s,%s,"ignore score calculation"}
false
ASSERT

cat <<ASSERT | blackbox.expect.shell.failure 1 {%s,%s,"absolute score calculation"}
test ! -f /home/ubuntu/test/solve.assert
ASSERT

cat <<ASSERT | blackbox.expect.shell.failure % {%s,%s,"relative score calculation"}
test ! -f /home/ubuntu/test/solve.assert
ASSERT

cat <<ASSERT | blackbox.expect.shell.failure - {%s,%s,"ignore score calculation"}
true
ASSERT

cat <<ASSERT | blackbox.expect.shell.stdout 1 {%s,%s,"absolute score calculation"}
cat /home/ubuntu/test/solve.assert
ASSERT

cat <<ASSERT | blackbox.expect.shell.stdout % {%s,%s,"relative score calculation"}
cat /home/ubuntu/test/solve.assert
ASSERT

cat <<ASSERT | blackbox.expect.shell.stdout - {%s,%s,"ignore score calculation"}
cat /dev/null
ASSERT

cat <<ASSERT | blackbox.expect.shell.stderr 1 {%s,%s,"absolute score calculation"}
set -o errexit
{
  test -f /home/ubuntu/test/solve.assert
}

command-with-error
ASSERT

cat <<ASSERT | blackbox.expect.shell.stderr % {%s,%s,"relative score calculation"}
set -o errexit
{
  test -f /home/ubuntu/test/solve.assert
}

command-with-error
ASSERT

cat <<ASSERT | blackbox.expect.shell.stderr - {%s,%s,"ignore score calculation"}
whoami
ASSERT

cat <<ASSERT | blackbox.expect.file.exists 1 {%s,%s,"absolute score calculation"}
/home/ubuntu/test/solve.assert
ASSERT

cat <<ASSERT | blackbox.expect.file.exists % {%s,%s,"relative score calculation"}
/home/ubuntu/test/solve.assert
ASSERT

cat <<ASSERT | blackbox.expect.file.exists - {%s,%s,"ignore score calculation"}
/path/to/non/existent/file
ASSERT

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

cat <<ASSERT | blackbox.expect.shell.success % {%s,%s,"script.sh"}
set -o errexit
{
  test -f /home/ubuntu/test/solve.assert
}

test ! -f script.sh
ASSERT

cat <<ASSERT | blackbox.expect.shell.success % {%s,%s,"playbook.yml"}
set -o errexit
{
  test -f /home/ubuntu/test/solve.assert
}

test -f playbook.yml
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
  printf -- "aws-cli/2.11.25\n"
)
ASSERT

cat <<ASSERT | blackbox.expect.shell.success % {%s,%s,"ansible binary"}
set -o errexit
{
  test -f /home/ubuntu/test/solve.assert
}

ansible --version
ASSERT

cat <<ASSERT | blackbox.expect.shell.success % {%s,%s,"ansible-playbook binary"}
set -o errexit
{
  test -f /home/ubuntu/test/solve.assert
}

ansible-playbook --version
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

: "Solution"

cat <<ASSERT | blackbox.expect.shell.success % {%s,%s,"Solution"}
aws iam get-user --user-name Test
ASSERT

: "Module check"

cat <<ASSERT | blackbox.expect.shell.success % {%s,%s,"check@BLACKBOX_PROVISION_WITH_OPTS"}
set -o errexit
{
  test -f /home/ubuntu/test/solve.assert
}

test -f /results/check/BLACKBOX_PROVISION_WITH_OPTS.assert
ASSERT

cat <<ASSERT | blackbox.expect.shell.success % {%s,%s,"jq binary"}
set -o errexit
{
  test -f /home/ubuntu/test/solve.assert
}

jq --version
ASSERT

cat <<ASSERT | blackbox.expect.shell.success % {%s,%s,"check@BLACKBOX_BUILD_WITH_OPTS"}
set -o errexit
{
  test -f /home/ubuntu/test/solve.assert
}

test -f /results/check/BLACKBOX_BUILD_WITH_OPTS.assert
ASSERT

cat <<ASSERT | blackbox.expect.shell.success % {%s,%s,"build log"}
set -o errexit
{
  test -f /home/ubuntu/test/solve.assert
}

test -f "$BLACKBOX_BUILD_LOG"
ASSERT

cat <<ASSERT | blackbox.expect.shell.success % {%s,%s,"artifacts collection"}
set -o errexit
{
  test -f /home/ubuntu/test/solve.assert
}

find "$BLACKBOX_STORAGE_DIR" -type f -name "*.artifact"
ASSERT

cat <<ASSERT | blackbox.expect.shell.success % {%s,%s,"test directory"}
set -o errexit
{
  test -f /home/ubuntu/test/solve.assert
}

diff <(
  pwd
) <(
  printf -- "/home/ubuntu/test\n"
)
ASSERT

exit 0
