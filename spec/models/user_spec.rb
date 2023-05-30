# frozen_string_literal: true

require 'rails_helper'
require 'lib/be_named'

RSpec.describe User , type: :model do
  subject(:user) { User.create(first_name: 'Toto', last_name: 'Titi', email: ) }

  let(:email) { nil }

  describe '#admin?' do
    context 'when email is admin' do
      let(:email) { 'estelle.jl.rose@gmail.com' }

      it 'returns true' do
        expect(user.admin?).to be(true)
      end
    end
    context 'when email is not admin' do
      let(:email) { 'paul@gmail.com' }

      it 'returns false' do
        expect(user.admin?).to be(false)
      end
    end
  end
  describe "#user_name" do
    it "returns user's full name" do
      expect(user).to be_named(user.user_name)
    end
    
  end
  

end
