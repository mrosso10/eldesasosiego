# frozen_string_literal: true

# generado con pg_rails

class PaginasController < AdminController
  before_action { @clase_modelo = Pagina }

  before_action(only: :index) { authorize Pagina }

  before_action :set_pagina, only: %i[new create show edit update destroy]

  add_breadcrumb Pagina.nombre_plural, :paginas_path

  def index
    @paginas = filtros_y_policy %i[texto numero]

    pg_respond_index(@paginas)
  end

  def show
    add_breadcrumb @pagina, @pagina

    respond_to do |format|
      format.json { render json: @pagina }
      format.html
    end
  end

  def new
    add_breadcrumb "Crear #{Pagina.nombre_singular.downcase}"
  end

  def edit
    add_breadcrumb @pagina
  end

  def create
    pg_respond_create(@pagina)
  end

  def update
    pg_respond_update(@pagina)
  end

  def destroy
    pg_respond_destroy(@pagina, paginas_url)
  end

  private

    def render_smart_listing
      smart_listing(:paginas, @paginas, 'paginas/listing',
                    sort_attributes: [
                      [:texto, 'texto'],
                      [:numero, 'numero']
                    ])
    end

    def set_pagina
      if action_name.in? %w[new create]
        @pagina = @clase_modelo.new(pagina_params)
      else
        @pagina = @clase_modelo.find(params[:id])

        @pagina.assign_attributes(pagina_params) if action_name.in? %w[update]
      end

      @pagina.current_user = current_user

      authorize @pagina

      @pagina = @pagina.decorate if action_name.in? %w[show new edit]
    end

    def pagina_params
      if action_name == 'new'
        params.permit(atributos_permitidos)
      else
        params.require(:pagina).permit(atributos_permitidos)
      end
    end

    def atributos_permitidos
      %i[texto numero]
    end
end
