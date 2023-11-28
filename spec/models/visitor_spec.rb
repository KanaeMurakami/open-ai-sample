# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Visitor do
  describe 'enum' do
    it { is_expected.to define_enum_for(:sex).with_values(male: 0, female: 1, unknown: 2) }
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:sex) }
    it { is_expected.to validate_presence_of(:birthday) }
  end
end
