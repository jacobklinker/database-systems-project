import edu.uiowa.database.User
import edu.uiowa.database.Role
import edu.uiowa.database.UserRole

class BootStrap {

    def init = { servletContext ->
    	def adminRole = new Role('ROLE_ADMIN').save()
    	def managerRole = new Role('ROLE_MANAGER').save()
    	def userRole = new Role('ROLE_USER').save()

    	def testUser = new User('admin', 'password').save()
        def manager = new User('manager', 'password').save()
        def user = new User('user', 'password').save()

    	UserRole.create(testUser, adminRole, true)
        UserRole.create(manager, managerRole, true)
        UserRole.create(user, userRole, true)
    }
    
    def destroy = {
    }

}
