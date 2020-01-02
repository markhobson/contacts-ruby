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

    def save(filename)
      File.open(filename, "w") do |file|
        file.puts "Name, Mobile"
        each do |contact|
          file.puts "#{contact.name}, #{contact.mobile}"
        end
      end
    end
  end
end
