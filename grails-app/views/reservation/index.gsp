<!doctype html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Users</title>
    </head>
    <body>
        <g:each in="${reservationList}" var="reservation">
            ${reservation.resource}<br/>
        </g:each>
    </body>
</html>
