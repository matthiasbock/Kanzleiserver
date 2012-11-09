#!/usr/bin/python

def smartcard_is_present():
	return True

def smartcard_is_locked():
	return True

def no_smartcard_present():
	return None

def enter_pin():
	reader = 'Fujitsu Siemens Computers SmartCard USB 2A 00 00'
	return open('smartcard_enter_pin.html').read() % (reader, 'Test')

def smartcard_menu():
	reader = 'Fujitsu Siemens Computers SmartCard USB 2A 00 00'
	return open('smartcard_menu.html').read() % (reader)
