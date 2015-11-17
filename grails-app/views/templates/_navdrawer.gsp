<sec:ifLoggedIn>
    <div class="mdl-layout__drawer">
        <span class="mdl-layout-title">Reserve</span>
        <nav class="mdl-navigation">
            <a class="mdl-navigation__link" href="${createLink(controller: 'index', action: 'index')}">Home</a>
            <a class="mdl-navigation__link" href="${createLink(controller: 'reservation', action: 'createReservation')}">Reserve a Resource</a>
            <a class="mdl-navigation__link" href="${createLink(controller: 'reservation')}">View My Reservations</a>
            <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_MANAGER">
                <a class="mdl-navigation__link" href="${createLink(controller: 'signUp')}">Create New User</a>
            </sec:ifAnyGranted>
            <sec:ifAnyGranted roles="ROLE_MANAGER">
                <a class="mdl-navigation__link" href="${createLink(controller: 'scanAll', action: 'createdBy')}">View All My Users</a>
            </sec:ifAnyGranted>
            <sec:ifAnyGranted roles="ROLE_ADMIN">
                <a class="mdl-navigation__link" href="${createLink(controller: 'user')}">View All Users</a>
                <a class="mdl-navigation__link" href="${createLink(controller: 'reports')}">Generate Monthly Report</a>
            </sec:ifAnyGranted>
            <a class="mdl-navigation__link" href="${createLink(controller: 'user', action: 'passwordPage')}">Change My Password</a>
        </nav>
    </div>
</sec:ifLoggedIn>