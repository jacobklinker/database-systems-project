<!doctype html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Reserve by Resource</title>
        <asset:stylesheet src="index.css"/>
        <asset:stylesheet src="view_all.css"/>
        <asset:stylesheet src="table.css"/>
    </head>
    <body>
    	<g:form action="reserveByRoom">
            <label for="resource_types">Choose a resource type:</label><br/>
            <g:select name="resource_types"
                      from="${types}"
                      optionId="id"
                      optionValue="description"/><br/><br/>
            <br/><br/>
            <input type="submit" value="Submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent"/>
        </g:form>
    </body>
</html>
