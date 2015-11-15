<!doctype html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Users</title>
        <asset:stylesheet src="index.css"/>
    </head>
    <body>
    	<div class="instructions">
	    	<g:if test="${reservationList == null || reservationList.size() == 0}">
	    		You haven't made any reservations!
	    	</g:if>
	    	<g:else>
		        <g:each in="${reservationList}" var="reservation">
		            ${reservation.resource}<br/>
		        </g:each>
		    </g:else>
		</div>
    </body>
</html>
