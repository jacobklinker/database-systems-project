<!doctype html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Reserve</title>
        <asset:stylesheet src="index.css"/>
    </head>
    <body>
    	<div class="instructions">
	        <sec:ifLoggedIn>
                    <g:if test="${flash.message}"/>

                    <g:else>
	        	Hey ${currentUser.firstName} ${currentUser.lastName}! Choose from the options in the drawer on the left side of the screen.
                    </g:else>
	        </sec:ifLoggedIn>
	        <sec:ifNotLoggedIn>
	        	Log in to begin scheduing appointments and view your current appointments.
	        </sec:ifNotLoggedIn>
	    </div>
    </body>
</html>
