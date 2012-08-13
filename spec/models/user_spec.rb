require 'spec_helper'

describe 'User' do

  it 'should have the right accessible attributes' do
    User.accessible_attributes.to_a.reject(&:blank?).should =~ %w(name latitude longitude email password password_confirmation remember_me)
  end

end
