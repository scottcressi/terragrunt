#!/usr/bin/env sh

if [ $# -eq 0 ] ; then
    echo """
    options:

    setup_charts
    setup_statebucket
    """
    exit 0
fi

setup_statebucket(){
    UUID=$(cat /proc/sys/kernel/random/uuid)
    aws s3 mb s3://terraform-state-"$UUID"
}

setup_charts(){
    git clone https://github.com/opendistro-for-elasticsearch/opendistro-build.git /var/tmp/opendistro
    cd /var/tmp/opendistro/helm/opendistro-es || exit
    git pull
    git checkout v1.13.0
    helm package .

    git clone https://github.com/Joxit/docker-registry-ui.git /var/tmp/docker-registry-ui
    cd /var/tmp/docker-registry-ui || exit
    git pull
    git checkout 1.5.4
}

"$@"
