package edu.uiowa.database

import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
class UserController {

    def index() {
    	render(view: 'index', model: [users: UserRole.getAll()])
    }

    def changeRole() {
    	def user = User.findById(Integer.parseInt(params.id))
    	def userRole = UserRole.findByUser(user)
    	render(view: 'changeRole', model: [user: userRole, roles: Role.findAll()])
    }

    def submit() {
    	def user = User.findById(Integer.parseInt(params.id))
    	def newRole = Role.findByAuthority(params.choose_role)
    	def userRole = UserRole.findByUser(user)
    	def currentRole = userRole.role

    	UserRole.remove user, currentRole
    	def result = UserRole.create user, newRole

    	if (result) {
    		flash.message = "Successfully updated user!"
    	} else {
    		flash.error = "Could not save user!"
    	}

    	redirect action: "index"
    }
}
