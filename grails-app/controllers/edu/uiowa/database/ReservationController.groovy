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
        def rooms = Resource.findAllByType(ResourceType.findByDescription("Room"))
        [rooms: rooms]
    }

    def submitRoom() {
        def thirty_minutes = 1000 * 60 * 30
        def r = params.room.split(" ")
        def room = Resource.findById(r[r.length - 1])
        def reservations = Reservation.findAllByResource(room)

        def date = params.date
        def availableDates = []

        // get all 30 minute intervals from 8 in the morning til 5 at night
        for (int i = 0; i < 18; i++) {
            availableDates << new Date(date.getTime() + (16 * thirty_minutes) + (i * thirty_minutes))
        }

        // remove available dates if it exists on a reservation already
        reservations.each {
            for (int i = 0; i < availableDates.size(); i++) {
                if (it.time.getTime() == availableDates.get(i).getTime()) {
                    availableDates.remove(i--);
                }
            }
        }

        [dates: availableDates, room: room]
    }

    def saveRoomWithTime() {
        def date = new Date(params.date)
        def room = Resource.findById(params.room)

        new Reservation(user: springSecurityService.currentUser, resource: room, time: date).save(flush: true)
        flash.message = "Reservation created successfully!"
        redirect action: "index"
    }

    def reserveByTime() {

    }

    def changeReservation() {

    }
    
}
