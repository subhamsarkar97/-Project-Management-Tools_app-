class Feature < ApplicationRecord
    
    include PublicActivity::Model
    tracked owner: ->(controller, model) { controller && controller.current_user }
    has_secure_token :identity_token
    scope :filter_by, ->(id,panel_name) { where("project_id = ? AND panel = ?",id,panel_name)}
    
    validates :title, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 255 }
    validates :description, presence: true, length: { maximum: 1000 }
    has_many :comments
    mount_uploader :picture, PictureUploader
    has_many :jobs, dependent: :destroy
    accepts_nested_attributes_for :jobs, allow_destroy: true
    INITIAL_LIST = ["Not Started Yet"]
    STATUS_LIST = ["Started", "Finished", "Delivered"]
    PANEL_LIST = ["Current_itteration", "Backlog", "Icebox"]
    EMAIL_LIST = []
    email_array = User.all.map { |user| user.username }
    email_array.each do |f|
        EMAIL_LIST.push(f)
    end    

end
