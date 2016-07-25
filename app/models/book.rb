class Book < ActiveRecord::Base
  belongs_to :library
  has_many :requests, dependent: :destroy

  validates :title, presence: true
  validates :isbn, length: { minimum: 10 }, presence: true
  validates :author, presence: true
  validates :publisher, presence: true
  validates :library_id, presence: true

end
