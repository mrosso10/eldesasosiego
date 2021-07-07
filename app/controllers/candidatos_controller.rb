# frozen_string_literal: true

# generado con pg_rails

class CandidatosController < ApplicationController
  before_action { @clase_modelo = Candidato }

  before_action(only: :index) { authorize Candidato }

  before_action :set_instancia_modelo, only: %i[new create show edit update destroy]

  add_breadcrumb Candidato.nombre_plural, :candidatos_path

  def index
    @candidatos = filtros_y_policy %i[texto pagina longanismo]

    pg_respond_index(@candidatos)
  end

  def show
    add_breadcrumb @candidato, @candidato

    pg_respond_show
  end

  def new
    add_breadcrumb "Crear #{Candidato.nombre_singular.downcase}"
  end

  def edit
    add_breadcrumb @candidato
  end

  def create
    pg_respond_create
  end

  def update
    pg_respond_update
  end

  def destroy
    pg_respond_destroy(@candidato, candidatos_url)
  end

  private

    def render_smart_listing
      smart_listing(:candidatos, @candidatos, 'candidatos/listing',
                    sort_attributes: [
                      [:texto, 'texto'],
                      [:pagina, 'pagina'],
                      [:longanismo, 'longanismo']
                    ])
    end

    def atributos_permitidos
      %i[texto pagina_id longanismo]
    end
end
