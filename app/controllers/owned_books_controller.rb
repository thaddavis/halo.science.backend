class OwnedBooksController < ActionController::Base
    skip_before_action :verify_authenticity_token

    def index
        puts "___ INDEX ___"
    end

    def create
        puts "___ CREATE"

        owned_book = OwnedBook.new(
            user_id: owned_book_params[:user_id],
            wish_id: owned_book_params[:wish_id]
        )

        if owned_book.save
            puts "** here **"
            return :status => 200
        else
            # debugger
            puts "** there **"
            render :json => owned_book.errors, :status => 500
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
        if params[:id] && OwnedBook.find(params[:id])
            OwnedBook.destroy(params[:id])
            return :status => 200
        else 
            return :status => 404
        end
    end

    def owned_book_params
        params.require(:owned_book).permit(:user_id, :wish_id)
    end
end
