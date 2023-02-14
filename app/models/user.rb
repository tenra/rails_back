# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
          :recoverable, :rememberable, :validatable, :trackable
  include DeviseTokenAuth::Concerns::User

  attr_accessor :confirm_success_url, :redirect_url

  # deviseの本人確認メールをdeliver_laterにする
  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end
end
