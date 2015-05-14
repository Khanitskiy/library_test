module Library
  class Book
    attr_reader :title, :author

    def initialize(title, author)
      @title, @author = title, author
    end

    def ==(book)
      self.to_s == book.to_s
    end

    def to_s
      "\"#{title}\" (#{author.name})"
    end
  end
end
