# frozen_string_literal: true

class User < ApplicationRecord
  extend Enumerize
  has_one :setting
  after_create :create_setting
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable, :validatable

  enumerize :role, in: %i(user admin), default: :user, scope: :shallow, predicates: true

  private

  def create_setting
    Setting.create!(user_id: id, api: ['mediastack', 'currentapi'], tags: News.distinct.pluck(:category))
  end

end
