class User < ActiveRecord::Base
has_many :topics
has_many :bookmarks, dependent: :destroy
 
 devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
end
