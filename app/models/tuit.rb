# frozen_string_literal: true

# == Schema Information
#
# Table name: tuits
#
#  id         :bigint           not null, primary key
#  texto      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Tuit < ApplicationRecord
end
