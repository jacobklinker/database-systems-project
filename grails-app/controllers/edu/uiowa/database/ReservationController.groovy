package edu.uiowa.database

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_USER', 'ROLE_MANAGER', 'ROLE_ADMIN'])
class ReservationController {

	def springSecurityService

    def index() {
    	render(view: "index", model: [reservations: Reservation.findAllByUser(springSecurityService.currentUser)])
    }

    def createReservation() {
    	render(view: "createReservation")
    }

    def reserveByRoom() {

    }

    def reserveByTime() {

    }

    def changeReservation() {

    }
    
}
