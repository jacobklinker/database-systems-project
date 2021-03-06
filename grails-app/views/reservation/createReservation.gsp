<!doctype html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Create Reservation</title>
        <asset:stylesheet src="index.css"/>
        <asset:stylesheet src="reservation.css"/>
    </head>
    <body>
        <div class="instructions">
            <a class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" href="${createLink(action: 'reserveByRoom')}">
                Reserve By Room
            </a>
            <a class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" href="${createLink(action: 'reserveByTime')}">
                Reserve By Time
            </a>
            <a class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" href="${createLink(action: 'reserveByResource')}">
                Reserve By Resource Type
            </a>
        </div>
        <div class="instructions">
            <a class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" href="${createLink(action: 'recureserveByDay')}">
                Recurring Reserve By Day
            </a>
            <a class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" href="${createLink(action: 'recureserveByWeek')}">
                Recurring Reserve By Week
            </a>
            <a class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" href="${createLink(action: 'recureserveByMonth')}">
                Recurring Reserve By Month
            </a>
        </div>
    </body>
</html>