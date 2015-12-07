package edu.uiowa.database

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_USER', 'ROLE_MANAGER', 'ROLE_ADMIN'])
class ReservationController {

	def springSecurityService
    def mailService

    def index() {
        def myReservations = Reservation.findAllByUser(springSecurityService.currentUser)
        def myWaitlists = Waitlist.findAllByUser(springSecurityService.currentUser)
        def mySubordinatesReservations = []
        def myUsers = User.findAllByManager(springSecurityService.currentUser)

        if (myUsers != null && myUsers.size() > 0) {
            myUsers.each { user ->
                def reservations = Reservation.findAllByUser(user)
                reservations.each {
                    mySubordinatesReservations << it
                }
            }
        }

    	render(view: "index", model: [reservations: myReservations, subordinatesReservations: mySubordinatesReservations, waitlists: myWaitlists])
    }

    def createReservation() {
        def myReservations = Reservation.findAllByUser(springSecurityService.currentUser)

        if (myReservations.size() >= springSecurityService.currentUser.reservationLimit) {
            render(view: "overReservationLimit")
        } else {
            render(view: "createReservation")
        }
    }

    def reserveByRoom() {
        def rooms = []
        
        if (params.resourceType == null) {
            rooms = Resource.findAllByType(ResourceType.findByDescription("Room"))
        } else {
            def t = params.resourceType.split(' ')
            def type = ResourceType.findById(t[t.length - 1])
            def resources = Resource.findAllByType(type)

            resources.each { resource ->
                boolean contains = false
                rooms.each { room ->
                    if (resource.parent.id == room.id) {
                        contains = true
                    }
                }

                if (!contains) {
                    rooms << resource.parent
                }
            }
        }
        
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

        def takenDates = []
        // remove available dates if it exists on a reservation already
        reservations.each {
            for (int i = 0; i < availableDates.size(); i++) {
                if (it.time.getTime() == availableDates.get(i).getTime()) {
                    takenDates << availableDates.remove(i--)
                }
            }
        }

        [dates: availableDates, room: room, waitlistDates: takenDates]
    }

    def saveRoomWithTime() {
        def date = new Date(params.date)
        def room = Resource.findById(params.room)

        new Reservation(user: springSecurityService.currentUser, resource: room, time: date).save(flush: true)
        flash.message = "Reservation created successfully!"

        if (springSecurityService.currentUser.email != null) {
            mailService.sendMail {
                to springSecurityService.currentUser.email
                subject "New Reservation Scheduled!"
                text "You've just scheduled a new reservation for ${room.description} on ${date}."
            }
        }
        
        redirect action: "index"
    }

    def saveRoomWithTimeWaitlist() {
        def date = new Date(params.date)
        def room = Resource.findById(params.room)
        def reservation = Reservation.findByResourceAndTime(room, date)

        if (reservation == null) {
            flash.message = "Error finding this reservation, not added to waitlist."
        } else {
            new Waitlist(reservation: reservation, user: springSecurityService.currentUser).save(flush: true)
            flash.message = "Added to the waitlist for this reservation, you'll be notified if this time opens up."
        }

        redirect action: "index"
    }

    def reserveByTime() {
        def timeslots = TimeSlot.getTimeslots()
        [timeslots: timeslots]
    }

    def submitTime() {
        def date = params.date
        def timeParts = params.time.split(':')
        date.setHours(Integer.parseInt(timeParts[0]))
        date.setMinutes(Integer.parseInt(timeParts[1]))
        
        def reservations = Reservation.findAllByTime(date)
        def rooms = Resource.findAllByType(ResourceType.findByDescription("Room"))

        reservations.each {
            for (int i = 0; i < rooms.size(); i++) {
                if (rooms.get(i).id == it.resource.id) {
                    rooms.remove(i--);
                }
            }
        }

        [rooms: rooms, date: date]
    }

    def reserveByResource() {
        def resourceTypes = []
        resourceTypes << ResourceType.findByDescription("Computer")
        resourceTypes << ResourceType.findByDescription("Projector")
        resourceTypes << ResourceType.findByDescription("Computer Rack")

        [types: resourceTypes]
    }

    def changeReservation() {
        def reservation = Reservation.findById(params.id)
        def waitlists = Waitlist.findByReservation(reservation)

        waitlists.each {
            mailService.sendMail {
                to springSecurityService.currentUser.email
                subject "Waitlist Opened Up!"
                text "A reservation was just removed that you were on the waitlist for, jump on it now to pick it up before someone else does!\n\n${reservation.resource.description}, ${reservation.time}"
            }

            it.delete()
        }

        reservation.delete()
        redirect action: 'reserveByRoom'
    }

    def recureserveByDay() {
        def timeslots = TimeSlot.getTimeslots()
        [timeslots: timeslots]
    }

    def recureserveByWeek() {
        def timeslots = TimeSlot.getTimeslots()
        [timeslots: timeslots]
    }

    def recureserveByMonth() {
        def timeslots = TimeSlot.getTimeslots()
        [timeslots: timeslots]
    }

    def submitRecureserveTimeDay(){
        def date = params.date
        def timeParts = params.time.split(':')
        date.setHours(Integer.parseInt(timeParts[0]))
        date.setMinutes(Integer.parseInt(timeParts[1]))
        
        def reservations = Reservation.findAllByTime(date)
        def rooms = Resource.findAllByType(ResourceType.findByDescription("Room"))

        reservations.each {
            for (int i = 0; i < rooms.size(); i++) {
                if (rooms.get(i).id == it.resource.id) {
                    rooms.remove(i--);
                }
            }
        }

        [rooms: rooms, date: date]
    }

    def submitRecureserveTimeWeek(){
        def date = params.date
        def timeParts = params.time.split(':')
        date.setHours(Integer.parseInt(timeParts[0]))
        date.setMinutes(Integer.parseInt(timeParts[1]))
        
        def reservations = Reservation.findAllByTime(date)
        def rooms = Resource.findAllByType(ResourceType.findByDescription("Room"))

        reservations.each {
            for (int i = 0; i < rooms.size(); i++) {
                if (rooms.get(i).id == it.resource.id) {
                    rooms.remove(i--);
                }
            }
        }

        [rooms: rooms, date: date]
    }

    def submitRecureserveTimeMonth(){
        def date = params.date
        def timeParts = params.time.split(':')
        date.setHours(Integer.parseInt(timeParts[0]))
        date.setMinutes(Integer.parseInt(timeParts[1]))
        
        def reservations = Reservation.findAllByTime(date)
        def rooms = Resource.findAllByType(ResourceType.findByDescription("Room"))

        reservations.each {
            for (int i = 0; i < rooms.size(); i++) {
                if (rooms.get(i).id == it.resource.id) {
                    rooms.remove(i--);
                }
            }
        }

        [rooms: rooms, date: date]
    }

    def saveRecureserveByDay() {
        def date = new Date(params.date)
        def room = Resource.findById(params.room)

        new Reservation(user: springSecurityService.currentUser, resource: room, time: date).save(flush: true)
        new Reservation(user: springSecurityService.currentUser, resource: room, time: date+1).save(flush: true)
        new Reservation(user: springSecurityService.currentUser, resource: room, time: date+2).save(flush: true)
        flash.message = "Recurring Reservation created successfully!"

        if (springSecurityService.currentUser.email != null) {
            mailService.sendMail {
                to springSecurityService.currentUser.email
                subject "New Reservation Scheduled!"
                text "You've just scheduled a new reservation for ${room.description} on ${date}."
            }
        }
        
        redirect action: "index"
    }

    def saveRecureserveByWeek(){
        def date = new Date(params.date)
        def room = Resource.findById(params.room)

        new Reservation(user: springSecurityService.currentUser, resource: room, time: date).save(flush: true)
        new Reservation(user: springSecurityService.currentUser, resource: room, time: date+7).save(flush: true)
        new Reservation(user: springSecurityService.currentUser, resource: room, time: date+14).save(flush: true)
        flash.message = "Recurring Reservation created successfully!"

        if (springSecurityService.currentUser.email != null) {
            mailService.sendMail {
                to springSecurityService.currentUser.email
                subject "New Reservation Scheduled!"
                text "You've just scheduled a new reservation for ${room.description} on ${date}."
            }
        }
        
        redirect action: "index"
    }

    def saveRecureserveByMonth() {
        def date = new Date(params.date)
        def room = Resource.findById(params.room)

        new Reservation(user: springSecurityService.currentUser, resource: room, time: date).save(flush: true)
        new Reservation(user: springSecurityService.currentUser, resource: room, time: date+30).save(flush: true)
        new Reservation(user: springSecurityService.currentUser, resource: room, time: date+60).save(flush: true)
        flash.message = "Recurring Reservation created successfully!"

        if (springSecurityService.currentUser.email != null) {
            mailService.sendMail {
                to springSecurityService.currentUser.email
                subject "New Reservation Scheduled!"
                text "You've just scheduled a new reservation for ${room.description} on ${date}."
            }
        }
        
        redirect action: "index"
    }
}
