class User < ApplicationRecord
   has_many :users
   has_many :follows
   has_many :comments
   has_many :reacts
end
