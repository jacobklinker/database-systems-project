<sec:ifLoggedIn>
    <div class="mdl-layout__drawer">
        <span class="mdl-layout-title">Reserve</span>
        <nav class="mdl-navigation">
            <a class="mdl-navigation__link" href="${createLink(uri: '/')}">Home</a>
            <a class="mdl-navigation__link" href="${createLink(controller: 'secure')}">Reserve a Resource</a>
            <a class="mdl-navigation__link" href="${createLink(controller: 'reservation')}">View My Reservations</a>
            <sec:ifAnyGranted roles="ROLE_ADMIN">
                <a class="mdl-navigation__link" href="${createLink(controller: 'user')}">View Users</a>
            </sec:ifAnyGranted>
            <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_MANAGER">
            	<a class="mdl-navigation__link" href="${createLink(controller: 'signUp')}">Create New User</a>
            </sec:ifAnyGranted>
        </nav>
    </div>
</sec:ifLoggedIn>