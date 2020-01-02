require './contact'

module Contacts
  class Book
    def initialize
      @contacts = []
    end

    def add(contact)
      @contacts.push(contact)
    end

    def to_s
      @contacts.to_s
    end
  end
end
