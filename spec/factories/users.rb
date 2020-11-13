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

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    nombre { Faker::Name.name }
    password { 'password' }
    password_confirmation { 'password' }
    confirmed_at { Time.zone.yesterday }

    trait :admin do
      profiles { %w(0) }
    end
  end
end
