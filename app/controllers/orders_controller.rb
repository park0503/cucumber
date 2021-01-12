class OrdersController < ApplicationController
    def edit
        @order = Order.find(params[:id])
    end
end
