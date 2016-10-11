<g:applyLayout name="oneblock">
    <head>
        <title><g:message code="title.book.list"/></title>
        <script type="text/javascript" src="${resource(dir: 'js', file: 'validations.js')}"></script>
    </head>
    <g:form name="actionBooks" id="actionBooks">
        <content tag="right1">
            <g:link controller="book" action="create">
                <img src="${resource(dir: 'images', file: 'skin/add.png')}" border="0"/>
            </g:link>
        </content>

        <content tag="main1">
            <h1><g:message code="books.list"/></h1>
            <table id="rounded-corner">
                <thead>
                <tr>
                    <th class="rounded-init">
                        <input type="checkbox" id="checkAll" name="checkAll"
                               onclick="javascript:checkAndUncheck(this, 'bookId');"/>
                    </th>
                    <g:sortableColumn params="${params}" property="id"
                                      title="${message(code: 'book.codigo.label', default: 'Código')}"/>
                    <g:sortableColumn params="${params}" property="title"
                                      title="${message(code: 'book.titulo.label', default: 'Título')}"/>
                    <g:sortableColumn params="${params}" property="author"
                                      title="${message(code: 'book.autor.label', default: 'Autor')}"/>
                    <g:sortableColumn params="${params}" property="author"
                                      title="${message(code: 'book.acao.label', default: 'Ações')}"
                                      class="rounded-end"/>
                </tr>
                </thead>
                <tfoot>
                <tr>
                    <td colspan="4" class="rounded-foot-left">
                        <em>The above data were fictional and made up, please do not sue me</em>
                    </td>
                    <td class="rounded-foot-right">&nbsp;</td>
                </tr>
                </tfoot>
                <tbody>
                <g:each in="${bookList}" var="book">
                    <tr>
                        <td><input type="checkbox" name="booksId" value="${book?.id}"/></td>
                        <td>${fieldValue(bean: book, field: "id")}</td>
                        <td>${fieldValue(bean: book, field: "title")}</td>
                        <td>${fieldValue(bean: book, field: "author")}</td>
                        <td>
                            <g:link controller="book" action="edit" id="${book?.id}"><img
                                    src="${resource(dir: 'images', file: 'skin/edit.png')}" border="0"/></g:link>
                            <g:link controller="book" action="delete" id="${book?.id}"><img
                                    src="${resource(dir: 'images', file: 'skin/delete.png')}" border="0"/></g:link>
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </content>
    </g:form>
</g:applyLayout>