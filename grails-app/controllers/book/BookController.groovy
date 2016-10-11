package book

import org.apache.commons.lang.StringUtils

class BookController {

    def index = {
        redirect(action: "list", params: params)
    }

    def create = {
        def bookInstance = new Book()
        bookInstance.properties = params
        return [bookInstance: bookInstance]
    }

    def list = {
        def bookList = Book.list()
        session.setAttribute("bookList", bookList)
        render view: 'list', model: [bookList: bookList]
    }

    def edit = {
        def id = params.id
        def bookInstance = Book.findById(id)
        render view: 'edit', model: [bookInstance: bookInstance]
    }

    def delete = {
        if (params.id != null) {
            def bookInstance = Book.findById(params.id)
            bookInstance.delete(flush: true)
            flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'book.label', default: 'Book'), bookInstance.author])}"
        }
    }

    def view = {
        def bookId = params.id
        def book = Book.read(bookId)
        def bookList = Book.list()
        render view: 'view', model: [book: book, bookList: bookList]
    }

    def test = {
        def bookList = Book.list()
        render view: 'test', model: [bookList: bookList]
    }

    def saveOrUpdate = {
        def id = params.id
        def bookInstance
        if (StringUtils.isNotBlank(id)) {
            bookInstance = Book.findById(id)
            List<String> errorMessages = validations(params.author, params.title)
            if (errorMessages == null) {
                bookInstance.author = params.author
                bookInstance.title = params.title
                bookInstance.version = bookInstance.version + 1
                bookInstance.save(flush: true)
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'book.label', default: 'Book'), bookInstance.id])}"
                redirect(action: "list")
            } else {
                for (String errors : errorMessages) {
                    flash.message += errors
                }
                render(view: "edit", model: [alunoPremiadoInstance: bookInstance])
            }
        } else {
            bookInstance = params.properties
            List<String> errorMessages = validations(params.author, params.title)
            if (errorMessages == null) {
                bookInstance.author = params.author
                bookInstance.title = params.title
                if (bookInstance.save(flush: true)) {
                    flash.message = "${message(code: 'default.created.message', args: [message(code: 'book.label', default: 'Book'), bookInstance.author])}"
                    redirect(action: "list", id: bookInstance.id)
                }
            } else {
                for (String error : errorMessages) {
                    flash.message += errors
                }
                render(view: "create", model: [alunoPremiadoInstance: bookInstance])
            }
        }
    }

    private List<String> validations(String author, String title) {
        List<String> messages = new ArrayList<String>()
        if (StringUtils.isBlank(author)) {
            messages.add(" O Autor nao pode ser nulo ou vazio. ")
        } else if (StringUtils.isBlank(title)) {
            messages.add(" O Titulo nao pode ser nulo ou vazio. ")
        }

        return messages
    }
}
