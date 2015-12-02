<!doctype html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Choose Time</title>
        <asset:stylesheet src="index.css"/>
        <asset:stylesheet src="view_all.css"/>
        <asset:stylesheet src="table.css"/>
    </head>
    <body>
        <div class="instructions">
            <div class="mdl-grid">
                <g:if test="${dates.size() > 0}">
                    <div class="mdl-cell mdl-cell--2-col">
                        Available Times:
                        <table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
                            <thead>
                                <th class="mdl-data-table__cell--non-numeric">Date</th>
                            </thead>
                            <tbody>
                                <g:each in="${dates}" status="i" var="date">
                                    <g:if test="${2*i < dates.size()}">
                                        <tr>
                                            <td class="mdl-data-table__cell--non-numeric clickable-cell" data-href="${createLink(action: 'saveRoomWithTime')}?date=${dates.get(2*i)}&room=${room.id}">${dates.get(2*i)}</td>
                                        </tr>
                                    </g:if>
                                </g:each> 
                            </tbody>
                        </table>
                    </div>

                    <g:if test="${dates.size() > 1}">
                        <div class="mdl-cell mdl-cell--2-col">
                            &nbsp;
                            <table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
                                <thead>
                                    <th class="mdl-data-table__cell--non-numeric"></th>
                                </thead>
                                <tbody>
                                    <g:each in="${dates}" status="i" var="date">
                                        <g:if test="${2*i < dates.size()}">
                                            <tr>
                                                <g:if test="${2*i + 1 < dates.size()}">
                                                    <td class="mdl-data-table__cell--non-numeric clickable-cell" data-href="${createLink(action: 'saveRoomWithTime')}?date=${dates.get(2*i + 1)}&room=${room.id}">${dates.get(2*i + 1)}</td>
                                                </g:if>
                                            </tr>
                                        </g:if>
                                    </g:each> 
                                </tbody>
                            </table>
                        </div>
                    </g:if>
                </g:if>

                <g:if test="${waitlistDates.size() > 0}">
                    <div class="mdl-cell mdl-cell--2-col"></div>

                    <div class="mdl-cell mdl-cell--2-col">
                        Waitlist:
                        <table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
                            <thead>
                                <th class="mdl-data-table__cell--non-numeric">Date</th>
                            </thead>
                            <tbody>
                                <g:each in="${waitlistDates}" status="i" var="date">
                                    <g:if test="${2*i < waitlistDates.size()}">
                                        <tr>
                                            <td class="mdl-data-table__cell--non-numeric clickable-cell" data-href="${createLink(action: 'saveRoomWithTimeWaitlist')}?date=${waitlistDates.get(2*i)}&room=${room.id}">${waitlistDates.get(2*i)}</td>
                                        </tr>
                                    </g:if>
                                </g:each> 
                            </tbody>
                        </table>
                    </div>

                    <g:if test="${waitlistDates.size() > 1}">
                        <div class="mdl-cell mdl-cell--2-col">
                            &nbsp;
                            <table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
                                <thead>
                                    <th class="mdl-data-table__cell--non-numeric"></th>
                                </thead>
                                <tbody>
                                    <g:each in="${waitlistDates}" status="i" var="date">
                                        <g:if test="${2*i < waitlistDates.size()}">
                                            <tr>
                                                <g:if test="${2*i + 1 < waitlistDates.size()}">
                                                    <td class="mdl-data-table__cell--non-numeric clickable-cell" data-href="${createLink(action: 'saveRoomWithTimeWaitlist')}?date=${waitlistDates.get(2*i + 1)}&room=${room.id}">${dates.get(2*i + 1)}</td>
                                                </g:if>
                                            </tr>
                                        </g:if>
                                    </g:each> 
                                </tbody>
                            </table>
                        </div>
                    </g:if>
                </g:if>
            </div>
        </div>
        <asset:javascript src="table.js"/>
    </body>
</html>
