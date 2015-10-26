<header class="mdl-layout__header mdl-layout__header--waterfall">
    <div class="mdl-layout__header-row">
        <span class="mdl-layout-title">${title}</span>
        <div class="mdl-layout-spacer"></div>
        <nav class="mdl-navigation">
        	<sec:ifLoggedIn>
        		Hello, <sec:loggedInUserInfo field="username"/>!
				<g:link class="mdl-navigation__link mdl-typography--text-uppercase" controller='logout' method="post">Logout</g:link>
        	</sec:ifLoggedIn>
        	<sec:ifNotLoggedIn>
        		<g:link class="mdl-navigation__link mdl-typography--text-uppercase" controller='login' action='auth'>Login</g:link>
        	</sec:ifNotLoggedIn>
		</nav>
    </div>
</header>