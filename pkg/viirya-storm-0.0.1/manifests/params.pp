# /etc/puppet/modules/storm/manafests/init.pp

class storm::params {

	include java::params

	$version = $::hostname ? {
		default			=> "0.8.1",
	}

 	$storm_user = $::hostname ? {
		default			=> "hduser",
	}
 
 	$storm_group = $::hostname ? {
		default			=> "storm",
	}
 
	$nimbus_host = $::hostname ? {
		default			=> "nimbus.host",
	}
       
	$zookeeper_servers = $::hostname ? {
		default			=> ["server1", "server2", "server3"] 
	}
 
	$java_home = $::hostname ? {
		default			=> "${java::params::java_base}/jdk${java::params::java_version}",
	}

	$storm_base = $::hostname ? {
		default			=> "/opt/storm",
	}
 
	$storm_conf = $::hostname ? {
		default			=> "${storm_base}/storm/conf",
	}
 
    $storm_user_path = $::hostname ? {
		default			=> "/home/${storm_user}",
	}             

    $storm_local_path = $::hostname ? {
		default			=> "/mnt/storm",
	}             

}
