<!doctype html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>User Information</title>
    </head>
    <body>
        <g:form controller="user" params="[username:username]">
            <br>User: ${username}</br>
            <br>Password: ${password}</br>
            <br>First Name: ${firstname}</br>
            <br>Last Name: ${lastname}</br>
            <br>Birthday: ${birthday}</br>
            <br>Gender: ${gender.name}</br>
            <br>Company: ${company.name}</br>
            <br>Manager: ${manager}</br>
            <g:actionSubmit  value="Change information" action="changeInformation" />
            <g:actionSubmit  value="Back" action="back" params="[targetUri: (request.forwardURI - request.contextPath)]"/>
        </g:form>
    </body>
</html>
