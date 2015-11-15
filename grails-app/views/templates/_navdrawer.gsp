
<div class="mdl-layout__drawer">
    <span class="mdl-layout-title">Reserve</span>
    <nav class="mdl-navigation">
        <a class="mdl-navigation__link" href="${createLink(uri: '/')}">Home</a>
        <a class="mdl-navigation__link" href="${createLink(controller:'secure')}">Reserve a Room</a>
        <a class="mdl-navigation__link" href="${createLink(controller:'secure')}">View All Reservations</a>
        <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_MANAGER">
        <a class="mdl-navigation__link" href="${createLink(controller:'signUp')}">Create New User</a>
        <a class="mdl-navigation__link" href="${createLink(controller:'scanAll',action:'index')}">View all users</a>
        <a class="mdl-navigation__link" href="${createLink(controller:'scanAll',action:'createdBy')}">View All Users Created By you</a>
        </sec:ifAnyGranted>
        <sec:ifLoggedIn>
        <a class="mdl-navigation__link" href="${createLink(controller:'user',action:'passwordPage')}">Change Password</a>
        <a class="mdl-navigation__link" href="${createLink(controller: 'reservation', action: 'createReservation')}">Reserve a Resource</a>
        <a class="mdl-navigation__link" href="${createLink(controller: 'reservation')}">View My Reservations</a>
        </sec:ifLoggedIn>
    </nav>
</div>
