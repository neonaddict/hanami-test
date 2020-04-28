require 'features_helper'

RSpec.describe 'List books' do
  let(:repository) { BookRepository.new }

  before do
    repository.clear

    repository.create(title: '1984', author: 'George Orwell')
    repository.create(title: 'Hard to Be a God', author: 'Strugatsky Brothers')
  end

  it 'displays each book on the page' do
    visit '/books'

    within '#books' do
      expect(page).to have_css('.book', count: 2), 'Expected to find 2 books'
    end
  end
end