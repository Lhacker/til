h1. Did
* bought 'kiramarsa.xyz' domain
* register 'kiramarsa.xyz' in onamae dns, and linked to my vps server(103.3.188.202)

```sample_of_certbot_option.sh
$ # please expose port 443
$ ./certbot-auto certonly --agree-tos --non-interactive --standalone -d mydomain.com -m mymail@mydomain.com
```

We can install official docker image and use it!
[official doc][https://certbot.eff.org/docs/install.html?highlight=docker#running-with-docker]

```sh
./get_sslcert.sh kiramarsa.xyz shinedwildrock@yahoo.co.jp
```
