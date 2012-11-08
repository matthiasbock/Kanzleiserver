#!/usr/bin/python

import bobo
from smartcard_ui import *

@bobo.query('/')
def index():
	if smartcard_is_present():
		if smartcard_is_locked():
			return enter_pin()
		else:
			return smartcard_menu()
	else:
		return no_smartcard_present()
