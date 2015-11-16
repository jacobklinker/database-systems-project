package edu.uiowa.database

public class TimeSlot {
	def time
	def id

	public TimeSlot(String time, int id) {
		this.time = time
		this.id = id
	}

	@Override
	public String toString() {
		return time
	}

	public static def getTimeslots() {
		def timeslots = []
		timeslots << new TimeSlot("8:00", 1)
		timeslots << new TimeSlot("8:30", 2)
		timeslots << new TimeSlot("9:00", 3)
		timeslots << new TimeSlot("9:30", 4)
		timeslots << new TimeSlot("10:00", 5)
		timeslots << new TimeSlot("10:30", 6)
		timeslots << new TimeSlot("11:00", 7)
		timeslots << new TimeSlot("11:30", 8)
		timeslots << new TimeSlot("12:00", 9)
		timeslots << new TimeSlot("12:30", 10)
		timeslots << new TimeSlot("13:00", 11)
		timeslots << new TimeSlot("13:30", 12)
		timeslots << new TimeSlot("14:00", 13)
		timeslots << new TimeSlot("14:30", 14)
		timeslots << new TimeSlot("15:00", 15)
		timeslots << new TimeSlot("15:30", 16)
		timeslots << new TimeSlot("16:00", 17)
		timeslots << new TimeSlot("16:30", 18)
	}
}