require 'rails_helper'

describe Comment, type: :model do
  it { should_belong_to(:article) }
end
