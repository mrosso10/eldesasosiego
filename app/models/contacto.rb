# frozen_string_literal: true

# == Schema Information
#
# Table name: contactos
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  ip         :string           not null
#  mensaje    :string           not null
#  nombre     :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_contactos_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Contacto < ApplicationRecord
  audited

  belongs_to :user, optional: true

  validates :nombre, :email, :mensaje, :ip, presence: true
end
