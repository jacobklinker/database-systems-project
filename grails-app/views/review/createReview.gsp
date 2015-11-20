<!doctype html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Reviews</title>
        <asset:stylesheet src="index.css"/>
    </head>
    <body>
    	<div class="instructions">
            <g:form action="saveReview">
                <label for="room">Choose a room:</label><br/>
                <g:select name="room"
                          from="${rooms}"
                          optionId="id"
                          optionValue="description"/><br/>
                <label for="rating">Rating:</label><br/>
                <g:select name="rating" from="${1..5}"/><br/>
                <label for="feedback">Feedback:</label><br/>
                <g:textField name='feedback'></g:textField>
                <br/><br/>
                <input type="submit" value="Submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent"/>
            </g:form>
       	</div>
    </body>
</html>