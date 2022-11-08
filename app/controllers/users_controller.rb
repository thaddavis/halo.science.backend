class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token

    def give_away_possessions

        puts "___ GIVE AWAY POSSESSIONS ___"
        puts user_params[:user_id]

        user = User.includes(:owned_wishes).find(user_params[:user_id])

        user.owned_wishes.each do |owned_wish|

          case owned_wish.wish.thing_type
          when "Book"
            owned_wish.wish.thing.supply = owned_wish.wish.thing.supply + 1
            owned_wish.wish.thing.save
            owned_wish.destroy
          else
            raise "UNSUPPORTED_WISH_TYPE"
          end
        end

        render json: {}, status: 200
    end

    def users
        puts "___ GET USERS __"
        users = User.all
        render json: users, status: 200
    end

    def user_params
        params.permit(:user_id)
    end

end
