<!doctype html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>My Reservations</title>
        <asset:stylesheet src="index.css"/>
        <asset:stylesheet src="view_all.css"/>
        <asset:stylesheet src="table.css"/>
    </head>
    <body>
    	<g:if test="${reservations == null || reservations.size() == 0}">
    		<div class="instructions">You haven't made any reservations!</div>
    	</g:if>
    	<g:else>
	        <div class="mdl-grid">
				<div class="inner_center">
			        <div class="data_table">
                        Click on any reservation to modify it:
			        	<g:render template="/templates/reservation_table" model="[displayUser: false]"/>
			        </div>
			    </div>
			</div>

            <g:if test="${subordinatesReservations != null && subordinatesReservations.size() > 0}">
                <div class="mdl-grid">
                    <div class="inner_center">
                        <div class="data_table">
                            <br/><br/>Reservations from users I've created:
                            <g:render template="/templates/reservation_table" model="[displayUser: true, reservations: subordinatesReservations]"/>
                        </div>
                    </div>
                </div>
            </g:if>
	    </g:else>
        <asset:javascript src="table.js"/>
    </body>
</html>
