<!doctype html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Change Password</title>
    </head>
    <body>
        <g:form controller="user" action="changePassword">
            <g:if test="${flash.message}"/>
            <g:else>
	    Change your password!
            </g:else>
            
            <div>
                <label for='oldPassword'>Old password:</label>
                <g:textField name='oldPassword' required=''></g:textField>
            </div>
            <div>
                <label for='newPassword'>New password:</label>
                <g:textField name='newPassword' required=''></g:textField>
            </div>
            <div>
                <label for='confirmPassword'>Confirm password:</label>
                <g:textField name='confirmPassword' required=''></g:textField>
            </div>
            <input class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" type="submit" value="Save"/>
        </g:form>
         <a class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" href="${createLink(controller: 'index', action: 'index')}">Cancel</a>
    </body>




</html>
