<%--
  Created by IntelliJ IDEA.
  User: allan
  Date: 05/10/16
  Time: 12:01
--%>
<%@ page import="book.Book" %>
<html>
    <head>
        <meta name="layout" content="page"/>
        <g:set var="entityName" value="${message(code: 'book.newest', default: 'Novo Livro')}"/>
        <title><g:message code="default.edit.label" args="[entityName]"/></title>
        <script type="text/javascript" src="${resource(dir: 'js', file: 'validations.js')}"></script>
    </head>

    <body>
        <g:form method="post">
            <g:hiddenField name="id" value="${bookInstance?.id}"/>
            <g:hiddenField name="version" value="${bookInstance?.version}"/>
            <g:hasErrors bean="${bookInstance}">
                <div class="errors">
                    <g:renderErrors bean="${bookInstance}" as="list"/>
                </div>
            </g:hasErrors>

            <h2><g:message code="book.newest"/></h2>
            <table>
                <tbody>
                <tr>
                    <td valign="top" class="name">
                        <label for="title"><g:message code="book.titulo.label" default="Título: "/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: bookInstance, field: 'title', 'errors')}">
                        <g:textField name="title" maxlength="100" value="${bookInstance?.title}"/>
                    </td>
                </tr>
                <tr>
                    <td valign="top" class="name">
                        <label for="author"><g:message code="book.autor.label" default="Autor: "/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: bookInstance, field: 'author', 'errors')}">
                        <g:textField name="author" maxlength="100" value="${bookInstance?.author}"/>
                    </td>
                </tr>
                </tbody>
            </table>

            <div id="actionbar" class="menuButton">
                <g:actionSubmitImage value="Salvar" action="saveOrUpdate"
                                     src="${resource(dir: 'images/skin', file: 'salvar.png')}"/>
            </div>
        </g:form>
    </body>
</html>