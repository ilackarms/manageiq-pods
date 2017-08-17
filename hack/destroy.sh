#!/usr/bin/env bash

# Run this script on the master node after Origin has been deployed
set -e -x

# Currently this cannot be changed because hard-coded in the Dockerfile FROM of miq-app-frontend :-(
export MIQPROJECT="cfme"
export OC_USER=scweiss
export OC_ADMIN=system:admin
export PODS_PROJECT=https://github.com/ManageIQ/manageiq-pods

# tear it all down
#oc delete all --all
oc delete -f templates/miq-sysadmin.yaml
oc delete project cfme
oc delete pv miq-pv01
oc delete pv miq-pv02
