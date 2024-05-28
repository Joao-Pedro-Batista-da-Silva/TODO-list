class List < ApplicationRecord
  validates :title, :content, presence: true
end
