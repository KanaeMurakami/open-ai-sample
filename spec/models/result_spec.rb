# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Result do
  describe 'relation' do
    it { is_expected.to belong_to(:visitor) }
  end

  describe 'validateion' do
    subject { build(:result) }

    it { is_expected.to validate_numericality_of(:year).only_integer }
    it { is_expected.to validate_uniqueness_of(:year).scoped_to(:visitor_id) }
    it { is_expected.to validate_presence_of(:personality) }
    it { is_expected.to validate_presence_of(:first_half_fortune) }
    it { is_expected.to validate_presence_of(:second_half_fortune) }
  end
end
