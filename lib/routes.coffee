Router.configure
	layoutTemplate: 'layout'
	loadingTemplate: 'loading'

Router.map ->

	@route 'home',
		path: '/'
		
	@route 'admin',
		path: '/admin',
		controller: AdminController
		
	@route 'manageForm',
		path: '/admin/manageform',
		controller: AdminController