class Project < ActiveRecord::Base
  has_many :users, through: :user_projects
end
