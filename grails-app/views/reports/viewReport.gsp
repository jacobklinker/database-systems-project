<!doctype html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>My User's Reservations</title>
        <asset:stylesheet src="index.css"/>
        <asset:stylesheet src="view_all.css"/>
        <asset:stylesheet src="table.css"/>
    </head>
    <body>
    	<g:if test="${reservations == null || reservations.size() == 0}">
    		<div class="instructions">Your users haven't made any reservations in the last month!</div>
    	</g:if>
    	<g:else>
	        <div class="mdl-grid">
				<div class="inner_center">
			        <div class="data_table">
			        	<g:render template="/templates/reservation_table" model="[displayUser: true]"/>
			        </div>
			    </div>
			</div>
	    </g:else>
        <asset:javascript src="table.js"/>
    </body>
</html>
