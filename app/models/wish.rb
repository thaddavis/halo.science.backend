class Wish < ApplicationRecord
    belongs_to :wishlist
    belongs_to :thing, polymorphic: true
    has_one :owned_wish, class_name: "OwnedWish", dependent: :destroy

    has_many :readings, through: :thing, source: :thing, source_type: 'Book'

    before_destroy :delete_readings
    after_save :update_wishlist
    after_destroy :update_wishlist
    

    def update_wishlist
        puts "*** UPDATE_WISHLIST ***"

        self.wishlist.touch
    end

    def readings
        puts "*** READINGS ***"

        user_id = self.wishlist.user_id
        sql = "select w.*, b.* from wishes w, books b where b.id = w.thing_id"
        records = ActiveRecord::Base.connection.execute(sql)
        if records[0] && records[0]['id']
            Reading.where(book_id: records[0]['id'], user_id: user_id)
        end
    end

    def delete_readings
        puts "*** DELETE_READINGS ***"

        user_id = self.wishlist.user_id
        sql = "select w.*, b.* from wishes w, books b where b.id = w.thing_id"
        records = ActiveRecord::Base.connection.execute(sql)
        if records[0] && records[0]['id']
            Reading.where(book_id: records[0]['id'], user_id: user_id).destroy_all
        end
    end

end
