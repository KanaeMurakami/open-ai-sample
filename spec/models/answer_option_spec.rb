# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AnswerOption do
  describe 'relation' do
    it { is_expected.to belong_to(:option) }
    it { is_expected.to belong_to(:answer) }
  end

  describe 'validation' do
    subject { build(:answer_option) }

    it { is_expected.to validate_uniqueness_of(:option).scoped_to(:answer_id) }
  end
end
