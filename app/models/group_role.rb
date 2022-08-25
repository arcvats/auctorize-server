class GroupRole < ApplicationRecord
  belongs_to :group
  belongs_to :role

  validates_uniqueness_of :role_id, scope: :group_id, message: "Group role already exists"
end
