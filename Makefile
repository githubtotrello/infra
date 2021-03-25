include ./config/.env
export

gtt:
	GTT_PROXY_CONF=full
	docker-compose --env-file ./config/.env $(filter-out $@,$(MAKECMDGOALS))

certificate:
	mkdir -p data/ssl && openssl dhparam -out data/ssl/dhparam.pem 2048
	GTT_PROXY_CONF=certonly
	docker-compose --env-file ./config/.env up -d gtt_proxy
	docker-compose --env-file ./config/.env run gtt_certbot -c 'certbot certonly --webroot --webroot-path=/var/www/certbot --email ${GTT_ADMIN_EMAIL} --agree-tos --no-eff-email --force-renewal -d ${GTT_HOST}'
	docker-compose --env-file ./config/.env down