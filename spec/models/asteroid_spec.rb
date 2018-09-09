require 'rails_helper'

describe Asteroid do
  let(:attrs) {
    {
    name: "2014 KT76",
    id: "3672906"
    }
  }
  subject { Asteroid.new(attrs) }
  it 'exists' do
    expect(subject).to be_a Asteroid
  end
  context 'instance methods' do
    context '#name' do
      it 'returns a name' do
        expect(subject.name).to eq "2014 KT76"
      end
    end

    context '#id' do
      it 'returns an id' do
        expect(subject.id).to eq "3672906"
      end
    end
  end
end
