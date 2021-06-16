# require 'net/http'
#
#
# response = Net::HTTP.get(URI.parse("https://api.nytimes.com/svc/books/v3/lists/overview.json?api-key="+ENV['API_KEY']))
#
#
# data = JSON.parse(response)
#
# puts data['results']['lists'][19]
# #
# data['results']['lists'][13]['books'].each do |result|
#   existing_book = Book.find_by(title: result['title'])
#   if !existing_book
#     books = Book.create(
#       title: result['title'],
#       author: result['author'],
#       description: result['description'],
#       book_image: result['book_image'],
#       primary_isbn10: result['primary_isbn10'],
#       primary_isbn13: result['primary_isbn13'],
#       book_link: result['amazon_product_url'],
#       list_name: 'Business Books'
#     )
#     puts books
#   else
#     puts "book already added"
#   end
# end


# def deduce
#   grouped = Book.all.group_by{|book| [book.title]}
#
#   grouped.values.each do  |duplicates|
#     first_one = duplicates.shift
#
#     duplicates.each { |double| double.destroy }
#   end
# end
#
# deduce
