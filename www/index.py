import bobo

@bobo.query('/')
def index():
	return bobo.redirect('/jquery.py')

@bobo.query('/jquery.py')
def smartcard():
	reader = 'Fujitsu Siemens Computers SmartCard USB 2A 00 00'
	return open('jquery.html').read() % (reader)
