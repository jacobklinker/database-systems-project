<!doctype html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Change User Roles</title>
        <asset:stylesheet src="view_all.css"/>
    </head>


    <body>
     
        <div class="mdl-grid">
			<div class="inner_center">
		        <div class="data_table">
		        	Click Row to Change User's Role:
		        	<table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
		        		<thead>
		        			<th>ID</th>
		        			<th class="mdl-data-table__cell--non-numeric">First Name</th>
		        			<th class="mdl-data-table__cell--non-numeric">Last Name</th>
		        			<th class="mdl-data-table__cell--non-numeric">Username</th>
		        			<th class="mdl-data-table__cell--non-numeric">Role</th>
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
		<asset:javascript src="user.js"/>
    </body>
</html>
