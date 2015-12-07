<!doctype html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Change Password</title>
    </head>
    <body>
        <g:form controller="user">
            <p>Change your password!</p>
            <div>
                <label for='oldPassword'>Old password:</label>
                <g:textField name='oldPassword'/>
            </div>
            <div>
                <label for='newPassword'>New password:</label>
                <g:textField name='newPassword'/>
            </div>
            <div>
                <label for='confirmPassword'>Confirm password:</label>
                <g:textField name='confirmPassword'/>
            </div>
            <g:actionSubmit  value="Change Password" action="changePassword" />
            <g:actionSubmit  value="Cancel" action="cancel" />
        </g:form>
    </body>




</html>
