#! /usr/bin/env bash

pushd /etc &>/dev/null
  git clone https://github.com/pivotal-cf-experimental/concourse-filter &>/dev/null
  rm -rf concourse-filter/.git &>/dev/null
  pushd concourse-filter &>/dev/null
    go build &>/dev/null
    CREDENTIAL_FILTER_PARAMS=STACKS,DEPLOYMENT_NAME,SSH_AGENT_PID,CF_EDGE,IAAS,RUBYGEM_MIRROR,BOSH_LITE_NAME,AZURE_BOSH_USER,BOSH_USER,LANGUAGE,CI_CF_USERNAME,BOSH_TARGET,BOSH_LITE_DISK_SIZE,BRATS_BRANCH,DEPENDENCY,CI_USERNAME,BASH_ENV,RELEASE_NAME,RELEASE_DIR,BLOB_NAME,CF_RELEASE_DIR,BOSH_RELEASES_DIR,BOSH_GATEWAY_USER,BOSH_USE_BUNDLER
    export CREDENTIAL_FILTER_WHITELIST="$CREDENTIAL_FILTER_PARAMS,CREDENTIAL_FILTER_WHITELIST,GEM_HOME,TERM,USER,BUNDLE_APP_CONFIG,PATH,RUBY_DOWNLOAD_SHA256,PWD,LANG,RUBY_MAJOR,RUBYGEMS_VERSION,SHLVL,HOME,RUBY_VERSION,BUNDLER_VERSION,OLDPWD"
    exec &> >(./concourse-filter)
  popd &>/dev/null
popd &>/dev/null
