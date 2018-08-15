class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :pages, presence: true 
  validates :pages, numericality: true
end
