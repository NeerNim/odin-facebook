require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'should belong to post' do
    t = Like.reflect_on_association(:post)
    expect(t.macro).to eq(:belongs_to)
  end
end
