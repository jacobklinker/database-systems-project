<!doctype html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Sign Up</title>
    </head>


    <body>
        <g:each in="${user}">
            <g:link controller='user' action="information" params="[username:it.username]" ><p>Username: ${it.username}</p></g:link>
        </g:each>

        
    </body>




</html>
