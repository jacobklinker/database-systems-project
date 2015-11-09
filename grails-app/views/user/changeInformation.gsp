<!doctype html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Sign Up</title>
    </head>


    <body>
        <g:form controller='user' action='change'>
            <div>
                <label for='birthday'>Birthday:</label>
                <g:datePicker name="birthday" value="${new Date()}" precision="day" />
            </div>
            
            <div>
                <label for='gender'>Male</label>
                <g:radio name='gender' value='male'/>
                <label for='gender'>Female</label>
                <g:radio name='gender' value='female' checked='true'/>
            </div>
            
            <div>
                <label for='company'>Company:</label>
                <g:textField name='company'/ value='${company}'/>
            </div>
            
            <br>First Name: ${firstname}</br>
            <br>Last Name: ${lastname}</br>
            
            <g:actionSubmit  value="Save" action="save" />
            <g:actionSubmit  value="Cancel" action="cancel" />
        </g:form>
    </body>




</html>
