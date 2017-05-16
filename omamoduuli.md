# Oma moduuli - myy-asema sshfs:llä

Tavoitetilana oli saada Haaga-helian myy-palvelimen tiedostot käyttöön, kun käyttää liveusb-tikulta ladattua käyttöjärjestelmää.

Löysin [esimerkkin](https://lessknown.info/2011/08/managing-sshfs-with-puppet/), jonka avulla aloitin projektin. Täältä löytyi myös tieto, että ssh-passprhase pitää olla tyhjä.

Ongelmia:
- SSH avaimet oikeassa paikassa? virheteksti: "connection reset by peer"
- Olisko joku resurssi ssh_keygen?
- ei varmaan ole tietoturvallista säilyttää private avainta github -kansiossa.

[init.pp] (https://github.com/jkmala/sshfs-folder/blob/master/modules/sshfs-liveusb/manifests/init.pp)


Valitettavasti en saanut toimimaan :(
