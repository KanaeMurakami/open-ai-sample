# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'AiFortunetellings' do
  describe 'GET #new' do
    it 'returns http success' do
      get new_ai_fortunetelling_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #create' do
    before do
      client = instance_double(OpenAI::Client)
      allow(OpenAI::Client).to receive(:new).and_return(client)
      allow(client)
        .to receive(:chat)
        .and_return({ 'choices' => { 0 => { 'message' => { 'content' => 'テスト' } } } })
    end

    let!(:question) { create(:question) }
    let!(:option) { create(:option, question:) }
    let(:params) do
      {
        ai_fortunetelling_form: {
          name: 'テスト',
          sex: 'male',
          birthday: '2000-01-01',
          questions: { question.id.to_s => option.id.to_s }
        }
      }
    end

    it 'returns http success' do
      post ai_fortunetelling_index_path(params:)
      expect(response).to have_http_status(:found)
    end
  end

  describe 'GET #show' do
    let!(:result) { create(:result) }

    it 'returns http success' do
      get ai_fortunetelling_path(result.id)
      expect(response).to have_http_status(:success)
    end
  end
end
