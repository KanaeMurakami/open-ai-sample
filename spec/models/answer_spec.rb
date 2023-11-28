# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Answer do
  describe 'relation' do
    it { is_expected.to belong_to(:result) }
  end
end
