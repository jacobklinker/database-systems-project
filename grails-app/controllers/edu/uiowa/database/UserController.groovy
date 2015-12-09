package edu.uiowa.database

import grails.plugin.springsecurity.annotation.Secured

class UserController {
    def mailService
    def springSecurityService
    def passwordEncoder
    def static order = 'asc'
    
    @Secured(["ROLE_ADMIN"])
    def index() {
        def users = UserRole.getAll()
        def temp = params.sort
        if(order == "asc") {
            switch (params.sort) {
                case {it == 'firstName'} : users.sort{it.user.firstName}; break;
                case {it == 'lastName'} : users.sort{it.user.lastName}; break;
                case {it == 'id'} : users.sort{it.user.id}; break;
                case {it == 'username'} : users.sort{it.user.username}; break;
                case {it == 'role'} : users.sort{it.role.authority}; break;  
            }
            order = "desc"
        }
        else {
            switch (params.sort) {
                case {it == 'firstName'} : users = users.sort{it.user.firstName}.reverse(); break;
                case {it == 'lastName'} : users = users.sort{it.user.lastName}.reverse(); break;
                case {it == 'id'} : users = users.sort{it.user.id}.reverse(); break;
                case {it == 'username'} : users = users.sort{it.user.username}.reverse(); break;
                case {it == 'role'} : users  = users.sort{it.role.authority}.reverse(); break;       
            }
            order = "asc"
        }
       
        render(view: 'index', model: [users: users])
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

        render(view:'information', model: [user:user])
    }
    
    @Secured(["ROLE_ADMIN", "ROLE_MANAGER", "ROLE_USER"])
    def changeInformation() {
        def user
        if (params.username != null) {
            user = User.findByUsername(params.username)
        } else {
            user = User.findById(Integer.parseInt(params.id))
        }
        render( view:'changeInformation', model: [ user:user] )
            
    }

    @Secured(["ROLE_ADMIN", "ROLE_MANAGER", "ROLE_USER"])
    def passwordPage() {
            def user = springSecurityService.currentUser
            render( view:'passwordPage', model: [user:user])
    }
    
    @Secured(["ROLE_ADMIN", "ROLE_MANAGER", "ROLE_USER"])
    def changePassword() {
            def user = springSecurityService.currentUser
            String newPassword = params.newPassword
            String confirmPassword = params.confirmPassword 
            if (!passwordEncoder.isPasswordValid(user.password, params.oldPassword, null)) {
                flash.message = 'Wrong password!'
                redirect action:'passwordPage'
            } else if (newPassword!=confirmPassword) {
                flash.message = 'Password does not fit!'
                redirect action:'passwordPage'
            } else {
                user.password = newPassword
                user.save()
                flash.message = 'Password changed successfully!'
                redirect(controller:'index')
            }

    }
    
    @Secured(["ROLE_ADMIN", "ROLE_MANAGER", "ROLE_USER"])
    def save() {
            def user = User.findById(Integer.parseInt(params.id))
            if(params.company != null) {
                user.company = Company.findById(params.company)
            }
            if(params.email != null) {
                if(user.email != params.email) {
                    user.email = params.email
                    mailService.sendMail {
                                to user.email
                                subject "Your change is successful!"
                                body "You've just changed your email address successfully."
                    }
                }
            }
            redirect (controller:'user', action:'information', params:[user:user, id:user.id])
    }
    
    @Secured(["ROLE_ADMIN", "ROLE_MANAGER"])
    def back() {
        def currentUser = springSecurityService.currentUser
        def userRole = UserRole.findByUser(currentUser)
        if(userRole.role.authority == "ROLE_ADMIN") {
            redirect(controller: 'scanAll', action: 'allUser')
        }
        if (userRole.role.authority == "ROLE_MANAGER") {
            redirect(controller: 'scanAll', action: 'createdBy')
        }
        
    }
    
    @Secured(["ROLE_ADMIN", "ROLE_MANAGER", "ROLE_USER"])
    def backToInformation() {
            def user = User.findById(Integer.parseInt(params.id))
            
            redirect (controller:'user', action:'information', params:[id:user.id])
    }
    @Secured(["ROLE_ADMIN", "ROLE_MANAGER", "ROLE_USER"])
    def sortBy() {
        def manager = springSecurityService.currentUser
        def userRole = UserRole.findByUser(manager)
        def usersCreatedByManager
        if(order == "desc") {
            order = "asc"
        }
        else {
            order = "desc"
        }
        if(userRole.role.authority == "ROLE_ADMIN"){
            usersCreatedByManager = User.list(sort:params.sort, order:order)
        } else {
            usersCreatedByManager = User.findAllByManager(manager,[sort: params.sort, order: order])
        }
        

        render( view:'createdBy', model: [users: usersCreatedByManager])
    }
    
    def cancel() {
        redirect uri: '/'
    }
}