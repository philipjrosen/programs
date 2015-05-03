class Program < ActiveRecord::Base
  validates :title, presence: true
  validates :code, format: { with: /^[a-zA-Z0-9]{6}$/,
    message: "must be alphanumeric and exactly 6 characters",
    multiline: true }
end
