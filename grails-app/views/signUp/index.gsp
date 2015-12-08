<!doctype html>
<%@ page import="edu.uiowa.database.Gender" %>
<%@ page import="edu.uiowa.database.Company" %>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Sign Up</title>
    </head>
    <body>
        <g:form controller='signUp' action='createAccount'>
                <div>
        		<label for='firstname'>First Name:</label>
        		<g:textField name='firstname' required=''></g:textField>
        	</div>
                
                <div>
        		<label for='lastname'>Last Name:</label>
        		<g:textField name='lastname' required=''></g:textField>
        	</div>
                
        	<div>
        		<label for='username'>Username:</label>
        		<g:textField name='username' required=''></g:textField>
        	</div>

                <div>
                        <label for='email'>Email:</label>
                        <input type="email" name='email' required=''>
                </div>
                
        	<div>
        		<label for='password'>Password:</label>
        		<g:passwordField name='password' required=''></g:passwordField>
        	</div>
                
                <div>
        		<label for='confirm'>Confirm Password:</label>
        		<g:passwordField name='confirm' required=''></g:passwordField>
        	</div>
                
                <div>
                        <label for='birthday'>Birthday:</label>
                        <g:datePicker name="birthday" value="${new Date()}" precision="day" />
                </div>
            
                <div>
                        <label for='gender'>Gender:</label>
                        <g:select name='gender' from="${Gender.findAll()}" value="${gender}" required='' noSelection="['':'-Choose your gender-']" optionKey="id" optionValue="name" />
                </div>
            
                <div>
                        <label for='company'>Company:</label>
                        <g:select name='company' from="${Company.findAll()}" value="${company}" required='' noSelection="['':'-Choose your company-']" optionKey="id" optionValue="name" />
                </div>

        	<input type="submit" value="Create Account"/>
        </g:form>
    </body>
</html>
