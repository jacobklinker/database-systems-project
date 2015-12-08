<!doctype html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>User Information</title>
    </head>
    <body>
        <g:form controller="user" action='changeInformation' id="${user.id}">
            <br>User: ${user.username}</br>
            <br>First Name: ${user.firstName}</br>
            <br>Last Name: ${user.lastName}</br>
            <br>Email: ${user.email}</br>
            <br>Birthday: ${birthday}</br>
            <br>Gender: ${user.gender.name}</br>
            <br>Company: ${user.company.name}</br>
            <br>Manager: ${user.manager}</br>
            <input class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" type="submit" value="Change Information"/>  
        </g:form>
        <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_MANAGER">
            <a class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" href="${createLink(controller: 'user', action: 'back')}">Back</a>
        </sec:ifAnyGranted>
                
        
    </body>
</html>
