require './book'

book = Contacts::Book.new
book.add(Contacts::Contact.new("Alice", "07900 111 111"))
book.add(Contacts::Contact.new("Bob", "07900 222 222"))
book.add(Contacts::Contact.new("Carol", "07900 333 333"))
puts book
