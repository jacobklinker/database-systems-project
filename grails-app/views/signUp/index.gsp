<!doctype html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Sign Up</title>
    </head>
    <body>
        <g:form controller='signUp' action='finish'>
        	<div>
        		<label for='username'>Username:</label>
        		<g:textField name='username'></g:textField>
        	</div>

        	<div>
        		<label for='password'>Password:</label>
        		<g:textField name='password'></g:textField>
        	</div>

        	<input type="submit" value="Sign Up"/>
        </g:form>
    </body>
</html>
