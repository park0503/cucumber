ActiveAdmin.register LineItem do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :item_id, :order_id, :quantity, :amount
  #
  # or
  #
  # permit_params do
  #   permitted = [:item_id, :order_id, :quantity, :amount]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
