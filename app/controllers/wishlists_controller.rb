class WishlistsController < ActionController::Base
    skip_before_action :verify_authenticity_token

    def index
        begin
            # raise "This is an exception"

            if params[:user_id]
                wishlist = Wishlist.where(user_id: params[:user_id]).first

                p '_ HELLO _'
                p params[:user_id]
                p wishlist
                p '___'

                wishes = wishlist.wishes
                owned_wishes = wishlist.wishes.preload(:owned_wish).collect(&:owned_wish)
                
                hydrated_wishlist = []
                
                wishes.each_with_index  { | value, index |
                    hydrated_value = {}    
                    hydrated_wish_val = {}
                    
                    case wishes[index].thing.class.name
                    when "Book"
                        hydrated_wish_val[:author] = wishes[index].thing.author
                        hydrated_wish_val[:book] = wishes[index].thing
                        hydrated_wish_val[:readings] = wishes[index].thing.readings
                    else
                        raise "UNSUPPORTED_WISH_TYPE"
                    end

                    hydrated_value[:id] = value[:id]
                    hydrated_value[:wish_type] = wishes[index].thing.class.name
                    hydrated_value[:wish_val] = hydrated_wish_val
                    hydrated_value[:owned] = owned_wishes[index] ? true : false
                    hydrated_value[:owned_id] = owned_wishes[index] ? owned_wishes[index].id : nil

                    hydrated_wishlist << hydrated_value
                }

                result = {
                    :id => wishlist.id,
                    :items => hydrated_wishlist,
                    :updated_at => wishlist.updated_at,
                } 
                render :json => result
            else 
                render :json => "error", :status => 400
            end
        rescue Exception => e
            render :json => "error", :status => 500
        end
    end

    def add_item
        case wish_params[:thing_type]
        when "Book"
            thing = Book.where("title = ?", wish_params[:thing_val][:title]).first            
        else
            raise "UNSUPPORTED_WISH_TYPE"
        end

        wishlist_item = Wish.new(
            wishlist_id: wish_params[:wishlist_id],
            thing_id: thing.id,
            thing_type: wish_params[:thing_type],
        )

        if wishlist_item.save
            render :json => wishlist_item, :status => 200
        else
            render :json => "error", :status => 500
        end
    end

    def delete_item
        if params[:id] && Wish.find(params[:id])
            Wish.destroy(params[:id])
            return :status => 200
        else 
            render :json => "error", :status => 404
        end
    end

    def healthcheck
        render :json => "ok", :status => 200
    end

    private

    def wish_params
        params.require(:wishlist).permit(:wishlist_id, :title, :author, :thing_type, :thing_val => {})
    end

end
