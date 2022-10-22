class WishlistController < ActionController::Base
    skip_before_action :verify_authenticity_token

    def index
        if params[:user_id]
            wishlist = Wishlist.where(user_id: params[:user_id]).first
            wishes = wishlist.wishes
            owned_books = wishlist.wishes.preload(:owned_book).collect(&:owned_book)
            
            hydrated_wishlist = []
            
            wishes.each_with_index  { | value, index |
                puts "_-_-_ #{index}"
                hydrated_value = {}
                
                hydrated_wish_val = {}
                
                case wishes[index].thing.class.name
                when "Book"
                    hydrated_wish_val[:author] = wishes[index].thing.author
                    hydrated_wish_val[:book] = wishes[index].thing
                else
                    raise "UNSUPPORTED_WISH_TYPE"
                end

                hydrated_value[:id] = value[:id]
                hydrated_value[:wish_type] = wishes[index].thing.class.name
                hydrated_value[:wish_val] = hydrated_wish_val
                hydrated_value[:owned] = owned_books[index] ? true : false
                hydrated_value[:owned_id] = owned_books[index] ? owned_books[index].id : nil

                hydrated_wishlist << hydrated_value
            }

            result = {
                :id => wishlist.id,
                :items => hydrated_wishlist,
                :updated_at => wishlist.updated_at,
            } 
            render :json => result
        else 
            return :status => 404
        end
    end

    def add_item
        puts "** add_item **"
        puts wish_params[:thing_type]
        puts wish_params[:thing_val]

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
            puts "** here **"
            render :json => wishlist_item, :status => 200
        else
            puts "** there **"

            debugger
            return :status => 500
        end
    end

    def delete_item
        if params[:id] && Wish.find(params[:id])
            Wish.destroy(params[:id])
            return :status => 200
        else 
            return :status => 404
        end
    end

    private

    def wish_params
        params.require(:wishlist).permit(:wishlist_id, :title, :author, :thing_type, :thing_val => {})
    end

end
