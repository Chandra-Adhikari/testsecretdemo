class SecretCode < ApplicationRecord

  has_one :user

  validates :code, presence: true, uniqueness: true

  def to_s
    "#{code}"
  end
end
