module Contacts
  class Contact
    def initialize(name, mobile)
      @name = name
      @mobile = mobile
    end

    def to_s
      "#{@name}, #{@mobile}"
    end
  end
end
