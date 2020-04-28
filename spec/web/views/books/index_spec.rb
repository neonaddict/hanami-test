RSpec.describe Web::Views::Books::Index do
  let(:exposures) { Hash[books: []] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/books/index.html.erb') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #books' do
    expect(view.books).to eq exposures.fetch(:books)
  end

  context 'when there are no books' do
    it 'shows a placeholder message' do
      expect(rendered).to include('<p class="placeholder">There are no books yet.</p>')
    end
  end

  context 'when there are books' do
    let(:book_1) { Book.new(title: '1984', author: 'George Orwell') }
    let(:book_2) { Book.new(title: 'Hard to Be a God', author: 'Strugatsky Brothers') }
    let(:all_books) { BookRepository.new.all }
    let(:exposures) { Hash[books: [book_1, book_2]] }

    it 'lists them all' do
      expect(rendered.scan(/class="book"/).length).to eq(all_books.count)
      expect(rendered).to include('1984')
      expect(rendered).to include('Hard to Be a God')
    end

    it 'hides the placeholder message' do
      expect(rendered).to_not include('<p class="placeholder">There are no books yet.</p>')
    end
  end
end
