#!/usr/bin/env bash
set -e

/opt/gitlab/embedded/bin/runsvdir-start &

gitlab-ctl reconfigure

gitlab-ctl tail
