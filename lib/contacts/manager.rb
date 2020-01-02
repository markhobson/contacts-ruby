require_relative 'book'

module Contacts
  class Manager
    def initialize(book)
      @book = book
    end

    def run
      display
      @running = true
      prompt while @running
    end

    private

      def display
        puts "== Book =="
        @book.print
      end

      def prompt
        print "\n(D)isplay, (L)oad, (S)ave, (Q)uit? "
        case gets.upcase.strip
          when "D"
            display
          when "L"
            load
          when "S"
            save
          when "Q"
            quit
          else
            puts "I'm sorry, I cannot do that."
        end
      end

      def load
        print "Filename? "
        filename = gets.strip
        @book.load(filename)
        puts "Loaded #{filename}"
      end

      def save
        print "Filename? "
        filename = gets.strip
        @book.save(filename)
        puts "Saved #{filename}"
      end

      def quit
        puts "Bye!"
        @running = false
      end
  end
end
