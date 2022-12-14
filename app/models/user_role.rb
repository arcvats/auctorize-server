class UserRole < ApplicationRecord
  belongs_to :user
  belongs_to :role

  validates_uniqueness_of :role_id, scope: :user_id, message: "User role already exists"
end
