#!/bin/bash
set -e

# ------------------------------------------------------------------
if [[ "${COLLECT_STATIC}" == "true" ]];then
  echo "==> Running collectstatic (no-input)"
  python manage.py collectstatic --no-input --clear
fi

if [[ "${MIGRATE}" == "true" ]];then
  echo "==> Applying migrations"
  python manage.py migrate --no-input
fi

# ------------------------------------------------------------------
# Optional: create superuser / seed data only in fresh DB
# ------------------------------------------------------------------
# python manage.py createsuperuser --no-input || true
# python manage.py seed_data || true

exec python manage.py runserver 0.0.0.0:8000
