import edu.uiowa.database.User
import edu.uiowa.database.Role
import edu.uiowa.database.UserRole
import edu.uiowa.database.Company
import edu.uiowa.database.Gender
import edu.uiowa.database.Reservation
import edu.uiowa.database.Resource
import edu.uiowa.database.ResourceType
import java.util.Date

class BootStrap {

    def init = { servletContext ->
    	def adminRole = new Role('ROLE_ADMIN').save()
    	def managerRole = new Role('ROLE_MANAGER').save()
    	def userRole = new Role('ROLE_USER').save()

    	def testUser = new User('admin', 'password', 'Jake', 'Klinker').save()
        def manager = new User('manager', 'password', 'Jake', 'Klinker').save()
        def user = new User('user', 'password', 'Jake', 'Klinker').save()

    	UserRole.create(testUser, adminRole, true)
        UserRole.create(manager, managerRole, true)
        UserRole.create(user, userRole, true)

        def male = new Gender(name: 'Male').save()
        def female = new Gender(name: 'Female').save()

        def wellsFargo = new Company(name: 'Wells Fargo').save()
        def google = new Company(name: 'Google').save()
        def apple = new Company(name: 'Apple').save()

        def building = new ResourceType(description: 'Building').save()
        def room = new ResourceType(description: 'Room').save()
        def computerRack = new ResourceType(description: 'Computer Rack').save()
        def computer = new ResourceType(description: 'Computer').save()

        def building1 = new Resource(description: 'Campus Building 1', 
        						quality: 'Built in 1987', 
        						parent: null,
        						type: building).save()
        def building2 = new Resource(description: 'Campus Building 2',
        						quality: 'Built in 1999',
        						parent: null,
        						type: building).save()
        def building3 = new Resource(description: 'Campus Building 3',
        						quality: 'Built in 2007',
        						parent: null,
        						type: building).save()
        def room1 = new Resource(description: 'Room 111',
        						quality: 'Clean',
        						parent: building1,
        						type: room).save()
        def room2 = new Resource(description: 'Room 122',
        						quality: 'Wood floors',
        						parent: building1,
        						type: room).save()
        def room3 = new Resource(description: 'Room 123',
        						quality: 'Carpet and asbestos',
        						parent: building1,
        						type: room).save()
        def room4 = new Resource(description: 'Room 215',
        						quality: 'Dirty and old',
        						parent: building2,
        						type: room).save()
        def room5 = new Resource(description: 'Room 217',
        						quality: 'Carpets Cleaned',
        						parent: building2,
        						type: room).save()
        def room6 = new Resource(description: 'Room 220',
        						parent: building2,
        						type: room).save()
        def room7 = new Resource(description: 'Room 322',
        						parent: building3,
        						type: room).save()
        def room8 = new Resource(description: 'Room 338',
        						quality: 'Recently cleaned',
        						parent: building3,
        						type: room).save()
        def room9 = new Resource(description: 'Computer Lab 352',
        						quality: 'Refubished',
        						parent: building3,
        						type: room).save()
        def computerRack1 = new Resource(description: 'Computer Rack for Room 123',
        						quality: 'Branch new',
        						parent: room3,
        						type: computerRack).save()
        def computerRack2 = new Resource(description: 'Computer Rack for Room 220',
        						quality: 'Old',
        						parent: room6,
        						type: computerRack).save()
        def computer1 = new Resource(description: 'Computer for Room 111',
        						quality: 'New',
        						parent: room1,
        						type: computer).save()
        def computer2 = new Resource(description: 'Computer for Room 122',
        						quality: 'New',
        						parent: room2,
        						type: computer).save()
        def computer3 = new Resource(description: 'Computer for Room 123',
        						quality: 'New',
        						parent: room3,
        						type: computer).save()
		def computer4 = new Resource(description: 'Computer for Room 215',
        						quality: 'New',
        						parent: room4,
        						type: computer).save()
		def computer5 = new Resource(description: 'Computer for Room 217',
        						quality: 'New',
        						parent: room5,
        						type: computer).save()
		def computer6 = new Resource(description: 'Computer for Room 220',
        						quality: 'New',
        						parent: room6,
        						type: computer).save()
		def computer7 = new Resource(description: 'Computer for Room 322',
        						quality: 'New',
        						parent: room7,
        						type: computer).save()
		def computer8 = new Resource(description: 'Computer for Room 338',
        						quality: 'New',
        						parent: room8,
        						type: computer).save()
		def computer9 = new Resource(description: 'Computer 1 for Rack 1',
        						quality: 'Used',
        						parent: computerRack1,
        						type: computer).save()
		def computer10 = new Resource(description: 'Computer 2 for Rack 1',
        						quality: 'Used',
        						parent: computerRack1,
        						type: computer).save()
		def computer11 = new Resource(description: 'Computer 3 for Rack 1',
        						quality: 'Used',
        						parent: computerRack1,
        						type: computer).save()
		def computer12 = new Resource(description: 'Computer 4 for Rack 1',
        						quality: 'Used',
        						parent: computerRack1,
        						type: computer).save()
		def computer13 = new Resource(description: 'Computer 5 for Rack 1',
        						quality: 'Used',
        						parent: computerRack1,
        						type: computer).save()
		def computer14 = new Resource(description: 'Computer 1 for Rack 2',
        						quality: 'Used',
        						parent: computerRack1,
        						type: computer).save()
		def computer15 = new Resource(description: 'Computer 2 for Rack 2',
        						quality: 'Used',
        						parent: computerRack1,
        						type: computer).save()
		def computer16 = new Resource(description: 'Computer 3 for Rack 2',
        						quality: 'Used',
        						parent: computerRack1,
        						type: computer).save()
		def computer17 = new Resource(description: 'Computer 4 for Rack 2',
        						quality: 'Used',
        						parent: computerRack1,
        						type: computer).save()
		def computer18 = new Resource(description: 'Computer 5 for Rack 2',
        						quality: 'Used',
        						parent: computerRack1,
        						type: computer).save()
		def computer19 = new Resource(description: 'Computer 1 for Lab 352',
        						quality: 'Used',
        						parent: computerRack1,
        						type: computer).save()
		def computer20 = new Resource(description: 'Computer 2 for Lab 352',
        						quality: 'Used',
        						parent: computerRack1,
        						type: computer).save()
		def computer21 = new Resource(description: 'Computer 3 for Lab 352',
        						quality: 'Used',
        						parent: computerRack1,
        						type: computer).save()
		def computer22 = new Resource(description: 'Computer 4 for Lab 352',
        						quality: 'Used',
        						parent: computerRack1,
        						type: computer).save()
		def computer23 = new Resource(description: 'Computer 5 for Lab 352',
        						quality: 'Used',
        						parent: computerRack1,
        						type: computer).save()
		def computer24 = new Resource(description: 'Computer 6 for Lab 352',
        						quality: 'Used',
        						parent: computerRack1,
        						type: computer).save()
		def computer25 = new Resource(description: 'Computer 7 for Lab 352',
        						quality: 'Used',
        						parent: computerRack1,
        						type: computer).save()
		def computer26 = new Resource(description: 'Computer 8 for Lab 352',
        						quality: 'Used',
        						parent: computerRack1,
        						type: computer).save()
		def computer27 = new Resource(description: 'Computer 9 for Lab 352',
        						quality: 'Used',
        						parent: computerRack1,
        						type: computer).save()
		def computer28 = new Resource(description: 'Computer 10 for Lab 352',
        						quality: 'Used',
        						parent: computerRack1,
        						type: computer).save()

		new Reservation(date: new Date().parse('MM/dd/yyyy HH:MM:ss', '11/04/2015 12:30:00'),
						user: user,
						resource: room1).save()
		new Reservation(date: new Date().parse('MM/dd/yyyy HH:MM:ss', '11/04/2015 12:30:00'),
						user: manager,
						resource: room2).save()
		new Reservation(date: new Date().parse('MM/dd/yyyy HH:MM:ss', '11/04/2015 13:00:00'),
						user: user,
						resource: room3).save()
		new Reservation(date: new Date().parse('MM/dd/yyyy HH:MM:ss', '11/04/2015 13:30:00'),
						user: user,
						resource: room3).save()
		new Reservation(date: new Date().parse('MM/dd/yyyy HH:MM:ss', '11/04/2015 13:30:00'),
						user: manager,
						resource: room7).save()
    }
    
    def destroy = {
    }

}
