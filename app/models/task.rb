class Task < ApplicationRecord
  belongs_to :project

  validates :project, presence: true
  validates :date, presence: true,
                   format: { with: /\A\d{4}\-(0?[1-9]|1[012])\-(0?[1-9]|[12][0-9]|3[01])\z/,
                             message: 'Needs to follow the format: yyyy-mm-dd' }
  validates :description, presence: true
  validates :status, presence: true,
                     format: { with: /\A(done|canceled|ongoing)\z/,
                               message: 'You need to choose between done, canceled or ongoing.' }
end
