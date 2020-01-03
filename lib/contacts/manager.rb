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
        puts "\n== Book =="
        @book.list
      end

      def prompt
        print "\n(L)ist, (D)etails, (F)ind, (O)pen, (S)ave, (Q)uit? "
        case gets.upcase.strip
          when "L"
            list
          when "D"
            details
          when "F"
            find
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

      def details
        number = get_index
        puts "\n== Contact =="
        @book.details(number - 1)
      end

      def find
        print "Query? "
        query = /#{gets.strip.downcase}/
        results = @book.search(query)

        if results.count > 0
          puts "\n== Matches =="
          results.list
        else
          puts "No matches."
        end
      end

      def open
        filename = get_filename
        @book.load(filename)
        puts "Opened #{filename}"
      end

      def save
        filename = get_filename
        @book.save(filename)
        puts "Saved #{filename}"
      end

      def quit
        puts "Bye!"
        @running = false
      end

      def get_index
        print "Number? "
        gets.strip.to_i - 1
      end

      def get_filename
        print "Filename? "
        gets.strip
      end
  end
end
