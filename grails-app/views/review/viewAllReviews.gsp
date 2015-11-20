<!doctype html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Reviews</title>
        <asset:stylesheet src="index.css"/>
    </head>
    <body>
    	<div class="instructions">
    		<g:form action="viewReview">
            <label for="room">Choose a room:</label><br/>
            <g:select name="room"
                      from="${rooms}"
                      optionId="id"
                      optionValue="description"/>
            <br/><br/>
            <input type="submit" value="Submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent"/>
        </g:form>
    </body>
</html>