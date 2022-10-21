class OwnedBooksController < ActionController::Base
    skip_before_action :verify_authenticity_token

    def index
        puts "___ INDEX ___"

        owned_books = OwnedBooks.all.includes(:book).references(:book)
        render :json => owned_books 
    end

    def create
        puts "___ CREATE"

        owned_book = OwnedBook.new(
            user_id: owned_book_params[:user_id],
            book_id: owned_book_params[:book_id],
            wishlist_item_id: owned_book_params[:wishlist_item_id]
        )

        if owned_book.save
            puts "** here **"
            
            render :json => owned_book.book, :status => 200
        else
            puts "** there **"
            return :status => 500
        end
    end

    def show
        puts "___ SHOW"
    end

    def patch
        puts "___ PATCH"
    end

    def destroy
        puts "___ DESTROY"
    end

    def owned_book_params
        params.require(:owned_book).permit(:user_id, :book_id, :wishlist_item_id)
    end
end
