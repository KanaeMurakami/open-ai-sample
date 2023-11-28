# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'AiFortunetellings' do
  describe 'GET /new' do
    it 'returns http success' do
      get '/ai_fortunetelling/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/ai_fortunetelling/create'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/ai_fortunetelling/show'
      expect(response).to have_http_status(:success)
    end
  end
end