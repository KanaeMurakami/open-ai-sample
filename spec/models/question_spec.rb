# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Question do
  describe 'relation' do
    it { is_expected.to have_many(:options).dependent(:destroy) }
  end

  describe 'validation' do
    subject { build(:question) }

    it { is_expected.to validate_numericality_of(:display_order).only_integer }
    it { is_expected.to validate_uniqueness_of(:display_order) }
  end
end
