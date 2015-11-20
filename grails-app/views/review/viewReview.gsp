<!doctype html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Reviews</title>
        <asset:stylesheet src="index.css"/>
    </head>
    <body>
    	<div class="instructions">
    		<g:each in="${reviews}" var="review">
                Rating: ${review.rating}<br/>
                Description: ${review.feedback}<br/><br/>
            </g:each>
       	</div>
    </body>
</html>