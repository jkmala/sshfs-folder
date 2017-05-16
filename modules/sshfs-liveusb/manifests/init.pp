class sshfs-liveusb {
	file {'/home/xubuntu/koulu/':
		ensure => 'directory',
		mode => '0700',
		owner => 'xubuntu',
		group => 'xubuntu',
	}

	package {sshfs:
		ensure => "installed",
		allowcdrom => true,
	}
	
	mount {"kouludir":
		require => [
				File['/home/xubuntu/koulu/'],
				Package['sshfs'],
				File ['/home/xubuntu/.ssh/id_rsa'],
				File ['/home/xubuntu/.shh/known_hosts'],
			   ],
		name => "/home/xubuntu/koulu/",
		device => "sshfs#a1402745@myy.haaga-helia.fi:/netapp/nfstiko/u10/",
		ensure => mounted,
		fstype  => "fuse",
		options => "idmap=user,uid=999,gid=999,-p22,-C,IdentityFile=/home/xubuntu/.ssh/id_rsa,allow_other",
		remounts => false,

	}

	file {'/home/xubuntu/.ssh/id_rsa':
		ensure => file,
		replace => 'true',
		owner => 'xubuntu',
		group => 'xubuntu',
		mode => '0600',
		content => template('sshfs-liveusb/id_rsa.erb'),
	}

	file {'/home/xubuntu/.shh/known_hosts':
		ensure => file,
		replace => 'true',
		owner => 'xubuntu',
		group => 'xubuntu',
		mode => '0644',
		content => template('sshfs-liveusb/known_hosts.erb'),

	}
}
