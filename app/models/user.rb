class User < ApplicationRecord
    
    attr_accessor :remember_token, :reset_token
    include ActionText::Attachable
    has_secure_password
    before_save   :downcase_email
    has_many :projects, dependent: :destroy
    has_many :comments, dependent: :destroy
    mount_uploader :image, ImageUploader
    has_many :features, dependent: :destroy
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :username, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 8 }
    validates :firstname, presence: true
    validates :lastname, presence: true
    validates :image, presence: true
    validate  :picture_size
    GENDER_LIST = ["Male","Female","Custom"]
    
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    def User.new_token
        SecureRandom.urlsafe_base64
    end
    # Remembering an user .
    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end

    #Returns true if the given token matches.
    def authenticated?(remember_token)
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end
    
    #To validate the size of the picture
    def picture_size
        if image.size > 5.megabytes
            errors.add(:picture, "should be less that 5 mb")
        end    
    end     
    
    # Forgeting an user.
    def forget
        update_attribute(:remember_digest, nil)
    end
     # Sets the password reset attributes.
    def create_reset_digest
        self.reset_token = User.new_token
        update_attribute(:reset_digest,  User.digest(reset_token))
        update_attribute(:reset_sent_at, Time.zone.now)
    end

    # Sends password reset email.
    def send_password_reset_email
        UserMailer.password_reset(self).deliver
    end
  
    private
    def downcase_email
        self.username = username.downcase
    end

end
