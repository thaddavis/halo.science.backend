class WishlistController < ActionController::Base
    skip_before_action :verify_authenticity_token

    def index
        if params[:user_id]
            wishlist = Wishlist.where(user_id: params[:user_id]).first
            wishlist_items = wishlist.wishlist_items
            owned_books = wishlist.wishlist_items.preload(:owned_book).collect(&:owned_book)
            
            hydrated_wishlist = []
            
            wishlist_items.each_with_index  { | value, index |
                puts "_-_-_ #{index}"
                hydrated_value = {}
                
                hydrated_wish_val = {}
                
                case wishlist_items[index].thing.class.name
                when "Book"
                    hydrated_wish_val[:author] = wishlist_items[index].thing.author
                    hydrated_wish_val[:book] = wishlist_items[index].thing
                else
                    raise "UNSUPPORTED_WISH_TYPE"
                end

                hydrated_value[:id] = value[:id]
                hydrated_value[:wish_type] = wishlist_items[index].thing.class.name
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
        puts wishlist_item_params[:author]
        puts wishlist_item_params[:thing_type]

        author = Author.where("first_name = ? or last_name = ?", wishlist_item_params[:author], wishlist_item_params[:author]).first
        book = Book.where("title = ?", wishlist_item_params[:title]).first
        
        wishlist_item = WishlistItem.new(
            author_id: author.id,
            wishlist_id: wishlist_item_params[:wishlist_id],
            thing_id: book.id,
            thing_type: wishlist_item_params[:thing_type],
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
        if params[:id] && WishlistItem.find(params[:id])
            WishlistItem.destroy(params[:id])
            return :status => 200
        else 
            return :status => 404
        end
    end

    private

    def wishlist_item_params
        params.require(:wishlist).permit(:wishlist_id, :title, :author, :thing_type)
    end

end
