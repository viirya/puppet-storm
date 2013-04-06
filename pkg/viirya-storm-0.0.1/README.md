
# Puppet module for deploying Storm

This module deploys Storm cluster. It is tested with Storm 0.8.1 under puppet agent/master environment.

# Usage

After installing this module in puppet master node, in site.pp, defining:

    node 'server1' {
        include java
        include storm::cluster::nimbus
    }
    
    node /^server-(2|3)$/ {
        include java
        include storm::cluster::supervisor
    }


Downloading Storm package and putting the file under 'files' subdir of this module.

Please also modify parameters such as 'nimbus_host' and 'zookeeper_servers' in manifests/params.pp.

Since this puppet module will launch services on cluster, remember to comment 'storm::cluster::nimbus' and 'storm::cluster::supervisor' lines when the services are launached. Otherwise, there will be duplicate service processes because storm processes seem not to prevent duplicate launching.
 

