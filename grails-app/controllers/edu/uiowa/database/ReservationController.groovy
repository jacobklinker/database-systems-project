package edu.uiowa.database

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class ReservationController {

	def springSecurityService

    def index() {
    	render(view: "index", model: [reservationList: Reservation.findAllByUser(springSecurityService.currentUser)])
    }
}
