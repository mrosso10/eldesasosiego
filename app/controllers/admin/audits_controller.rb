# frozen_string_literal: true

module Admin
  class AuditsController < ApplicationController
    def index
      # authorize :audits
      scope = Audited::Audit.includes(:user)
      # t = Audited::Adapters::ActiveRecord::Audit.arel_table
      # scope = scope.where(auditable_type: 'Contacto')
      # scope = scope.where(auditable_id: '21469')
      # scope = scope.where(
      #   (t[:associated_type].eq('Comercio').and(t[:associated_id].eq(comercio_actual.id))).
      #   or(t[:auditable_type].eq('Comercio').and(t[:auditable_id].eq(comercio_actual.id)))
      # )
      scope = scope.reorder(created_at: :desc)
      smart_listing(:audits, scope, 'admin/audits/listing')
    end
  end
end
