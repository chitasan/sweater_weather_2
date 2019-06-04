require 'rails_helper'

describe User, type: :model do
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
  it { should validate_presence_of :api_key }
  it { should validate_presence_of :password }
end
