<!doctype html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Sign Up</title>
    </head>


    <body>
        <g:form controller="user" params="[username:username]">
            <g:if test="${flash.message}"> 
                    <div class="message">${flash.message}</div> 
            </g:if> 
            <br>User: ${username}</br>
            <br>Password: ${password}</br>
            <br>First Name: ${firstname}</br>
            <br>Last Name: ${lastname}</br>
            <br>Birthday: ${birthday}</br>
            <br>Gender: ${gender}</br>
            <br>Company: ${company}</br>
            <br>Manager: ${manager}</br>
            <g:actionSubmit  value="Change information" action="changeInformation" />
            <g:actionSubmit  value="Change password" action="passwordPage" />
        </g:form>
    </body>




</html>
