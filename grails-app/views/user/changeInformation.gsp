<!doctype html>
<%@ page import="edu.uiowa.database.Gender" %>
<%@ page import="edu.uiowa.database.Company" %>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Change User Information</title>
    </head>
    <body>
        <g:form controller='user' action='change' params="[username:username]">
            <div>
                <label for='company'>Company:</label>
                <g:select name='company' from="${Company.findAll()}" value="${company}" optionKey="id" optionValue="name" />
            </div>
            <div>
                <label for='email'>Email:</label>
                <g:textField name='email' value="${email}"></g:textField>
            </div>
            <g:actionSubmit  value="Save" action="save" />
            <g:actionSubmit  controller='user' value="Cancel" action="backtoInformation" />
        </g:form>
    </body>
</html>
