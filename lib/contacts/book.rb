require_relative 'contact'

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

    def clear
      @contacts.clear
    end

    def list
      @contacts.each_with_index do |contact, index|
        puts "#{index + 1}. #{contact.name}"
      end
    end

    def details(index)
      @contacts[index].details
    end

    def load(filename)
      clear
      File.open(filename, "r") do |file|
        file.gets
        file.each_line do |line|
          (name, mobile) = line.split(',').collect do |field|
            field.strip
          end
          add(Contact.new(name, mobile))
        end
      end
    end

    def save(filename)
      File.open(filename, "w") do |file|
        file.puts "Name, Mobile"
        each do |contact|
          file.puts [contact.name, contact.mobile].join(", ")
        end
      end
    end

    def to_s
      @contacts.to_s
    end
  end
end
