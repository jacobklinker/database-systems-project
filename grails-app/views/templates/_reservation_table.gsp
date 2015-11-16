<table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
    <thead>
        <g:if test="${displayUser}">
    	   <th>ID</th>
        </g:if>
    	<th class="mdl-data-table__cell--non-numeric">Time</th>
        <g:if test="${displayUser}">
        	<th class="mdl-data-table__cell--non-numeric">User First Name</th>
        	<th class="mdl-data-table__cell--non-numeric">User Last Name</th>
        	<th class="mdl-data-table__cell--non-numeric">User Company</th>
            <th class="mdl-data-table__cell--non-numeric">Resource Description</th>
            <th class="mdl-data-table__cell--non-numeric">Resource Type</th>
            <th class="mdl-data-table__cell--non-numeric">Resource Parent</th>
            <th class="mdl-data-table__cell--non-numeric">Resource Quality</th>
        </g:if>
        <g:else>
            <th class="mdl-data-table__cell--non-numeric">Description</th>
            <th class="mdl-data-table__cell--non-numeric">Type</th>
            <th class="mdl-data-table__cell--non-numeric">Parent</th>
            <th class="mdl-data-table__cell--non-numeric">Quality</th>
        </g:else>
    </thead>
    <tbody>
    	<g:each in="${reservations}" var="reservation">
    		<tr>
                <g:if test="${displayUser}">
                    <td>${reservation.id}</td>
                </g:if>
    			<td class="mdl-data-table__cell--non-numeric">${reservation.time}</td>
                <g:if test="${displayUser}">
        			<g:if test="${reservation.user != null}">
        				<td class="mdl-data-table__cell--non-numeric">${reservation.user.firstName}</td>
        				<td class="mdl-data-table__cell--non-numeric">${reservation.user.lastName}</td>
        				<g:if test="${reservation.user.company != null}">
            				<td class="mdl-data-table__cell--non-numeric">${reservation.user.company.name}</td>
            			</g:if>
            			<g:else>
            				<td class="mdl-data-table__cell--non-numeric"></td>
            			</g:else>
        			</g:if>
        			<g:else>
        				<td class="mdl-data-table__cell--non-numeric"></td>
        				<td class="mdl-data-table__cell--non-numeric"></td>
        				<td class="mdl-data-table__cell--non-numeric"></td>
        			</g:else>
                </g:if>
    			<g:if test="${reservation.resource != null}">
    				<td class="mdl-data-table__cell--non-numeric">${reservation.resource.description}</td>
    				<g:if test="${reservation.resource.type != null}">
        				<td class="mdl-data-table__cell--non-numeric">${reservation.resource.type.description}</td>
        			</g:if>
        			<g:else>
        				<td class="mdl-data-table__cell--non-numeric"></td>
        			</g:else>
    				<g:if test="${reservation.resource.parent != null}">
        				<td class="mdl-data-table__cell--non-numeric">${reservation.resource.parent.description}</td>
        			</g:if>
        			<g:else>
        				<td class="mdl-data-table__cell--non-numeric"></td>
        			</g:else>
        			<td class="mdl-data-table__cell--non-numeric">${reservation.resource.quality}</td>
    			</g:if>
    			<g:else>
    				<td class="mdl-data-table__cell--non-numeric"></td>
    				<td class="mdl-data-table__cell--non-numeric"></td>
    				<td class="mdl-data-table__cell--non-numeric"></td>
    				<td class="mdl-data-table__cell--non-numeric"></td>
    			</g:else>
    		</tr>
    	</g:each> 
    </tbody>
</table>