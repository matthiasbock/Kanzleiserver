import bobo

@bobo.query('/')
def index():
	return bobo.redirect('/smartcard.py')

@bobo.query('/smartcard.py')
def smartcard():
	return open('smartcard.html').read() % {'test':'abc'}
