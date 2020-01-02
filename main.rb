require './book'

book = Contacts::Book.new
book.add(Contacts::Contact.new("Alice"))
book.add(Contacts::Contact.new("Bob"))
book.add(Contacts::Contact.new("Carol"))
puts book
