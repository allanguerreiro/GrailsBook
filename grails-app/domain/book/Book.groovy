package book

class Book {
    String title
    String author

    static constraints = {
        title(nullable: false, blank: false, maxSize: 100)
        author(nullable: false, blank: false, maxSize: 100)
    }
}
