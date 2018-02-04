require 'rails_helper'

describe Tag, type: :model do
  it { should_have_many_taggings }
end
