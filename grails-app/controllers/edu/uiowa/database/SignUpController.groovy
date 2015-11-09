package edu.uiowa.database

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_MANAGER'])
class SignUpController {
    def springSecurityService

    def index() {
        String password = params.password
        String confirm = params.confirm
        render( view:'index', model: [ password:password, confirm:confirm] )
        }
    
    def information() { }
    
    def createAccount() { 
        String firstname = params.firstname
        String lastname = params.lastname
    	String username = params.username
    	String password = params.password
        String confirm = params.confirm
        def createdBy = springSecurityService.currentUser

        //Gender gender = params.gender
        //Date birthday = params.birthday
        //Company company = params.company
        if(password == confirm) {
                User u = new User(username, password,firstname,lastname).save()
                Role r = Role.findByAuthority('ROLE_USER')
                boolean created = UserRole.create(u, r, true)
                u.manager = createdBy
                if (created) {
                        flash.message = "user created!"
                        //u.gender = gender
                        //u.birthday = birthday
                        //u.company = company
                        redirect (controller:'user',action:'information',params:[username:username])
                } else {
                        render 'Failed to create this user'
                }
        } else {
                flash.message ='password does not fit'
        }
        
        
    }
}
