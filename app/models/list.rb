class List < ActiveRecord::Base
  has_many :items, dependent: :destroy
  belongs_to :user
  acts_as_commontable
end
