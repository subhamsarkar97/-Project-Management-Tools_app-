class Job < ApplicationRecord
    belongs_to :feature, optional: true
    validates :taskname, presence: true, length: { maximum: 255 }
    validates :description, presence: true, length: { maximum: 255 }

end
