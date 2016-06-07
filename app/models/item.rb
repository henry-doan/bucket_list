class Item < ActiveRecord::Base
  belongs_to :list
  acts_as_commontable
end
