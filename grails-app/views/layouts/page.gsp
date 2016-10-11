<%-- File: grails-app/views/layout/page.gsp --%>
<!DOCTYPE html>
<html>
    <head>
        <title>
            <g:layoutTitle default="Grails"/>
        </title>
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'principal.css')}"/>
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'fonts.css')}"/>
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'support.css')}"/>
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'layout.css')}"/>
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'table.css')}"/>
        <g:layoutHead/>
    </head>

    <body>
        <div>
            <div id="header" class="clearfix">
                <g:img dir="images" file="banner.png" width="960" height="165"/>
            </div>

            <div class="nav">
                <ul>
                    <li><g:link uri="/"><g:message code="nav.home"/></g:link></li>
                    <li><g:link controller="book" action="list"><g:message code="nav.books"/></g:link></li>
                </ul>
            </div>

            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
        </div>

        </br>

        <g:layoutBody/>

        </br>

        <div id="footer">
            <p>Copyright &copy; 2016 Allan Carneiro - <a href="https://github.com/allanguerreiro">allanguerreiro</a></p>
        </div>
    </body>
</html>