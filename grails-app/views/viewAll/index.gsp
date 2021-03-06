<!doctype html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>View All Data</title>
        <asset:stylesheet src="view_all.css"/>
    </head>
    <body>
    	<!-- Top Section: reservations -->
    	<div class="mdl-grid">
			<div class="inner_center">
		        <!-- Table for reservations -->
		        <div class="data_table">
		        	Reservations
					<g:render template="/templates/reservation_table" model="[displayUser: true]"/>
			    </div>
		    </div>
		</div>

    	<div class="mdl-grid">
    		<!-- Column 1: roles, genders, resource types, companies -->
			<div class="mdl-cell mdl-cell--4-col">
	    		<div class="inner_center">
			        <!-- Table for roles -->
			        <div class="data_table">
			        	Roles
						<table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
					        <thead>
					        	<th>ID</th>
					        	<th class="mdl-data-table__cell--non-numeric">Authority</th>
					        </thead>
					        <tbody>
					        	<g:each in="${roles}" var="role">
					        		<tr>
					        			<td>${role.id}</td>
					        			<td class="mdl-data-table__cell--non-numeric">${role.authority}</td>
					        		</tr>
					        	</g:each> 
					        </tbody>
				        </table>
				    </div>
			    </div>

			    <div class="inner_center">
			        <!-- Table for genders -->
			        <div class="data_table">
			        	Genders
						<table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
					        <thead>
					        	<th>ID</th>
					        	<th class="mdl-data-table__cell--non-numeric">Description</th>
					        </thead>
					        <tbody>
					        	<g:each in="${genders}" var="gender">
					        		<tr>
					        			<td>${gender.id}</td>
					        			<td class="mdl-data-table__cell--non-numeric">${gender.name}</td>
					        		</tr>
					        	</g:each> 
					        </tbody>
				        </table>
				    </div>
			    </div>

			    <div class="inner_center">
			        <!-- Table for resource types -->
			        <div class="data_table">
			        	Resource Types
						<table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
					        <thead>
					        	<th>ID</th>
					        	<th class="mdl-data-table__cell--non-numeric">Type</th>
					        </thead>
					        <tbody>
					        	<g:each in="${resourceTypes}" var="type">
					        		<tr>
					        			<td>${type.id}</td>
					        			<td class="mdl-data-table__cell--non-numeric">${type.description}</td>
					        		</tr>
					        	</g:each> 
					        </tbody>
				        </table>
				    </div>
			    </div>

			    <div class="inner_center">
			        <!-- Table for companies -->
			        <div class="data_table">
			        	Companies
						<table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
					        <thead>
					        	<th>ID</th>
					        	<th class="mdl-data-table__cell--non-numeric">Company Name</th>
					        </thead>
					        <tbody>
					        	<g:each in="${companies}" var="company">
					        		<tr>
					        			<td>${company.id}</td>
					        			<td class="mdl-data-table__cell--non-numeric">${company.name}</td>
					        		</tr>
					        	</g:each> 
					        </tbody>
				        </table>
				    </div>
				</div>
	    	</div>

	    	<!-- Column 2: users, resources -->
			<div class="mdl-cell mdl-cell--8-col">

				<div class="inner_center">
			        <!-- Table for users -->
			        <div class="data_table">
			        	Users
						<g:render template="/templates/users"/>
				    </div>
				</div>

				<div class="inner_center">
			        <!-- Table for resources -->
			        <div class="data_table">
			        	Resources
						<table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
					        <thead>
					        	<th>ID</th>
					        	<th class="mdl-data-table__cell--non-numeric">Description</th>
					        	<th class="mdl-data-table__cell--non-numeric">Quality</th>
					        	<th class="mdl-data-table__cell--non-numeric">Parent</th>
					        	<th class="mdl-data-table__cell--non-numeric">Resource Type</th>
					        </thead>
					        <tbody>
					        	<g:each in="${resources}" var="resource">
					        		<tr>
					        			<td>${resource.id}</td>
					        			<td class="mdl-data-table__cell--non-numeric">${resource.description}</td>
					        			<td class="mdl-data-table__cell--non-numeric">${resource.quality}</td>
					        			<g:if test="${resource.parent != null}">
					        				<td class="mdl-data-table__cell--non-numeric">${resource.parent.description}</td>
					        			</g:if>
					        			<g:else>
					        				<td class="mdl-data-table__cell--non-numeric"></td>
					        			</g:else>
					        			<g:if test="${resource.type != null}">
					        				<td class="mdl-data-table__cell--non-numeric">${resource.type.description}</td>
					        			</g:if>
					        			<g:else>
					        				<td class="mdl-data-table__cell--non-numeric"></td>
					        			</g:else>
					        		</tr>
					        	</g:each> 
					        </tbody>
				        </table>
				    </div>
				</div>
	    	</div>
    	</div>
    </body>
</html>