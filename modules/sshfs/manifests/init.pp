class sshfs {
	file {'/home/xubuntu/koulu/':
		ensure => 'directory',
	}

	package {sshfs:
		ensure => "installed",
		allowcdrom => true,
	}
	
	mount {"kouludir":
		require => File['/home/xubuntu/koulu/'],
		name => "/home/xubuntu/koulu/",
		atboot => true,
		device => "sshfs#a1402745@myy.haaga-helia.fi:/netapp/nfstiko/u10/a1402745/",
		ensure => "mounted",
		fstype  => "fuse",
		options => "idmap=user,uid=999,gid=999",
		dump => "0",
		pass => "0",
		remounts => false,

	}
}
