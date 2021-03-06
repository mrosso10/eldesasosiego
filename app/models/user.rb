# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  activo                 :boolean          default(TRUE)
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  desarrollador          :boolean          default(FALSE)
#  edad                   :integer
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  nombre                 :string
#  profiles               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  audited except: :remember_created_at

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :async, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  serialize :profiles, Array
  enumerize :profiles, in: %i[admin cliente], multiple: true

  def to_s
    nombre_o_email
  end

  def timeout_in
    30.minutes if Rails.env.production?
  end

  def nombre_o_email
    if nombre.present?
      nombre
    else
      email
    end
  end

  def admin?
    profiles.admin?
  end

  def active_for_authentication?
    super && activo?
  end
end
