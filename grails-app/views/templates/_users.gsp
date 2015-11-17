<table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
    <thead>
    	<th>ID</th>
    	<th class="mdl-data-table__cell--non-numeric">Username</th>
    	<th class="mdl-data-table__cell--non-numeric">First Name</th>
    	<th class="mdl-data-table__cell--non-numeric">Last Name</th>
        <th class="mdl-data-table__cell--non-numeric">Email</th>
    	<th class="mdl-data-table__cell--non-numeric">Birthday</th>
    	<th class="mdl-data-table__cell--non-numeric">Manager</th>
    	<th class="mdl-data-table__cell--non-numeric">Gender</th>
    	<th class="mdl-data-table__cell--non-numeric">Company</th>
    </thead>
    <tbody>
    	<g:each in="${users}" var="user">
    		<tr class='clickable-row' data-href='${createLink(controller: 'user', action: 'information', id: user.id)}'>
    			<td>${user.id}</td>
    			<td class="mdl-data-table__cell--non-numeric">${user.username}</td>
    			<td class="mdl-data-table__cell--non-numeric">${user.firstName}</td>
                <td class="mdl-data-table__cell--non-numeric">${user.lastName}</td>
                <td class="mdl-data-table__cell--non-numeric">${user.email}</td>
    			<td class="mdl-data-table__cell--non-numeric">${user.birthday}</td>
    			<g:if test="${user.manager != null}">
    				<td class="mdl-data-table__cell--non-numeric">${user.manager.firstName} ${user.manager.lastName}</td>
    			</g:if>
    			<g:else>
    				<td class="mdl-data-table__cell--non-numeric"></td>
    			</g:else>
    			<g:if test="${user.gender != null}">
    				<td class="mdl-data-table__cell--non-numeric">${user.gender.name}</td>
    			</g:if>
    			<g:else>
    				<td class="mdl-data-table__cell--non-numeric"></td>
    			</g:else>
    			<g:if test="${user.company != null}">
    				<td class="mdl-data-table__cell--non-numeric">${user.company.name}</td>
    			</g:if>
    			<g:else>
    				<td class="mdl-data-table__cell--non-numeric"></td>
    			</g:else>
    		</tr>
    	</g:each> 
    </tbody>
</table>