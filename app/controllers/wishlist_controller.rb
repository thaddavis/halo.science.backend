class WishlistController < ActionController::Base
    skip_before_action :verify_authenticity_token

    def index
        if params[:user_id]
            wishlist = Wishlist.where(user_id: params[:user_id]).first
            owned_books = OwnedBook.where(user_id: params[:user_id]).joins(:book).collect(&:book)
            wishlist_items = wishlist.wishlist_items.preload(:book).collect(&:book)
            authors = wishlist.wishlist_items.preload(:author).collect(&:author)
            result = {
                :id => wishlist.id,
                :og_wishlist => wishlist.wishlist_items,
                :authors => authors,
                :wishlist => wishlist_items,
                :wishlistUpdatedAt => wishlist.updated_at,
                :owned_books => owned_books
            } 
            render :json => result
        else 
            return :status => 404
        end
    end

    def add_item
        puts "** add_item **"
        puts wishlist_item_params[:author]

        author = Author.where("first_name = ? or last_name = ?", wishlist_item_params[:author], wishlist_item_params[:author]).first
        book = Book.where("title = ?", wishlist_item_params[:title]).first
        
        wishlist_item = WishlistItem.new(
            author_id: author.id,
            wishlist_id: wishlist_item_params[:wishlist_id],
            book_id: book.id
        )

        if wishlist_item.save
            puts "** here **"
            render :json => wishlist_item, :status => 200
        else
            puts "** there **"
            return :status => 500
        end
    end

    def delete_item
        if params[:id] && WishlistItem.find(params[:id])
            WishlistItem.destroy(params[:id])
            return :status => 200
        else 
            return :status => 404
        end
    end

    private

    def wishlist_item_params
        params.require(:wishlist).permit(:wishlist_id, :title, :author)
    end

end
