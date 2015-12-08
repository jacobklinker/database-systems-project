package edu.uiowa.database

class User implements Serializable {

	private static final long serialVersionUID = 1

	transient springSecurityService

	String username
	String password
	String firstName
	String lastName
	String email
	int reservationLimit = 10
        int currentReservationNum
	Date birthday
	User manager
	Gender gender
	Company company
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	User(String username, String password, String firstName, String lastName) {
		this()
		this.username = username
		this.password = password
		this.firstName = firstName
		this.lastName = lastName
	}

	User(String username, String password, String firstName, String lastName, String email) {
		this(username, password, firstName, lastName)
		this.email = email;
	}

	@Override
	int hashCode() {
		username?.hashCode() ?: 0
	}

	@Override
	boolean equals(other) {
		is(other) || (other instanceof User && other.username == username)
	}

	@Override
	String toString() {
		username
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this)*.role
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}

	static transients = ['springSecurityService']

	static constraints = {
		username blank: false, unique: true
		password blank: false
		firstName blank: false
		lastName blank: false
		email email: true, nullable: true
		reservationLimit nullable: true
		birthday nullable: true
		manager nullable: true
		gender nullable: true
		company nullable: true
	}

	static mapping = {
		password column: '`password`'
		table '`user`'
		sort "username"
		reservationLimit defaultValue: "10"
	}
}
