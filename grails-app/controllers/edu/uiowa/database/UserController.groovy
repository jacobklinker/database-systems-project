package edu.uiowa.database

import grails.plugin.springsecurity.annotation.Secured

@Secured(["ROLE_ADMIN", "ROLE_MANAGER", "ROLE_USER"])
class UserController {
    def passwordEncoder
    def index = {
        render(view:'index', model:[user:User.list()])
        
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
            def user = User.findByUsername(params.username)
            def old = params.old
            def inputold = params.inputold
            [username:user.username, old:old, inputold:inputold]
    }
    
    def changePassword = {
            def user = User.findByUsername(params.username)
            //def temp = User.findByUsername('temp')
            //temp.password = springSecurityService.encodePassword(params.oldPassword) //cannot encode the password
            String newPassword = params.newPassword
            String confirmPassword = params.confirmPassword 
            if (!passwordEncoder.isPasswordValid(user.password, params.oldPassword, null)) {
                flash.message = 'wrong password'
            }
            else if(newPassword!=confirmPassword) {
                flash.message = 'password does not fit'
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
            user.firstName = params.firstname
            user.lastName = params.lastname
            user.gender = params.gender
            user.birthday = params.birthday
            user.company = params.company
            redirect (controller:'user',action:'information',params:[username:user.username])
    }
    
    def viewAll = {
            def manager = 
            render(view:'viewAll', model:[user:User.findByManager().list()])
    }
    def cancel = {
            redirect uri: '/'
    }
}