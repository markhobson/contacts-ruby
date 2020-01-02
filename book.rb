require './contact'

module Contacts
  class Book
    include Enumerable

    def initialize
      @contacts = []
    end

    def add(contact)
      @contacts.push(contact)
    end

    def each
      @contacts.each do |contact|
        yield contact
      end
    end
  end
end
