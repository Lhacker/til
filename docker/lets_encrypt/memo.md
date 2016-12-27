h1. Did
* bought 'kiramarsa.xyz' domain
* register 'kiramarsa.xyz' in onamae dns, and linked to my vps server(103.3.188.202)

```sample_of_certbot_option.sh
$ # please expose port 443
$ ./certbot-auto certonly --agree-tos --non-interactive --standalone -d mydomain.com -m mymail@mydomain.com
```
