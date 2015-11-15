<!doctype html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Change Role</title>
        <asset:stylesheet src="index.css"/>
    </head>
    <body>
    	<div class="instructions">
    		<g:form action="submit" id="${user.user.id}">
	        	<label for="choose_role">Change role for ${user.user.firstName} ${user.user.lastName}:</label><br/>
	        	<g:select name="choose_role"
	        			  from="${roles}"/>
	        	<input type="submit" value="Save"/>
	        </g:form>
       	</div>
    </body>
</html>