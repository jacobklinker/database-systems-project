<!doctype html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Reviews</title>
        <asset:stylesheet src="index.css"/>
    </head>
    <body>
    	<div class="instructions">
            <g:if test="${reviews.size() == 0}">
                No ratings for this resource!
            </g:if>
            <g:else>
                <g:each in="${reviews}" var="review">
                    Rating: ${review.rating}<br/>
                    Description: ${review.feedback}<br/><br/>
                </g:each>
            </g:else>
       	</div>
    </body>
</html>