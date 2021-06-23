# frozen_string_literal: true
# # frozen_string_literal: true

# require 'rails_helper'

# describe 'Formulario de contacto', js: true do
#   before do
#     visit '/contactos/new'
#   end

#   shared_context 'completar form' do
#     before do
#       fill_in 'contacto_nombre', with: Faker::Lorem.sentence
#       fill_in 'contacto_email', with: Faker::Internet.email
#       fill_in 'contacto_mensaje', with: Faker::Lorem.sentence
#       click_button 'Enviar'
#     end
#   end

#   describe 'se muestra el form' do
#     it do
#       expect(page).to have_css('.form-contacto form')
#     end
#   end

#   describe 'envío OK' do
#     include_examples 'completar form'
#     it do
#       expect(page).to have_content('Gracias por su mensaje')
#     end
#   end

#   describe 'si hay error de validación' do
#     before do
#       allow_any_instance_of(Frontend::ContactosController).to \
#         receive(:contacto_params).and_return({})
#     end

#     include_examples 'completar form'
#     it do
#       expect(page).to have_content('Hubo un error en el envío de mensaje')
#     end
#   end

#   describe 'si hay error 500' do
#     before do
#       allow(Contacto).to receive(:new).and_raise('mal')
#     end

#     include_examples 'completar form'
#     it do
#       expect(page).to have_content('Hubo un error en el envío de mensaje')
#     end
#   end
# end
