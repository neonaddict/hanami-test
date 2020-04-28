require 'features_helper'

RSpec.describe 'Add a book' do
  after do
    BookRepository.new.clear
  end

  it 'can create a new book' do
    visit '/books/new'

    within 'form#book-form' do
      fill_in 'Title', with: 'Some New Book'
      fill_in 'Author', with: 'Some author'

      click_button 'Create Book'
    end

    expect(page).to have_current_path('/books')
    expect(page).to have_content('Some New Book')
  end
end