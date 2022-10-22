class OwnedWishesController < ActionController::Base
    skip_before_action :verify_authenticity_token

    def index
        puts "___ INDEX"
    end

    def create
        puts "___ CREATE"

        owned_wish = OwnedWish.new(
            user_id: owned_wish_params[:user_id],
            wish_id: owned_wish_params[:wish_id]
        )

        if owned_wish.save
            return :status => 200
        else
            render :json => owned_wish.errors, :status => 500
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
        if params[:id] && OwnedWish.find(params[:id])
            OwnedWish.destroy(params[:id])
            return :status => 200
        else 
            return :status => 404
        end
    end

    def owned_wish_params
        params.require(:owned_wish).permit(:user_id, :wish_id)
    end
end
