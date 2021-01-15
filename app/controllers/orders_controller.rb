class OrdersController < ApplicationController
    def edit
        @order = Order.find(params[:id])
    end

    def update
        @order = Order.find(params[:id])
        @order.update(order_params)
        @order.update(status: 1)
        order = Order.new(user_id: current_user.id, status: 0, amount: 0)
        order.save
    end

    private

    def order_params
        params.require(:order).permit(:sender, :receiver, :zipcode, :address1, :address2, :phone)
    end
end
