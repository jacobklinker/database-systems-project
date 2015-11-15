<!doctype html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Users</title>
        <asset:stylesheet src="index.css"/>
        <asset:stylesheet src="view_all.css"/>
    </head>
    <body>
    	<g:if test="${reservations == null || reservations.size() == 0}">
    		<div class="instructions">You haven't made any reservations!</div>
    	</g:if>
    	<g:else>
	        <div class="mdl-grid">
				<div class="inner_center">
			        <div class="data_table">
			        	<g:render template="/templates/reservation_table" model="[displayUser: false]"/>
			        </div>
			    </div>
			</div>
	    </g:else>
    </body>
</html>
