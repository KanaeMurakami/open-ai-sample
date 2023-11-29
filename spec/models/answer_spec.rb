# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Answer do
  describe 'relation' do
    it { is_expected.to belong_to(:result) }
    it { is_expected.to have_one(:answer_option).dependent(:destroy) }
    it { is_expected.to have_one(:option).through(:answer_option) }
  end
end
