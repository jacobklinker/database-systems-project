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
                <g:if test="${flash.message}"> 
                        <div class="message" size="40">${flash.message}</div> 
                </g:if> 
                <div>
        		<label for='firstname'>First Name:</label>
        		<g:textField name='firstname'></g:textField>
        	</div>
                
                <div>
        		<label for='lastname'>Last Name:</label>
        		<g:textField name='lastname'></g:textField>
        	</div>
                
        	<div>
        		<label for='username'>Username:</label>
        		<g:textField name='username'></g:textField>
        	</div>
                

        	<div>
        		<label for='password'>Password:</label>
        		<g:textField name='password'></g:textField>
        	</div>
                
                <div>
        		<label for='confirm'>Confirm Password:</label>
        		<g:textField name='confirm'></g:textField>
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
                password: ${password}
                confirm: ${confirm}

        	<input type="submit" value="Create Account"/>
        </g:form>
    </body>
</html>
