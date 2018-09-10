require 'rails_helper'

describe SearchPresenter do
  it 'exists' do
    start_date = "2018-09-08"
    end_date = "2018-09-14"

    search_presenter = SearchPresenter.new(start_date, end_date)
    expect(search_presenter).to be_a(SearchPresenter)
  end

  context 'instance methods' do
    context '#asteroids' do
      it 'returns most dangerous days' do
        start_date = "2018-09-08"
        end_date = "2018-09-14"
        search_presenter = SearchPresenter.new(start_date, end_date)

        expect(search_presenter.asteroids.count).to eq(2)
        expect(search_presenter.asteroids.first).to be_a(Asteroid)
      end
    end
  end
end
