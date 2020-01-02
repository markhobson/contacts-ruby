require './lib/contacts/book'

book = Contacts::Book.new
book.load("book.csv")
puts book
