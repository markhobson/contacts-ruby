require_relative 'book'

module Contacts
  class Manager
    def initialize(book)
      @book = book
    end

    def run
      list
      @running = true
      prompt while @running
    end

    private

      def list
        puts "== Book =="
        @book.list
      end

      def prompt
        print "\n(L)ist, (O)pen, (S)ave, (Q)uit? "
        case gets.upcase.strip
          when "L"
            list
          when "O"
            open
          when "S"
            save
          when "Q"
            quit
          else
            puts "I'm sorry, I cannot do that."
        end
      end

      def open
        print "Filename? "
        filename = gets.strip
        @book.load(filename)
        puts "Opened #{filename}"
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
