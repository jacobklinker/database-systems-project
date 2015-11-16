<!doctype html>
<%@ page import="edu.uiowa.database.Gender" %>
<%@ page import="edu.uiowa.database.Company" %>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Sign Up</title>
    </head>
    <body>
        <g:form controller='user' action='change' params="[username:username]">
            <div>
                <label for='birthday'>Birthday:</label>
                <g:datePicker name="birthday" value="${new Date()}" precision="day" />
            </div>
            <div>
                <label for='company'>Company:</label>
                <g:select name='company' from="${Company.findAll()}" value="${company}" optionKey="id" optionValue="name" />
            </div>
            <br>First Name: ${firstname}</br>
            <br>Last Name: ${lastname}</br>
            <g:actionSubmit  value="Save" action="save" />
            <g:actionSubmit  controller='index' value="Back" action="back" />
        </g:form>
    </body>
</html>
