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
        number = prompt_i "Number?"
        puts "\n== Contact =="
        @book.details(number - 1)
      end

      def find
        query = prompt_s "Query?"
        results = @book.search(/#{query.downcase}/)

        if results.count > 0
          puts "\n== Matches =="
          results.list
        else
          puts "No matches."
        end
      end

      def open
        filename = prompt_s "Filename?"
        @book.load(filename)
        puts "Opened #{filename}"
      end

      def save
        filename = prompt_s "Filename?"
        @book.save(filename)
        puts "Saved #{filename}"
      end

      def quit
        puts "Bye!"
        @running = false
      end

      def prompt_s(prompt)
        print "#{prompt} "
        gets.strip
      end

      def prompt_i(prompt)
        prompt_s(prompt).to_i
      end
  end
end
