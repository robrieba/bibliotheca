class Library < ActiveRecord::Base
  has_many :books, dependent: :destroy
  has_many :requests, dependent: :destroy

  validates :branch, length: { minimum: 2 }, presence: true
  validates :description, length: { minimum: 5 }, presence: true

end
