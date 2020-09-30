class Match < ApplicationRecord
  belongs_to :user
  belongs_to :other_user, class_name: 'User', foreign_key: "other_user_id", optional: true

  def self.add(user:, other_user:, message:)
    user.matches.create!(other_user: other_user, message: message)
    other_user.matches.create!(other_user: user, message: message) unless other_user == nil
    true
  end

  def self.all_successful
    self.where.not(other_user: nil)
  end

  def self.all_unsuccessful
    self.where(other_user: nil)
  end

  def self.most_recent_successful
    most_recent_date = self.last.created_at
    self.all_successful.where(created_at: most_recent_date.beginning_of_day..most_recent_date.end_of_day)
  end

  def self.most_recent_unsuccessful
    most_recent_date = self.last.created_at
    self.all_unsuccessful.where(created_at: most_recent_date.beginning_of_day..most_recent_date.end_of_day)
  end
end
