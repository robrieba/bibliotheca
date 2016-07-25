class Request < ActiveRecord::Base
  belongs_to :library
  belongs_to :book

  def self.most_requested_book(library)
    count_hash = Request.where(library_id:library.id).group(:book_id).size
    count_hash.sort { |a, b| b[1] <=> a[1] }[0][0] unless count_hash.empty?
  end

end
