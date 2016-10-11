<%-- File: grails-app/views/templates/productview.gsp --%>
<g:applyLayout name="twoblocks">
    <head>
        <title>${book.title}</title>
    </head>

    <content tag="left1">
        <h1>${book.title}</h1>

        <p class="product-body">
            <img src="${resource(dir: 'images', file: 'product-image.jpg')}" alt="" width="220" height="220"
                 class="product-image"/>

            ${book.title}
        </p>
    </content>

    <content tag="right1">
        <div id="list-products">
            <h2><g:message code="books.list.newest"/></h2>
            <ul>
                <g:each in="${bookList}" var="book">
                    <li>
                        <p>
                            <g:link controller="book" action="view" id="${book.id}">${book.title}</g:link>
                        </p>
                    </li>
                </g:each>
            </ul>
        </div>
    </content>
</g:applyLayout>