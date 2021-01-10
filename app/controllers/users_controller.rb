class UsersController < ApplicationController
    def mypage
        @user = current_user
    end
end
