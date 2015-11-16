package edu.uiowa.database

import grails.plugin.springsecurity.annotation.Secured

class UserController {

    def springSecurityService
    def passwordEncoder

    @Secured(["ROLE_ADMIN"])
    def index() {
    	render(view: 'index', model: [users: UserRole.getAll()])
    }

    @Secured(["ROLE_ADMIN"])
    def changeRole() {
    	def user = User.findById(Integer.parseInt(params.id))
    	def userRole = UserRole.findByUser(user)
    	render(view: 'changeRole', model: [user: userRole, roles: Role.findAll()])
    }

    @Secured(["ROLE_ADMIN", "ROLE_MANAGER", "ROLE_USER"])
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

    @Secured(["ROLE_ADMIN", "ROLE_MANAGER", "ROLE_USER"])
    def information() {
        def user
        if (params.username != null) {
            user = User.findByUsername(params.username)
        } else {
            user = User.findById(Integer.parseInt(params.id))
        }

        render(view:'information', model: [username: user.username, password: user.password, 
            firstname: user.firstName, lastname: user.lastName, birthday: user.birthday,
            gender: user.gender, company: user.company, manager: user.manager])
    }
    
    @Secured(["ROLE_ADMIN", "ROLE_MANAGER", "ROLE_USER"])
    def changeInformation() {
            def user = User.findByUsername(params.username)
            render( view:'changeInformation', model: [ username:user.username, password:user.password, 
                firstname:user.firstName, lastname:user.lastName, birthday:user.birthday,
                gender:user.gender, company:user.company, manager:user.manager] )
            
    }

    @Secured(["ROLE_ADMIN", "ROLE_MANAGER", "ROLE_USER"])
    def passwordPage() {
            def user = springSecurityService.currentUser
            def old = params.old
            def inputold = params.inputold
            [username:user.username, old:old, inputold:inputold]
    }
    
    def changePassword() {
            def user = springSecurityService.currentUser
            String newPassword = params.newPassword
            String confirmPassword = params.confirmPassword 

            if (!passwordEncoder.isPasswordValid(user.password, params.oldPassword, null)) {
                flash.message = 'Wrong password!'
            } else if (newPassword!=confirmPassword) {
                flash.message = 'Password does not fit!'
            } else {
                user.password = newPassword
                user.save()
                flash.message = 'Password changed successfully!'
            }

            redirect (controller: 'index')
    }

    def save() {
            def user = User.findByUsername(params.username)
            user.gender = Gender.findById(params.gender)
            user.company = Company.findById(params.company)
            redirect (controller:'user', action:'information', params:[username:user.username])
    }

    def back() {
        redirect(uri: request.getHeader('referer'))
    }

    def cancel() {
        redirect controller: 'index'
    }
    
}