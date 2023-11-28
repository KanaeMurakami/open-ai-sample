# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Top' do
  describe 'GET #index' do
    it '200が返却される' do
      get root_path
      expect(response).to have_http_status(:success)
    end

    context ':year を指定した場合' do
      it '200が返却される' do
        get root_path(year: Time.current.year)
        expect(response).to have_http_status(:success)
      end
    end

    context ':year で来年を指定した場合' do
      it '302が返却される' do
        get root_path(year: Time.current.next_year.year)
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
