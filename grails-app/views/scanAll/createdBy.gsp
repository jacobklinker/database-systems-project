<!doctype html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Sign Up</title>
        <asset:stylesheet src="index.css"/>
        <asset:stylesheet src="view_all.css"/>
        <asset:stylesheet src="table.css"/>
    </head>
    <body>
    	<g:if test="${users == null}">
    		<div class="instructions">
    			No users created by me!
    		</div>
    	</g:if>
    	<g:else>
            <div class="mdl-grid">
                <div class="inner_center">
                    <div class="data_table">
	                   <g:render template="/templates/users"/>
                    </div>
                </div>
            </div>
	    </g:else>
        <asset:javascript src="user.js"/>
    </body>
</html>
