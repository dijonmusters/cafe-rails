class User < ApplicationRecord
  belongs_to :team
  has_many :matches

  def successful_matches
    matches.where.not(other_user: nil)
  end

  def unsuccessful_matches
    matches.where(other_user: nil)
  end
end
