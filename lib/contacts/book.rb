require_relative 'contact'

module Contacts
  class Book
    include Enumerable

    def initialize(contacts = [])
      @contacts = contacts
    end

    def add(contact)
      @contacts.push(contact)
    end

    def each
      @contacts.sort.each do |contact|
        yield contact
      end
    end

    def search(query)
      results = select do |contact|
        contact.name.downcase =~ query
      end
      Book.new(results)
    end

    def clear
      @contacts.clear
    end

    def list
      each_with_index do |contact, index|
        puts "#{index + 1}. #{contact.name}"
      end
    end

    def details(index)
      to_a[index].details
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
