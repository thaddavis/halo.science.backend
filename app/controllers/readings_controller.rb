class ReadingsController < ActionController::Base
    skip_before_action :verify_authenticity_token

    def index
    end

    def create
        reading = Reading.new(
            user_id: reading_params[:user_id],
            book_id: reading_params[:book_id]
        )

        if reading.save
            return :status => 200
        else
            render :json => reading.errors, :status => 500
        end
    end

    def show
    end

    def patch
    end

    def destroy
        if params[:id] && Reading.find(params[:id])
            Reading.destroy(params[:id])
            return :status => 200
        else 
            return :status => 404
        end
    end

    def reading_params
        params.require(:reading).permit(:user_id, :book_id)
    end
end
