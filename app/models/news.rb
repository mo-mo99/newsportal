# frozen_string_literal: true

class News < ApplicationRecord
    validates :title, uniqueness:true
end
