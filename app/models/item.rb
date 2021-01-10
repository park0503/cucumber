class Item < ApplicationRecord
    require 'carrierwave/orm/activerecord' #서순 정립, 없으면 에러난대
    mount_uploader :image_url, ImageUploader #post 모델의 image_url이란 column에 내가 올린 파일의 주소를 저장해라.

    belongs_to :user
end
