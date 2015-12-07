<!doctype html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Reserve by Time</title>
        <asset:stylesheet src="index.css"/>
    </head>
    <body>
        <div class="instructions">
            <g:form action="submitRecureserveTimeDay">
                <label for="date">Date:</label><br/>
                <g:datePicker name="date" value="${new Date()}" precision="day" /><br/><br/>
                <label for="room">Time:</label><br/>
                <g:select name="time"
                          from="${timeslots}"/><br/><br/>
                <input type="submit" value="Submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent"/>
            </g:form>
        </div>
    </body>
</html>