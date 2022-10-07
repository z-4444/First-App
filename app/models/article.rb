class Article < ApplicationRecord

    belongs_to :user
    

    has_many :comments, dependent: :destroy

    has_one_attached :image, dependent: :destroy
    validates :title, presence: true, length: {minimum: 2 }
    enum status: {pending: 0, approved: 1}
end
