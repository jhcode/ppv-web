#!/usr/bin/env bash
certbot --nginx --agree-tos --email devops@mettalloids.com --noninteractive --redirect --expand --domains ${DOMAINS} & > /dev/stdout &

#write out current crontab
crontab -l > mycron
#echo new cron into cron file
echo '13 3 * * * /usr/bin/certbot renew --post-hook "nginx -s reload"' >> mycron
#install new cron file
crontab mycron
rm mycron

# Start the cron process
/etc/init.d/cron start

nginx -g "daemon off;"

