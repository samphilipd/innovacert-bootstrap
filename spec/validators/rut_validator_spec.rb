require 'spec_helper'
require File.expand_path('app/validators/rut_validator')

describe RutValidator do
  subject { RutValidator.new }

  describe 'string too long' do
    it 'should be invalid' do
      rut = "1234567890"

      expect(subject.validate(rut)).to be_false
    end
  end
end
