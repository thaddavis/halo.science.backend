class ReadingsController < ActionController::Base
    skip_before_action :verify_authenticity_token

    def index
        puts "___ INDEX"
    end

    def create
        puts "___ CREATE READING"

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
        puts "___ SHOW"
    end

    def patch
        puts "___ PATCH"
    end

    def destroy
        puts "___ DESTROY"
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
