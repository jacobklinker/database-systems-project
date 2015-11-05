package edu.uiowa.database

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class ViewAllController {

    def index() { 
    	render(view: 'index', model: [
    			companies: Company.getAll(),
    			genders: Gender.getAll(),
    			resources: Resource.getAll(),
    			resourceTypes: ResourceType.getAll(),
    			users: User.getAll(),
    			roles: Role.getAll(),
    			reservations: Reservation.getAll()
    		])
    }
}
