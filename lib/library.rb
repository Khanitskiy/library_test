require 'library/version'
require 'library/author'
require 'library/book'
require 'library/reader'
require 'library/order'

module Library
  class Model
    attr_reader :authors
    attr_reader :books
    attr_reader :orders
    attr_reader :readers

    def initialize
      @authors, @books, @orders, @readers = [], [], [], []
    end

    def add_order(order)
      @orders << order
      @books << order.book unless books.include?(order.book)
      @authors << order.book.author unless authors.include?(order.book.author)
      @readers << order.reader unless readers.include?(order.reader)
    end

    def most_popular_book
      return if orders.empty?
      count(orders.map(&:book)).max_by{ |key, value| value }.first
    end

    def often_takes_the_book(book)
      return if orders.empty?
      count(orders.select{ |order| order.book == book }
        .map(&:reader)).max_by{ |key, value| value }.first
    end

    def how_many_people_ordered_one_of_three_most_popular_books
      return [] if orders.empty?
      count(orders.map(&:book)).sort_by(&:last).reverse![0..2]
    end

    def save
      File.write(@@file, Marshal.dump(self))
    end

    def self.load(file)
      @@file = file

      puts "Loaded from file: #{file}"
      Marshal.load(File.read(file))
    rescue
      puts "Created a new Library"
      self.new
    end

    private

    def count(items)
      items.inject(Hash.new{ 0 }) { |memo, item| memo[item] += 1; memo }
    end
  end
end
