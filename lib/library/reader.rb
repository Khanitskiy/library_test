module Library
  class Reader
    attr_reader :name, :email, :city, :street, :house

    def initialize(name, email, city = '', street = '', house = '')
      @name, @email, @city, @street, @house = name, email, city, street, house
    end

    def to_s
      "#{name} (#{email})"
    end
  end
end
