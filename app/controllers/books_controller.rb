class BooksController < ActionController::Base
    skip_before_action :verify_authenticity_token

    def index
        puts "___ INDEX"

        books = Books.all
        render :json => books 
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

    def search_readings
        puts "_v_v_ search_readings _v_v_"
        puts search_params
        puts "_^_^_ search_readings _^_^_"
        if search_params[:book_search_term]
            book = Book.where('title like ?', search_params[:book_search_term]).limit(20).first
            
            readings = book.search_readings()
            
            render :json => readings, :status => 200
        else 
            return :status => 500
        end
    end

    def first_owners
        puts "_v_v_ first_owners _v_v_"
        first_owners = Book.first_owners()
        puts "_^_^_ first_owners _^_^_"
        puts first_owners
        render :json => first_owners, :status => 200
    end

    def genre_stats
        puts "_v_v_ genre_stats _v_v_"
        stats = Book.genre_stats(params[:genre])
        puts "_^_^_ genre_stats _^_^_"
        puts stats
        render :json => stats, :status => 200
    end

    def search_params
        params.require(:query).permit(:book_search_term)
    end

    def genre_stats_params
        params.permit(:genre)
    end

end
