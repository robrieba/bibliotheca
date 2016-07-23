class Library < ActiveRecord::Base
  has_many :books

  validates :branch, length: { minimum: 2 }, presence: true
  validates :description, length: { minimum: 5 }, presence: true

end
