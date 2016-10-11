<%-- File: grails-app/views/layout/twoblocks.gsp --%>
<html>
    <head>
        <meta name="layout" content="page"/>
        <title><g:layoutTitle/></title>
        <g:layoutHead/>
    </head>
    <body>
        <div id="left">
            <g:pageProperty name="page.left1"/>
        </div>

        <div id="right">
            <g:pageProperty name="page.right1"/>
        </div>
    </body>
</html>