class UsersController < ApplicationController
    def mypage
        @user = current_user
    end

    def record
        @shippings = Order.where(user_id: current_user.id, status: 1)
        @arrivings = Order.where(user_id: current_user.id, status: 2)
    end
end
