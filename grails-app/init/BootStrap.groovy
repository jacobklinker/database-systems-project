import edu.uiowa.database.User
import edu.uiowa.database.Role
import edu.uiowa.database.UserRole

class BootStrap {

    def init = { servletContext ->
    	def adminRole = new Role('ROLE_ADMIN').save()
    	def managerRole = new Role('MANAGER_ROLE').save()
    	def userRole = new Role('USER_ROLE').save()

    	def testUser = new User('me', 'password').save()

    	UserRole.create testUser, adminRole, true

    	assert User.count() == 1
    	assert Role.count() == 3
    	assert UserRole.count() == 1
    }
    def destroy = {
    }
}
