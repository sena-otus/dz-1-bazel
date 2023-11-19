# helloworld c++, bazel, debian package, googletest, github actions==

## Description
Project example with classic helloworld c++ application with bazel

* generate version.h from version.h.in using bazel
* debian package generation using bazel rules_pkg
* googletest example
* use github actions to build and release debian package on each push

## Build instruction
* On first checkout run "./update-patch-version.sh 1" to generate patch-version file (version/PATCH_VERSION.bzl).
* You will need fresh bazel binary to build that. The version which comes with Debian 12 or Ubuntu 22 is outdated and will not work.
  * To install bazel localy on your Debian/Ubuntu use google repo like described [here](https://bazel.build/install/ubuntu#install-on-ubuntu) or [here](https://blog.goodaudience.com/install-bazel-in-few-easy-commands-246721849ce)
  * To install for github actions, use [actions-setup-bazel](https://github.com/marketplace/actions/actions-setup-bazel)
* First steps with bazel:
  * To get available targets run `bazel query ...`
  * To build selected target run `bazel build <target>`, for example
    * to build debian package run `bazel build //pkg:helloworld-debian`
    * to run all tests run `bazel test //...`
