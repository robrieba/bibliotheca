class Request < ActiveRecord::Base
  belongs_to :library
  belongs_to :book
end
