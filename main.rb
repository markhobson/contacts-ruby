require './lib/contacts/manager'

book = Contacts::Book.new
book.load("book.csv")
Contacts::Manager.new(book).run
