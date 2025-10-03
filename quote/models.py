from django.db import models

# Create your models here.
class WisdomQuote(models.Model):
  quote_text = models.TextField(default='')
  author = models.CharField(max_length=50)
  reference = models.CharField(max_length=50)