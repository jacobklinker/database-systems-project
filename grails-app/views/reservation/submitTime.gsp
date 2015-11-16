<!doctype html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Choose Room</title>
        <asset:stylesheet src="index.css"/>
        <asset:stylesheet src="view_all.css"/>
        <asset:stylesheet src="table.css"/>
    </head>
    <body>
        <div class="instructions">
            <div class="mdl-grid">
                <div class="mdl-cell mdl-cell--2-col">
                	<table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
                        <thead>
                            <th class="mdl-data-table__cell--non-numeric">Room</th>
                        </thead>
                        <tbody>
                            <g:each in="${rooms}" var="room">
                                <tr>
                                    <td class="mdl-data-table__cell--non-numeric clickable-cell" data-href="${createLink(action: 'saveRoomWithTime')}?date=${date}&room=${room.id}">${room.description}</td>
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
