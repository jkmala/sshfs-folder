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
		atboot => true,
		device => "sshfs#a1402745@myy.haaga-helia.fi:/netapp/nfstiko/u10/a1402745/",
		ensure => "mounted",
		fstype  => "fuse",
		options => "idmap=user,uid=999,gid=999,-p22,-C",
		dump => "0",
		pass => "0",
		remounts => false,

	}
}
