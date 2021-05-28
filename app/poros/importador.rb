# frozen_string_literal: true

class Importador
  def initialize; end

  def load
    @text = File.read(Rails.root.join('text', 'Pessoa,Fernando,Libro del desasosiego-1.txt'))
    self
  end

  def length
    @text.length
  end

  attr_reader :text

  def separador_paginas
    # Caracter: 0x0c
    "\f"
  end

  def paginas
    @text.split(separador_paginas)
  end

  def guardar_paginas
    paginas.each_with_index do |pagina, index|
      Pagina.create(texto: procesar(pagina), numero: index)
    end
  end

  def procesar(string)
    # Quito \n que están en medio de una oración
    string.gsub(/\n([a-z])/, ' \1')
          .gsub(/([a-z])\n/, '\1 ')
          .gsub(/\. /, ".\n\n")
  end

  def empieza_con_mayuscula?(string)
    string.match '\A[A-Z]'
  end
end
