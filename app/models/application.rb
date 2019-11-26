class Application < ApplicationRecord
  belongs_to :user
  has_many :interviews

  validates :favorites, default: false

  validates :job_title, presence: true
  validates :company_name, presence: true
  validates :recruiter_email, presence: true

end