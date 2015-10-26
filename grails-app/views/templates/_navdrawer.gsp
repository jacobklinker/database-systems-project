<div class="mdl-layout__drawer">
    <span class="mdl-layout-title">Reserve</span>
    <nav class="mdl-navigation">
        <a class="mdl-navigation__link" href="${createLink(uri: '/')}">Home</a>
        <a class="mdl-navigation__link" href="${createLink(controller:'secure')}">Reserve a Room</a>
        <a class="mdl-navigation__link" href="${createLink(controller:'secure')}">View All Reservations</a>
        <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_MANAGER">
        	<a class="mdl-navigation__link" href="${createLink(controller:'signUp')}">Create New User</a>
        </sec:ifAnyGranted>
    </nav>
</div>