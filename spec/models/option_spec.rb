# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Option do
  describe 'relation' do
    it { is_expected.to belong_to(:question) }
  end

  describe 'validation' do
    subject { build(:option) }

    it { is_expected.to validate_presence_of(:text) }
    it { is_expected.to validate_uniqueness_of(:text).scoped_to(:question_id).case_insensitive }
    it { is_expected.to validate_numericality_of(:display_order).only_integer }
    it { is_expected.to validate_uniqueness_of(:display_order).scoped_to(:question_id) }
  end
end
