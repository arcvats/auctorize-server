class Group < ApplicationRecord

  has_many :group_roles
  has_many :roles, through: :group_roles

  has_many :user_groups
  has_many :users, through: :user_groups

  validates :uid, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  before_validation :initialize_values

  private

  def initialize_values
    self.uid = SecureRandom.uuid if self.uid.blank?
  end
end
