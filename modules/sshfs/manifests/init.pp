class sshfs {
	file {'/home/juhaku/koulu/':
		ensure => 'directory',
		mode => '0755',
		owner => 'juhaku',
		group => 'juhaku',
	}

	package {sshfs:
		ensure => "installed",
		allowcdrom => true,
	}
	
	mount {"kouludir":
		require => [
				File['/home/juhaku/koulu/'],
				Package['sshfs'],
			   ],
		name => "/home/juhaku/koulu/",
		device => "sshfs#a1402745@myy.haaga-helia.fi:/netapp/nfstiko/u10/a1402745/",
		ensure => "mounted",
		fstype  => "fuse",
		options => "idmap=user,uid=1000,gid=1000,-p22,-C,IdentityFile=/home/juhaku/.ssh/id_rsa,allow_other",
		remounts => false,

	}
}
