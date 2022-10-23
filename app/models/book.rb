class Book < ApplicationRecord
    belongs_to :author

    has_many :owned_books
    has_many :wishes, as: :thing
    has_many :readings, dependent: :destroy

    # Search who has actually read the book by first name, last name, or both.
    def search_readings()
        readings = self
        .readings
        .includes(:user)

        hydrated_readings = []
            
        readings.each_with_index { | value, index |
            hydrated_reading = {}
            
            # debugger

            hydrated_reading[:id] = value.id
            hydrated_reading[:book] = value.book
            hydrated_reading[:user] = value.user

            # case wishes[index].thing.class.name
            # when "Book"
            #     hydrated_wish_val[:author] = wishes[index].thing.author
            #     hydrated_wish_val[:book] = wishes[index].thing
            #     hydrated_wish_val[:readings] = wishes[index].thing.readings
            # else
            #     raise "UNSUPPORTED_WISH_TYPE"
            # end

            # hydrated_value[:id] = value[:id]
            # hydrated_value[:wish_type] = wishes[index].thing.class.name
            # hydrated_value[:wish_val] = hydrated_wish_val
            # hydrated_value[:owned] = owned_wishes[index] ? true : false
            # hydrated_value[:owned_id] = owned_wishes[index] ? owned_wishes[index].id : nil

            hydrated_readings << hydrated_reading
        }
        hydrated_readings
    end

    # Search owners who have actually read the book by first name, last name, or both.
    # Returns an array of user ids
    # def search_readers(search_input)
    #     debugger
    #     self
    #     .reading
    #     .users
    #     .where('first_name ILIKE ?', search_input)
    #     .or(where('last_name ILIKE ?', search_input))
    #     .select(:id)
    # end

    # Returns an array of objects with info about the first owner of every book
    # def self.first_owners
    #     Book
    #     .all
    #     .includes(owned_book: :user)
    #     .map do |book|
    #         first_owned_book = self.owned_books.first
    #         first_owner = first_owned_book.user

    #         {
    #         first_name: first_owner.first_name,
    #         last_name: first_owner.last_name,
    #         first_owned: first_owned_book.created_at
    #         }
    #     end
    # end

    # Returns stats about a particular genre given the genre string
    # def self.genre_stats(genre)
    #     genre_books = Book.where(genre: genre)

    #     genre_books_total_pages = 0
    #     total_genre_books = genre_books.count
    #     genre_authors = []

    #     genre_books.map do |book|
    #     genre_books_total_pages = genre_books_total_pages + book.page_length

    #     genre_authors << book.author.id if !genre_authors.include?(book.author.id)
    #     end

    #     total_authors = Author.all.length

    #     return(
    #     {
    #         average_page_length: genre_books_total_pages / total_genre_books,
    #         percentage_of_authors: genre_authors.length / total_authors
    #     }
    #     )
    # end
end
