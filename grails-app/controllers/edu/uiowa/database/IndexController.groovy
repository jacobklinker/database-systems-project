package edu.uiowa.database

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService

@Secured('permitAll')
class IndexController {

	def springSecurityService
    def mailService

    def index() {
    	render(view: 'index', model: [
    			currentUser: springSecurityService.currentUser
    		])
    }
    
    def back() {
        def targetUri = params.targetUri ?: "/"
        redirect(uri: targetUri)
    }

    def email() {
        mailService.sendMail {
            to "jklinker1@gmail.com"
            subject "test email"
            text "just trying this config out..."
        }

        redirect action: 'index'
    }
}
