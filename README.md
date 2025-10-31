# Setup on Heroku

Update static files settings

```
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
STATIC_URL = 'static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'staticfiles')
```

Set secret key

```
heroku config:set SECRET_KEY='very secret key'
```

Update secret key in settings


```
vim demo/settings.py
SECRET_KEY = os.environ.get('SECRET_KEY', 'django-insecure-key')
```

Update ALLOWED_HOSTS

```
ALLOWED_HOSTS = ['django-demo-******.herokuapp.com']

```

Setup runtime

```
echo python-3.13.7 > runtime.txt

```

Specify a process to run

```
vim Procfile
web: gunicorn demo.wsgi
```

Test the setup localy

```
heroku local
```

Commit changes and deploy app

```
git commit -a -m "First commit"
git push heroku main
```

Open application in your browser

```
heroku open
```

Apply migrations and populate DB for tests

```
heroku run python manage.py shell
```
