package edu.uiowa.database

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class UserController {

    def index() {
    	render(view: "index", model: [userList: User.getAll()])
    }
}
