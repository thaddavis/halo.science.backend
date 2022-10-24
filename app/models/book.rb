class Book < ApplicationRecord
    belongs_to :author

    has_many :wishes, as: :thing
    has_many :owned_wishes, through: :wishes
    has_many :readings, dependent: :destroy

    # Search who has read the book
    def search_readings()
        readings = self
        .readings
        .includes(:user)

        hydrated_readings = []
            
        readings.each_with_index { | value, index |
            hydrated_reading = {}
            
            hydrated_reading[:id] = value.id
            hydrated_reading[:book] = value.book
            hydrated_reading[:user] = value.user
            hydrated_reading[:author] = value.book.author
            hydrated_reading[:last_read] = value.created_at

            hydrated_readings << hydrated_reading
        }
        hydrated_readings
    end

    # Returns an array of objects with info about the first owner of every book
    def self.first_owners
        puts "___ self.first_owners ___"

        Book
            .all
            .includes(:owned_wishes)
            .select{ |i| i.owned_wishes.sort_by(&:created_at).first }
            .map do |book|
                first_ownership_record = book.owned_wishes.sort_by(&:created_at).first
                first_owner = first_ownership_record.user
                {
                    id: first_ownership_record.id,
                    title: book.title,
                    author: (book.author.first_name + " " + book.author.last_name).strip,
                    first_name: first_owner.first_name,
                    last_name: first_owner.last_name,
                    first_owned: first_ownership_record.created_at
                }
            end
    end

    # Returns stats about a particular genre given the genre string
    def self.genre_stats(genre)
        genre_books = Book.where(genre: genre)

        genre_books_total_pages = 0
        total_genre_books = genre_books.size
        genre_authors = []

        genre_books.map do |book|
            genre_books_total_pages = genre_books_total_pages + book.page_length
            genre_authors << book.author.id if !genre_authors.include?(book.author.id)
        end

        total_authors = Author.all.size

        {
            average_page_length: genre_books_total_pages / total_genre_books,
            percentage_of_authors: (genre_authors.length / total_authors).round(2) * 100 
        }
    end
end
