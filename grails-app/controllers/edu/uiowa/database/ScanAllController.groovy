package edu.uiowa.database

import grails.plugin.springsecurity.annotation.Secured

@Secured(["ROLE_ADMIN", "ROLE_MANAGER"])
class ScanAllController {
    def springSecurityService
    def index = {
        render(view:'index', model:[user:User.list()])
        
    }

    def createdBy = {
            def manager = springSecurityService.currentUser
            def usersCreatedByManager = User.findByManager(manager)
            if(usersCreatedByManager == null) {
                render 'no user'
            }
            render(view:'createdBy', model:[user:usersCreatedByManager.list()])
            redirect (controller:'scanAll',action:'createdBy',params:[user:user])
    }
    def cancel = {
            redirect uri: '/'
    }
}