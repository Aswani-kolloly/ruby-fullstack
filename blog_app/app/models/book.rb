class Book < ApplicationRecord
    belongs_to :subjects , class_name: "Subject",foreign_key:"subject_id"
    has_one_attached:image
    validates_length_of :title, :within => 3..20
    validates_uniqueness_of :title, :message => "already exists" 
end
