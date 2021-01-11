class User < ApplicationRecord
  require 'carrierwave/orm/activerecord' #서순 정립, 없으면 에러난대
  mount_uploader :avatar, ImageUploader #post 모델의 image_url이란 column에 내가 올린 파일의 주소를 저장해라.
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items, dependent: :destroy
  has_many :orders, dependent: :destroy
end
