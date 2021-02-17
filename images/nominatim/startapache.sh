#!/bin/bash
mv /app/src/build/settings/local_db.php /app/src/build/settings/local.php
export NOMINATIM_SETTINGS='/app/src/build/settings/local.php'

flag=true
while "$flag" = true; do
    pg_isready -h $PG_HOST -p $PG_PORT >/dev/null 2>&2 || continue
    flag=false
    /usr/sbin/apache2ctl -D FOREGROUND &&
        tail -f /var/log/apache2/error.log
done