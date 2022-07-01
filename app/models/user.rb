class User < ApplicationRecord
  has_secure_password
  has_many :person
  has_many :log
end
