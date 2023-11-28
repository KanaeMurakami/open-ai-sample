# frozen_string_literal: true

# トップ
class TopController < ApplicationController
  before_action :redirect_if_next_year

  def index
    @year = params[:year] || Time.current.next_year.year
  end

  private

  def redirect_if_next_year
    return if params[:year].to_i != Time.current.next_year.year

    redirect_to root_url
  end
end
