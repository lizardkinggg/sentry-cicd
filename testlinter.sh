#!/bin/bash

curl https://raw.githubusercontent.com/creationix/nvm/v0.25.0/install.sh | bash
export NVM_DIR="/var/lib/jenkins/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

source /var/lib/jenkins/foo/bin/activate

echo "added variables"

export STORYBOOK_PERCY_PROJECT=getsentry/sentry-storybook
export PERCY_PROJECT=getsentry/sentry
export PERCY_PARALLEL_TOTAL=1
export PERCY_TOKEN=f7ae116d11ac0b11466f46b61be7b56177931f14abcc6feff081fea0a50ccc13
export STORYBOOK_PERCY_TOKEN=f473fdfe11f1a2d03ffb28e73a9d322ce46ddd12700ab0ec7720482b09c66e98
export ZEUS_HOOK_BASE=https://zeus.ci/hooks/fa079cf6-8e6b-11e7-9155-0a580a28081c/28a09c85e75d6d74f7697786dd208b4f91ec51c9347f5e35f07a8327dfcc353b
export CI_COMMIT_SHA="47a7b0d9dd0f5a47c4fa44ed80849ce5cc1f5f82"
export NODE_ENV="development"
export PIP_DISABLE_PIP_VERSION_CHECK="on"
export PIP_QUIET=1
export SENTRY_LIGHT_BUILD=1
export SENTRY_SKIP_BACKEND_VALIDATION=1
export MIGRATIONS_TEST_MIGRATE=0
export DJANGO_VERSION=">=1.11,<1.12"
export NODE_DIR="${HOME}/.nvm/versions/node/v$(< .nvmrc)"
export NODE_OPTIONS="--max-old-space-size=4096"

git checkout -qf $CI_COMMIT_SHA
#source /var/lib/jenkins/getsentry/sentry/fooo/bin/activate
export TEST_SUITE=lint
python setup.py install_egg_info
SENTRY_LIGHT_BUILD=1 pip install -U -e ".[dev]"
find "$NODE_DIR" -type d -empty -delete
nvm install
#./bin/yarn install --frozen-lockfile
./bin/yarn install --pure-lockfile
make travis-test-$TEST_SUITE
make travis-scan-$TEST_SUITE
rm -rf ~/.sentry
echo "I work"
