require 'spec_helper'
require 'rails_helper'

describe Item do
  it { should validate_presence_of(:name) }
  it { should belong_to(:user) }
end