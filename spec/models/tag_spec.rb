require 'rails_helper'

describe Tag, type: :model do
  it { should have_many_taggings }
end
