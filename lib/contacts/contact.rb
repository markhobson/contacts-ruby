module Contacts
  class Contact
    attr_reader :name
    attr_reader :mobile

    def initialize(name, mobile)
      @name = name
      @mobile = mobile
    end
  end
end
