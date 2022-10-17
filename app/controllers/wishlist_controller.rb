class WishlistController < ActionController::Base

    def index
        if params[:user_id]
            wishlist = Wishlist.where(user_id: params[:user_id]).first
            # wishlist_items = wishlist.wishlist_items.extract_associated(:book)
            wishlist_items = wishlist.wishlist_items.preload(:book).collect(&:book)
            result = {
                :id => wishlist.id,
                :og_wishlist => wishlist.wishlist_items,
                :wishlist => wishlist_items,
                :wishlistUpdatedAt => wishlist.updated_at
            } 
            render :json => result
        else 
            puts "-!-!-!-!-!-"
        end
    end

    def delete_item
        puts "___ ___ _DRAKE_ ___ ___"
    end

end
