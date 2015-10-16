<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title><g:layoutTitle default="Feed"/></title>
        <link rel="stylesheet" href="https://storage.googleapis.com/code.getmdl.io/1.0.2/material.indigo-pink.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <asset:stylesheet src="main.css"/>
        <g:layoutHead/>
        <style>
            #view-source {
              position: fixed;
              display: block;
              right: 0;
              bottom: 0;
              margin-right: 40px;
              margin-bottom: 40px;
              z-index: 900;
            }
        </style>
    </head>
    <body class="mdl-demo mdl-color--grey-100 mdl-color-text--grey-700 mdl-base">
        <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
            <g:render template="/templates/toolbar" model="[title: 'Reserve']"/>
            <g:render template="/templates/navdrawer"/>
            <main class="mdl-layout__content">
                <g:layoutBody/>
            </main>
        </div>
        <script src="https://storage.googleapis.com/code.getmdl.io/1.0.2/material.min.js"></script>
    </body>
</html>
