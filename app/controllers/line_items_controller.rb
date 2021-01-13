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

    def change_qty
        @line_item = LineItem.find(params[:id])
        @order = current_user.orders.find_by(status: 0)
        if @line_item
            item = @line_item.item
            if params[:type] == "plus" && @line_item.quantity == item.quantity
                @status = 1
            elsif params[:type] == "minus" && @line_item.quantity == 1
                @status = -1
            else
                @status = 0
                num = (params[:type] == "plus") ? 1 : -1
                @line_item.update(quantity: @line_item.quantity + num)
                @line_item.update(amount: @line_item.quantity * @line_item.item.price)
                @order.update(amount: 0)
                @order.line_items.each do |snatch|
                    @order.update(amount: @order.amount + snatch.amount)
                end
            end
        end
    end

    private

    def line_item_params
        params.require(:line_item).permit(:quantity, :amount)
    end
end
