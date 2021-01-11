class LineItemsController < ApplicationController
    def index
        order = Order.find_by(user_id: current_user.id, status: 0)
        @line_items = LineItem.where(order_id: order.id)
    end

    def create
        item = Item.find(params[:id])
        line_item = LineItem.new(quantity: 1, amount: item.price)
        order = Order.find_by(user_id: current_user.id, status: 0)
        line_item.item_id = item.id
        line_item.order_id = order.id
        line_item.save
        redirect_to item_path(params[:id])
    end

    def destroy
        order = Order.find_by(user_id: current_user.id, status: 0)
        line_item = LineItem.find_by(order_id: order.id, item_id: params[:id])
        line_item.destroy
        redirect_to item_path(params[:id])
    end

    private

    def line_item_params
        params.require(:line_item).permit(:quantity, :amount)
    end
end
