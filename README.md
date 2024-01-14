# Custom `j3` alpine packages repo

To use this repository:

```
echo '@j3 https://alpine.j3.network/j3' >> /etc/apk/repositories
wget -O /etc/apk/keys/justin@justin.cm-65a459e9.rsa.pub https://alpine.j3.network/justin@justin.cm-65a459e9.rsa.pub
apk update
```
