package edu.uiowa.database

import grails.plugin.springsecurity.annotation.Secured
import grails.util.Environment


class ReportsController {

	def springSecurityService
	def mailService

	@Secured(['ROLE_ADMIN'])
    def index() {
    	def managerRole = Role.findByAuthority("ROLE_MANAGER")
    	def managers = UserRole.findAllByRole(managerRole)

    	managers.each { manager ->
    		if (manager.user.email != null) {
    			def text = "${springSecurityService.currentUser.firstName} ${springSecurityService.currentUser.lastName} has generated " +
    					"a monthly reservation report for your users. To view it, visit ";

    			if (Environment.current == Environment.DEVELOPMENT) {
    				text += "http://localhost:8080/reports/viewReport"
    			} else {
    				text += "http://173.17.168.19:8181/databasesystems/reports/viewReport"
    			}

    			mailService.sendMail {
    				to manager.user.email
    				subject 'Monthly Reservation Reporting'
    				body text
    			}
    		}
    	}

    	flash.message = "Generated report for all managers and notified them through email."
    	redirect controller: 'index'
    }

	@Secured(['ROLE_ADMIN', 'ROLE_MANAGER'])
    def viewReport() {
    	render text: "view report here"
    }

}
