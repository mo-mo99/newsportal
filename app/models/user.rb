# frozen_string_literal: true

class User < ApplicationRecord
  extend Enumerize
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable, :validatable

  enumerize :role, in: %i(user admin), default: :user, scope: :shallow, predicates: true
end
