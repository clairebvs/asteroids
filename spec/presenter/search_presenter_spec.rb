require 'rails_helper'

describe SearchPresenter do
  it 'exists' do
    start_date = "2018-01-01"
    end_date = "2018-01-07"

    search_presenter = SearchPresenter.new(start_date, end_date)
    expect(search_presenter).to be_a(SearchPresenter)
  end

  context 'instance methods' do
    context '#asteroids' do
      it 'returns most dangerous days' do
        start_date = "2018-01-01"
        end_date = "2018-01-07"
        search_presenter = SearchPresenter.new(start_date, end_date)

        expect(search_presenter.asteroids.count).to eq(3)
        expect(search_presenter.asteroids.first).to be_a(Asteroid)
      end
    end
  end
end
