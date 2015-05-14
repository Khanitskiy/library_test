# Rubygarage::Library

RubyGarage Library.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'library', :git => 'https://github.com/timlar/rubygarage-library-gem.git'
```

And then execute:

    $ bundle

## Usage

```ruby
require 'library'

library = Library::Model.load('library.db')

if library.orders.empty?
  jim   = Library::Author.new 'Jim Zuckerman'
  ibar  = Library::Author.new 'Ibarionex Perello'
  rob   = Library::Author.new 'Rob Sheppard'
  bryan = Library::Author.new 'Bryan Peterson'

  psddp   = Library::Book.new 'Pro Secrets to Dramatic Digital Photos', jim
  cliypal = Library::Book.new 'Chasing the Light: Improving Your Photography with Available Light', ibar
  dpcghv  = Library::Book.new 'Digital Photographer\'s Complete Guide to HD Video', rob
  ue3e    = Library::Book.new 'Understanding Exposure, 3rd Edition: How to Shoot Great Photographs with Any Camera', bryan

  thomas = Library::Reader.new 'Thomas', 'thomas@mail.com', 'New York', '8th Ave'
  nick   = Library::Reader.new 'Nick', 'nick@mail.com', 'New York', '16th Ave'
  john   = Library::Reader.new 'John', 'john@mail.com', 'New York', '32th Ave'
  kris   = Library::Reader.new 'Kris', 'kris@mail.com', 'New York', '64th Ave'

  library.add_order Library::Order.new(psddp, thomas)
  library.add_order Library::Order.new(psddp, kris)
  library.add_order Library::Order.new(psddp, nick)
  library.add_order Library::Order.new(psddp, nick)
  library.add_order Library::Order.new(cliypal, thomas)
  library.add_order Library::Order.new(cliypal, nick)
  library.add_order Library::Order.new(dpcghv, john)
  library.add_order Library::Order.new(dpcghv, kris)
  library.add_order Library::Order.new(ue3e, kris)

  library.save
end


puts
puts "What is the most popular book?"

puts library.most_popular_book


puts
puts "Who often takes the book?"

book = library.books.first
puts library.often_takes_the_book book


puts
puts "How many people ordered one of the three most popular books?"

library.how_many_people_ordered_one_of_three_most_popular_books.each do |book, readers|
  puts "\"#{book.title}\" (#{book.author.name}): #{readers} readers"
end
```
