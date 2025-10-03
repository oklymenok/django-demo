from django.contrib import admin
from django.urls import include, path

urlpatterns = [
    path("quote/", include("quote.urls")),
    path("admin/", admin.site.urls),
]
