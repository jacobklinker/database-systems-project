<!doctype html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Change User Roles</title>
        <asset:stylesheet src="view_all.css"/>
        <asset:stylesheet src="table.css"/>
    </head>
    <body>
        <div class="mdl-grid">
			<div class="inner_center">
		        <div class="data_table">
		        	Click Row to Change User's Role:
		        	<table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
		        		<thead>
		        			<th class='clickable-cell' data-href='${createLink(controller: 'user', action: 'index', params: [sort: 'id'])}'>ID</th>
		        			<th class='clickable-cell' data-href='${createLink(controller: 'user', action: 'index', params: [sort: 'firstName'])}'>First Name</th>
		        			<th class='clickable-cell' data-href='${createLink(controller: 'user', action: 'index', params: [sort: 'lastName'])}'>Last Name</th>
                                                <th class='clickable-cell' data-href='${createLink(controller: 'user', action: 'index', params: [sort: 'username'])}'>Username</th>
                                                <th class='clickable-cell' data-href='${createLink(controller: 'user', action: 'index', params: [sort: 'role'])}'>Role</th>
		        		</thead>
		        		<tbody>
		        			<g:each in="${users}" var="user">
		        				<tr class='clickable-row' data-href='${createLink(action: 'changeRole', id: user.user.id)}'>
		        					<td>${user.user.id}</td>
		        					<td class="mdl-data-table__cell--non-numeric">${user.user.firstName}</td>
		        					<td class="mdl-data-table__cell--non-numeric">${user.user.lastName}</td>
		        					<td class="mdl-data-table__cell--non-numeric">${user.user.username}</td>
		        					<td class="mdl-data-table__cell--non-numeric">${user.role.authority}</td>
		        				</tr>
		        			</g:each>
		        		</tbody>
		        	</table>
		        </div>
		    </div>
		</div>
		<asset:javascript src="table.js"/>
    </body>
</html>
