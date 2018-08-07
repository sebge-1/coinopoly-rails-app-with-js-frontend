class Position < ApplicationRecord
  belongs_to :coin
  belongs_to :portfolio
  belongs_to :user
end
