(cd /srv/www/$DOMAIN/html; python -m SimpleHTTPServer 80)&
/opt/simp_le/simp_le.py \
  --server https://acme-staging.api.letsencrypt.org/directory \
  --email $EMAIL \
  -d $DOMAIN:/srv/www/$DOMAIN/html \
  -f key.pem -f cert.pem -f fullchain.pem -f account_key.json

