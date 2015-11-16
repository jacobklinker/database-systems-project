package edu.uiowa.database

import grails.plugin.springsecurity.annotation.Secured

@Secured(["ROLE_ADMIN", "ROLE_MANAGER"])
class ScanAllController {

    def springSecurityService

    def index() {
        render(view:'index', model: [user: User.list()])
    }

    def createdBy() {
            def manager = springSecurityService.currentUser
            def usersCreatedByManager = User.findAllByManager(manager)

            render(view:'createdBy', model: [user: usersCreatedByManager])
    }

    def cancel() {
            redirect controller: "index"
    }
}