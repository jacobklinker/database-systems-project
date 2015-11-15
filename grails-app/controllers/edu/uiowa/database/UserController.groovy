package edu.uiowa.database

import grails.plugin.springsecurity.annotation.Secured

@Secured(["ROLE_ADMIN", "ROLE_MANAGER", "ROLE_USER"])
class UserController {
    def springSecurityService
    def passwordEncoder
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
    def information = {
            
            def user = User.findByUsername(params.username)
            render( view:'information', model: [ username:user.username, password:user.password, 
                firstname:user.firstName, lastname:user.lastName, birthday:user.birthday,
                gender:user.gender, company:user.company, manager:user.manager] )
            [username:user.username]
    }
    
    def changeInformation = {
            def user = User.findByUsername(params.username)
            render( view:'changeInformation', model: [ username:user.username, password:user.password, 
                firstname:user.firstName, lastname:user.lastName, birthday:user.birthday,
                gender:user.gender, company:user.company, manager:user.manager] )
            
    }
    def passwordPage = {
            
            def user = springSecurityService.currentUser
            def old = params.old
            def inputold = params.inputold
            [username:user.username, old:old, inputold:inputold]
    }
    
    def changePassword = {
            def user = springSecurityService.currentUser
            //def temp = User.findByUsername('temp')
            //temp.password = springSecurityService.encodePassword(params.oldPassword) //cannot encode the password
            String newPassword = params.newPassword
            String confirmPassword = params.confirmPassword 
            if (!passwordEncoder.isPasswordValid(user.password, params.oldPassword, null)) {
                flash.message = 'wrong password!'
            }
            else if(newPassword!=confirmPassword) {
                flash.message = 'password does not fit!'
            }
            else {
                user.password = newPassword
                user.save()
                flash.message = 'password change successfully!'
            }
            redirect (controller:'user',action:'passwordPage',params:[username:user.username, old:user.password])
    }
    def save = {
            def user = User.findByUsername(params.username)
            user.gender = Gender.findById(params.gender)
            user.company = Company.findById(params.company)
            redirect (controller:'user',action:'information',params:[username:user.username])
    }
    def back = {
        redirect(uri: request.getHeader('referer') )
    }
    def cancel = {
            redirect uri: '/'
    }
}