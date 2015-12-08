<table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
    <thead>
        <g:if test="${displayUser}">
            <th class='clickable-cell' data-href='${createLink(controller: 'reservation', action: 'sortBy', params: [sort:'subId'])}'>Reservation ID</th>
            <th class='clickable-cell' data-href='${createLink(controller: 'reservation', action: 'sortBy', params: [sort:'subTime'])}'>Time</th>
            <th class='clickable-cell' data-href='${createLink(controller: 'reservation', action: 'sortBy', params: [sort:'subUserFirstName'])}'>User First Name</th>
            <th class='clickable-cell' data-href='${createLink(controller: 'reservation', action: 'sortBy', params: [sort:'subUserLastName'])}'>User Last Name</th>
            <th class='clickable-cell' data-href='${createLink(controller: 'reservation', action: 'sortBy', params: [sort:'subCompany'])}'>User Company</th>
            <th class='clickable-cell' data-href='${createLink(controller: 'reservation', action: 'sortBy', params: [sort:'subResourceDes'])}'>Resource Description</th>
            <th class='clickable-cell' data-href='${createLink(controller: 'reservation', action: 'sortBy', params: [sort:'subResourceType'])}'>Resource Type</th>
            <th class='clickable-cell' data-href='${createLink(controller: 'reservation', action: 'sortBy', params: [sort:'subResourceParent'])}'>Resource Parent</th>
            <th class='clickable-cell' data-href='${createLink(controller: 'reservation', action: 'sortBy', params: [sort:'subResourceQuality'])}'>Resource Quality</th>
        </g:if>
        <g:else>
            <th class='clickable-cell' data-href='${createLink(controller: 'reservation', action: 'sortBy', params: [sort:'id'])}'>Reservation ID</th>
            <th class='clickable-cell' data-href='${createLink(controller: 'reservation', action: 'sortBy', params: [sort:'time'])}'>Time</th>
            <th class='clickable-cell' data-href='${createLink(controller: 'reservation', action: 'sortBy', params: [sort:'description'])}'>Resource Description</th>
            <th class='clickable-cell' data-href='${createLink(controller: 'reservation', action: 'sortBy', params: [sort:'type'])}'>Resource Type</th>
            <th class='clickable-cell' data-href='${createLink(controller: 'reservation', action: 'sortBy', params: [sort:'parent'])}'>Resource Parent</th>
            <th class='clickable-cell' data-href='${createLink(controller: 'reservation', action: 'sortBy', params: [sort:'quality'])}'>Resource Quality</th>
        </g:else>
    </thead>
    <tbody>
    	<g:each in="${reservations}" var="reservation">
                <tr>
                    <g:if test="${displayUser}">
                        <td>${reservation.id}</td>
                        <td class="mdl-data-table__cell--non-numeric">${reservation.time}</td>
                
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
                    </g:if>
                    <g:else>
                        <td>${reservation.id}</td>
                        <td class="mdl-data-table__cell--non-numeric">${reservation.time}</td>
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
                    </g:else>
                    <td class="mdl-data-table__cell--non-numeric">
                        <div class="btn-group-vertical">
                            <a class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" href="${createLink(controller: 'reservation', action: 'changeReservation', id: reservation.id)}">change</a>
                            <a class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" href="${createLink(controller: 'reservation', action: 'cancelReservation', id: reservation.id)}">cancel</a>
                        </div>
                    </td>
    		</tr>
    	</g:each> 
    </tbody>
</table>