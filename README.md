## Ldap Account Admin (lam)

A basic configuration of the Ldap Account Admin.

This image will initialize a basic configuration of LAM.

For example, to start a container running LAM, use the command:

    docker run  -v /data/session:/var/lib/ldap-account-manager/sess \
		-p 80:80 \
	       -d jkpark/docker-ldap-account-manager

Persistent data configuration for LAM is stored in /config if using Persistent data configuration for LAN 

    docker run  -v /data/session:/var/lib/ldap-account-manager/sess \
		-v /data/config:/config \
		-p 80:80 \
	       -d jkpark/docker-ldap-account-manager

you can find lam web ui here. http://localhost/lam
