class Contact < ActiveRecord::Base
  has_many :contacts_groups
  has_many :groups, through: :contacts_groups
end
