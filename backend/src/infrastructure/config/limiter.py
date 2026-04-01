from slowapi import Limiter
from slowapi.util import get_remote_address

# Shared instance to avoid circular imports between app.py and controllers
limiter = Limiter(key_func=get_remote_address)
