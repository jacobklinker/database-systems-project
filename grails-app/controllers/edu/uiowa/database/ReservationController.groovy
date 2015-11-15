package edu.uiowa.database

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class ReservationController {

	def springSecurityService

    def index() {
    	render(view: "index", model: [reservations: Reservation.findAllByUser(springSecurityService.currentUser)])
    }

    def createReservation() {
    	render(view: "createReservation")
    }
}
