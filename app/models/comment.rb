class Comment < ApplicationRecord
    belongs_to :post
    validates :author, length: { minimum: 5, maximum: 50 }
    validates :text, presence: true,
                length: { minimum: 3, maximum: 200 }
end
