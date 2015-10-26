package edu.uiowa.database

import grails.plugin.springsecurity.annotation.Secured

@Secured(["ROLE_ADMIN", "ROLE_MANAGER", "ROLE_USER"])
class LogoutController {
    def index = {
            session.invalidate()
            redirect uri: '/'
    }
}