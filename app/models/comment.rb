class Comment < ApplicationRecord
    
    include PublicActivity::Model
    tracked owner: ->(controller, model) { controller && controller.current_user }
    
    has_rich_text :body
    belongs_to :feature
    validates :body, presence: true, length: { maximum: 255 }

end
