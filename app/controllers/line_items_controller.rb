class LineItemsController < ApplicationController
    def index
        @order = Order.find_by(user_id: current_user.id, status: 0)
        @line_items = LineItem.where(order_id: @order.id)
    end

    def create
        item = Item.find(params[:id])
        line_item = LineItem.new(quantity: 1, amount: item.price)
        order = Order.find_by(user_id: current_user.id, status: 0)
        line_item.item_id = item.id
        line_item.order_id = order.id
        line_item.save
        order.update(amount: order.amount + line_item.amount)
        redirect_to item_path(params[:id])
    end

    def destroy
        order = Order.find_by(user_id: current_user.id, status: 0)
        line_item = LineItem.find_by(order_id: order.id, item_id: params[:id])
        order.update(amount: order.amount - line_item.amount)
        line_item.destroy
        redirect_to item_path(params[:id])
    end

    def destroy_in_cart
        line_item = LineItem.find(params[:id])
        order = Order.find_by(user_id: current_user.id, status: 0)
        order.update(amount: order.amount - line_item.amount)
        line_item.destroy
        redirect_to line_items_path
    end

    private

    def line_item_params
        params.require(:line_item).permit(:quantity, :amount)
    end
end
