<!doctype html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Sign Up</title>
    </head>
    <body>
        <g:each in="${user}">
            <p>Username: ${it.username}</p>
            <p>Password: ${it.password}</p>
        </g:each>
    </body>
</html>
