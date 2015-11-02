package edu.uiowa.database

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_MANAGER'])
class SignUpController {

    def index() { }

    def finish() { 
    	String username = params.username
    	String password = params.password

    	User u = new User(username, password).save()
    	Role r = Role.findByAuthority('ROLE_USER')

    	boolean created = UserRole.create(u, r, true)

    	if (created) {
    		redirect uri: '/'
    	} else {
    		render 'Failed to create this user'
    	}
    }
}
