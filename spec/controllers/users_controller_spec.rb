# frozen_string_literal: true

require 'rails_helper'

describe UsersController, :controllers do
  describe '#index' do
    subject(:get_users) { get(:index) }

    context 'when there are users in database' do
      before do
         User.create(first_name: 'toto', email: 'toto@example.com') 
         User.create(first_name: 'tata', email: 'tata@example.com')
      end

      it 'returns a 200 status' do
        expect(get_users).to have_http_status(:ok)
      end
    end
    context 'when there are no users in database' do
      it 'returns a 404 status' do
        expect(get_users).to have_http_status(:not_found)
      end
    end
  end
end
