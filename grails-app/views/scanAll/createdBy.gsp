<!doctype html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Sign Up</title>
        <asset:stylesheet src="index.css"/>
    </head>
    <body>
    	<g:if test="${user == null}">
    		<div class="instructions">
    			No users created by me!
    		</div>
    	</g:if>
    	<g:else>
	        <g:each in="${user}">
	            <g:link controller='user' action="information" params="[username:it.username]" ><p>Username: ${it.username}</p></g:link>
	        </g:each>
	    </g:else>
    </body>
</html>
