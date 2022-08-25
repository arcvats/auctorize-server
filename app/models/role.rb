class Role < ApplicationRecord
  has_many :user_roles
  has_many :users, through: :user_roles

  has_many :group_roles
  has_many :groups, through: :group_roles

  validates :uid, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  before_validation :initialize_values

  private

  def initialize_values
    self.uid = SecureRandom.uuid if self.uid.blank?
  end
end
