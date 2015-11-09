import edu.uiowa.database.User
import edu.uiowa.database.Role
import edu.uiowa.database.UserRole

class BootStrap {

    def init = { servletContext ->
    	def adminRole = new Role('ROLE_ADMIN').save()
    	def managerRole = new Role('ROLE_MANAGER').save()
    	def userRole = new Role('ROLE_USER').save()

    	def testUser = new User('admin', 'password', 'Jake', 'Klinker').save()
        def manager = new User('manager', 'password', 'Jake', 'Klinker').save()
        def user = new User('user', 'password', 'Jake', 'Klinker').save()
        def temp = new User('temp', 'temp', 'temp', 'temp').save()
    	UserRole.create(testUser, adminRole, true)
        UserRole.create(manager, managerRole, true)
        UserRole.create(user, userRole, true)
        UserRole.create(temp, userRole, true)
    }
    
    def destroy = {
    }

}
