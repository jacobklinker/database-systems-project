package edu.uiowa.database

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class ReservationController {

    def index() {
    	render(view: "index", model: [reservationList: Reservation.find(reservation.user.username = this.username)])
    }
}
