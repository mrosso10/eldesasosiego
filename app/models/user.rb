# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  activo                 :boolean          default(TRUE)
#  desarrollador          :boolean          default(FALSE)
#  edad                   :integer
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  nombre                 :string
#  profiles               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enumerize :profile_type, in: { admin: 0, user: 1 }

  serialize :profiles, Array

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

  def profile_names
    profiles.map { |profile_id| User.profile_types.invert[profile_id.to_i] }
            .compact.map { |type| I18n.t("user_type.#{type}") }.join(', ')
  end

  def admin?
    profiles.include? User.profile_type.admin
  end

  def administrativo?
    profiles.include? User.profile_type.user
  end
end
