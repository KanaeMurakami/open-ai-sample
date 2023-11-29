# frozen_string_literal: true

# 運勢
class AiFortunetellingController < ApplicationController
  before_action :set_year, only: %i[new create]

  def show
    @result = Result.find(params[:id])
    @visitor = @result.visitor
  end

  def new
    @form = AiFortunetellingForm.new
  end

  def create
    @form = AiFortunetellingForm.new(ai_fortunetelling_params.merge(year: @year))
    redirect_to(ai_fortunetelling_path(@form.result_id)) && return if @form.save

    render :new
  end

  private

  def set_year
    @year = Time.current.next_year.year
  end

  def ai_fortunetelling_params
    params.require(:ai_fortunetelling_form).permit(
      :name,
      :sex,
      :birthday,
      questions: %i[option_id]
    )
  end
end
