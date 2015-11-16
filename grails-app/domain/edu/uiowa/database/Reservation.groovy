package edu.uiowa.database

class Reservation {

	Date time
	User user
	Resource resource

    static constraints = {
    }

    static mapping = {
	    sort "time"
	}
}
