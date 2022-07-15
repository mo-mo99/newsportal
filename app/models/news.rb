# frozen_string_literal: true

class News < ApplicationRecord
  validates :url, uniqueness: true
end
