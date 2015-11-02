<!doctype html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Users</title>
    </head>
    <body>
        <g:each in="${userList}" var="user">
            ${user.username}<br/>
        </g:each>
    </body>
</html>
