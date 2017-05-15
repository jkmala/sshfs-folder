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
		device => "sshfs#a1402745@myy.haaga-helia.fi:/netapp/nfstiko/u10/a1402745/",
		ensure => mounted,
		fstype  => "fuse",
		options => "idmap=user,uid=999,gid=999,-p22,-C,IdentityFile=/home/xubuntu/.ssh/id_rsa,allow_other",
		remounts => false,

	}

	sshkey {'haaga-helia':
		ensure => present,
		type => "rsa",
		key => "MIIEogIBAAKCAQEAoyXBAGW/1euKqqfAXcLz3yVMeNwyuQIzfwjt4XMjyxbcIxUg
nHNO/j9UOd+tgc0nMyOxyXJONE+8TjN81UZFcQGJz5MQv6yizY7Isp0Gg8Ajg5CZ
dFzLt4cjvEcpuk5OmoJYOBvrVlACFd6lBrvdUrAFSnBWbtlZfqdA5NjLh0npdRKS
2CxVAyigCz3mjbf1gpS3lDa4RqRzo1a2j0FzlowDmLqo12qOoKlkhLl+6F/4poN9
kic9j6sygdycgvNEdUZSiy+mXlkEN0ze788ZAFKNZQfRFWtcUh8DIukngSUaWvRq
1Exrj1DB/RVTWKyfA3WyoZcnzubvZtz1eZqS/wIDAQABAoIBABBMTjqO75ocPK8N
sQ7s0dYB8ODGBp8q1CAlsTXrfbDlKLqseqSGdGa7xts9OCUWbIsUTsd0DtH1ATfC
tv7LVVaTs8OzymGLinwEfpIxU5xHzoRvJpVUS9mau3wsk8OT3RBcYxm/2EO4HG04
372LePGwueaU0F2kguc/KCF0cuih1cUEUqxh/mbuMhK4uGtr/qOjMeLnB1ffgBfC
Na/VfL6TEGZpAqxG7i0k4Ymx7I/Oo1eWM8CJXZbAWRDddSuRL7I2nQCm4blwf0Gp
FpRHiGvseMX7ZZwOb8HeeCInRS+xsRpwtD8p242SdEBgnvjsIg29/qPGHIQNss/A
cfSLGEECgYEAz/jXGdOG3RttcliWJVKrpKDUag64PeVv/t2H6svXXoIBeKr0xKWA
wvV2dUgOYxai3yueq7Bmsjc2uxJWNJvkMZIKaZBdFs/830Scvhm88/9AJDWBVW1W
zS1Y4pqw9iRsqE/yObOaRFFO7AW7XiE9AdahgKfvvb8bm1AWuxzNSqECgYEAyNLq
5VeEKXhEdw5leLrvJMANRiCdUd++pL2VppNj9bfWjsgGDefKpxsHMSPmGnYTeEEU
eMdkkmEZU8QzAAwJCrMgabtdW5O/UY6c4XoPTULicdk4h6SjNciuHlFsB1Q9el3V
eLp6wcuOQe7fDAfiTPtm9/8FSV23RkS1gPsfmZ8CgYB7BKjIABVwSL8OulPmM+aP
9QpwydA13LfIvGWff4AfySrxo74xa+ykZenyKfNIraUd+YFb8XZtyLc5JPmVGPl8
UPSTyO8nhVQBBWbqE/NvKPdZ88RTMd/8cex37iTrFFSpotCXTSPdcXMLrcBNR7/8
jGbv4WawiJDd6BvqBnlwwQKBgBWgsW91l2Qn8aeow0DXUP3yOPu+c3Ln185CJKXF
5dQGsnK6E/zXY7nPbVzbcuKSqNIgoCXJw4kIMAQXcy6kHS0r0WfRp+I+7THJXBfk
X1WAyIZeUHo7PuCB9k6JkkrPxbcx99WCr8nDNFThduAC0VpdEN/QdS9Lintk1u9H
HEYdAoGAbaQCi5P0saYz+At3YZM3xDCmHbjDM19QKU25RoqebU9yrlcfM+LhErhi
r4qwHTnJmZHnJUlkxJzneoFNYEP8+6cqpyYgD4sBqX14fvSQ/nf/2mtds/XN6cfq
xuBSsazTdN0ExQ8t74ZlIIWf+ibq17HzqwoiDh87BxTogvSgY6s="

}
}
