class Item < ApplicationRecord
    require 'carrierwave/orm/activerecord'
    belongs_to :user

    mount_uploader :main_url, MainUploader
end
