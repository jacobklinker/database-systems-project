<!doctype html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Reserve by Resource</title>
        <asset:stylesheet src="index.css"/>
    </head>
    <body>
        <div class="instructions">
        	<g:form action="reserveByRoom">
                <label for="resourceType">Choose a resource type:</label><br/>
                <g:select name="resourceType"
                          from="${types}"
                          optionId="id"
                          optionValue="description"/><br/><br/>
                <input type="submit" value="Submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent"/>
            </g:form>
        </div>
    </body>
</html>
