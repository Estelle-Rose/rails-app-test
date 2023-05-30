# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts
  has_secure_password
  has_secure_token :confirmation_token
  validates :first_name, 
  format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" },
    presence: true

  validates :last_name,
  format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" },
   presence: true
  validates :email,
   format: { with: /\A[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}\z/i, message: 'email non valide'},
   uniqueness: { case_sensitive: false },
   presence: true


  def admin?
    email == 'estelle.jl.rose@gmail.com'
  end

  def user_name
    "#{first_name} #{last_name}"
  end
end
