# /etc/puppet/modules/storm/manifests/master.pp

class storm::cluster::nimbus {

    require storm::params
    require storm

    exec { "Launch Nimbus":
        command => "bin/storm nimbus &",
        user => "${storm::params::storm_user}",
        cwd => "${storm::params::storm_base}/storm-${storm::params::version}",
        path    => ["/bin", "/usr/bin", "${storm::params::storm_base}/storm-${storm::params::version}", "${java::params::java_base}/jdk${java::params::java_version}/bin"],
        logoutput => true,
    }
 
}

class storm::cluster::supervisor {

    require storm::params
    require storm

    exec { "Launch Supervisor":
        command => "bin/storm supervisor &",
        user => "${storm::params::storm_user}",
        cwd => "${storm::params::storm_base}/storm-${storm::params::version}",
        path    => ["/bin", "/usr/bin", "${storm::params::storm_base}/storm-${storm::params::version}", "${java::params::java_base}/jdk${java::params::java_version}/bin"],
        logoutput => true,
    }
 
}

