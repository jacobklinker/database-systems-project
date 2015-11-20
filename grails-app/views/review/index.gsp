<!doctype html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Reviews</title>
        <asset:stylesheet src="index.css"/>
        <asset:stylesheet src="reservation.css"/>
    </head>
    <body>
    	<div class="instructions">
    		<a class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" href="${createLink(action: 'createReview')}">
                Create Review
            </a>
            <a class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" href="${createLink(action: 'viewAllReviews')}">
                View Reviews
            </a>
       	</div>
    </body>
</html>