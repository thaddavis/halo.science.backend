class BooksController < ActionController::Base

    def index
        puts "___ INDEX"

        @books = Books.all
        render :json => @books 
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

end
