class Find < ApplicationRecord
    def search_features
        features = Feature.all
        features = features.where(["title LIKE ?","%#{keyword}%"]) if keyword.present?
        features = features.where(["status LIKE ?","%#{status}%"]) if status.present?
        return features
    end

    STATUS_LIST = ["Started", "Finished", "Delivered"]
end
