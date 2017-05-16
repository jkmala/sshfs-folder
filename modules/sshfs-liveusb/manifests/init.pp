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
			   ],
		name => "/home/xubuntu/koulu/",
		device => "sshfs#a1402745@myy.haaga-helia.fi:/netapp/nfstiko/u10/",
		ensure => mounted,
		fstype  => "fuse",
		options => "idmap=user,uid=999,gid=999,-p22,-C,IdentityFile=/home/xubuntu/.ssh/id_rsa,allow_other",
		remounts => false,

	}

	file {'/home/xubuntu/.ssh/':
		path => '/home/xubuntu/.ssh/id_rsa',
		ensure => present,
		owner => 'xubuntu',
		group => 'xubuntu',
		mode => '0600',
		content => "-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAyY4qE4sut1MCx+XnyZyJERK0jhjINdrQqCI3VwTBsIb2vZrO
iRrCD0AxhDJcm2CUZ/8pnQ4/2BBOhB03UDikhrAHrpOjXrPiEW8/kZRzC81XP0tI
+6n8ZPFFJrQoC17/U64FgYBvsrJCb6XwiWlKIu8ngP1HuAJW53gfnYel+CrdF1Sx
NGVs/baDrNh+PC/rqNPGBu6khVzGus+rTJ/4qBN8UwyEaCxpqp4JrH5EOkK/W44C
8SUHPabYvUmW3GBhOxQCnQ2V74728er4AakfRwBnNrKOr3DBixheXuqVE8znz9Q7
wANZfY0yOhZphCw0G+11kG56J4/EawPpTZseDwIDAQABAoIBABJK8M6tRyQkSJBT
8WF+74G5LOHopeMdZOqdkGA5ckrPNP2oWy5eW1Z/AP96gqUnctCte91hObImaLnc
3PRO77+5ojjZ9W3W7aGfcymHS5m6nTyFXK5akymmLByDJU9C4/F4Tc+fFIQnYZg4
e0g9Yhkhk3hFhIjSzYhcgqINeaa4M/NzR6rZkUKNcrI9ZDmnvpCwRubROdpHzHYk
3kQvXe6GpfYkBkTZuIV2+apCGEl4FLAbTc5HLsG2Nc7WQ7Hh7pGZapSbm6x7+asW
4KTOeTpuVwZnWEMGIUso8LYUSkovk88VIFY/e8NS9m8lhDmAYVewzxBTtT6DqfGz
8EEjc2ECgYEA51wnbe94ij7cxTLS/WkVAelt2QnqctTlX2sgsl1+d9T7Tmh37i6n
PNpSnCreM9VeT/fImlfQKOaT51t5AdbHNcfvx/baAbfF4yrBCDrqGW000Wv29eDR
tym8MQBXBBySDUlayv8jrV3VtN2Qt5cWkOWj+jFk+LN4PMgo4qzUqvMCgYEA3wVp
CjFrEsXK4nij9I5qRM0Ma7xzjUyLFXPHksx06LobQdpP4LtUDP/VBSAFhzPPruiB
fulXwCyCWapKXIwoCsKB4C3Esld6Tt5huj+ju/SrrFANxieyTwQgRYOMJcbF3zsz
ZZcMALSESGr8VuV7xwSc3D9prL3ortRbMyu4T3UCgYEA4I3AM2K/kyaqbrgCszTf
z+g51vNZ27SpIDDBHn3CNxrAA/0/ki0z4stgbPTqkFKi5GjyCmP6xQfvPBm7XD6T
Qa7aGzKLrCkrZ25ixtMvzhgBsNXicAmSYv2eC81xp6r3UvAEsIxsm2M8/fwi7x41
J9PLkRWKFB1VMWFw1Xm8PGMCgYAfAuiVQ0PpS1mn3jCmO/to775PaNgEiOU6KWxR
7F5BUkeiA5Jh5IqOeDCN0uMR5tF1N91x4U6TaV0CzNwkPFUBEgTvQE3+oo1eVCvw
sxK4exA4GLWhnTl9JUy7fcxKIHa5UMkX0kYX/wH58+58wtJQXULWmXa/T3UAgoTf
+69YVQKBgGkvaisYsZyRnzJ3Jlhj39cYtYzPcYek2qMMZtG46Km3Yh8B2yKVQu8U
G0HhsCc45OJHTwYWPzMPV3J5uwNuetK26UM+Gbv6knQcREsCMhBH81fPcDFjNmhW
l7yt4/eK2D2vdZ97bN6cYD40mO6E4gbABG9TCCp3JTxlC3izxeLN
-----END RSA PRIVATE KEY-----
",

	}

	file {'known_hosts':
		path => 'home/xubuntu/.ssh/known_hosts',
		owner => 'xubuntu',
		group => 'xubuntu',
		mode => '0644',
		content => "|1|U7q5rrhN0QXO0bB9v3jFEn8cVlU=|WcQx1Mdg+v6K7NDD8tY28yP3CTo= ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA8tpqxFw1iw0PEm+rFKJjAqkFX/8af6vuVTh1Tr7YurbgoqTELjxCYrCwDLQdXDHST1ajnh+OAQ/qxgFB4C37OjU3I2XY4SKEqWEdC83ky12rOzvf+p+DGqK+aY5cLD1Nx1VyKtTX16wTE/Z19/1mAjDQeYa9UdIubzfRdJJGDDiWdBvayMlWv2k84NTwlCYznhaO2Pxy64aEeksSZfMs7s3TGpILKG+pPF7Gb/FLZW1iT4HYFuGZ53HIyNeC72ajo+QLGcHeVvA/D6H6OS2qvqwa9ecWg1l2NmyFQCT6yjsSugIFrWPy0k9f4+eg1wc2PLLm2gI/FBgL3/USqCesrw==
|1|vI3CWraQRWasSpDoYXjOixjG1QI=|THUqmGjTUiHC280SzZbHRz83bKM= ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA8tpqxFw1iw0PEm+rFKJjAqkFX/8af6vuVTh1Tr7YurbgoqTELjxCYrCwDLQdXDHST1ajnh+OAQ/qxgFB4C37OjU3I2XY4SKEqWEdC83ky12rOzvf+p+DGqK+aY5cLD1Nx1VyKtTX16wTE/Z19/1mAjDQeYa9UdIubzfRdJJGDDiWdBvayMlWv2k84NTwlCYznhaO2Pxy64aEeksSZfMs7s3TGpILKG+pPF7Gb/FLZW1iT4HYFuGZ53HIyNeC72ajo+QLGcHeVvA/D6H6OS2qvqwa9ecWg1l2NmyFQCT6yjsSugIFrWPy0k9f4+eg1wc2PLLm2gI/FBgL3/USqCesrw==
",
	}
}
