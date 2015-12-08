<!doctype html>
<%@ page import="edu.uiowa.database.Gender" %>
<%@ page import="edu.uiowa.database.Company" %>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Change User Information</title>
    </head>
    <body>
        <g:form controller='user' id="${user.id}" action="save">
            
            <div>
                <label for='company'>Company:</label>
                <g:select name='company' from="${Company.findAll()}" value="${company}" optionKey="id" optionValue="name" />
            </div>
            
            <div>
               <label for='email'>Email:</label>
               <input type="email" name='email' value="${user.email}">
            </div>
            <input class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" type="submit" value="Save"/>
        </g:form>
    </body>
</html>
