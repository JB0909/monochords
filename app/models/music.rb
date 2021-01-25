class Music < ApplicationRecord
    validates :external_id, uniqueness: { scope: [:album_name] }
end
