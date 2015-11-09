package edu.uiowa.database

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService

@Secured('permitAll')
class IndexController {

	def springSecurityService

    def index() {
    	render(view: 'index', model: [
    			currentUser: springSecurityService.currentUser
    		])
    }
}
