# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
          :recoverable, :rememberable, :validatable, :trackable
  include DeviseTokenAuth::Concerns::User
end
