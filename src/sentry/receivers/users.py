from __future__ import absolute_import, print_function

from django.db import router
from django.db.models.signals import post_migrate


def create_first_user(app_config, using, interactive, **kwargs):
    if app_config and app_config.name != "sentry":
        return

    try:
        User = app_config.get_model("User")
    except LookupError:
        return

    if User.objects.filter(is_superuser=True).exists():
        return

    if hasattr(router, "allow_migrate"):
        if not router.allow_migrate(using, User):
            return
    else:
        if not router.allow_syncdb(using, User):
            return
    if not interactive:
        return

post_migrate.connect(create_first_user, dispatch_uid="create_first_user", weak=False)
