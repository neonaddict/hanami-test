RSpec.describe Book, type: :entity do
  it 'can be initialized with attributes' do
    book = Book.new(title: 'Hard to Be a God', author: 'Strugatsky Brothers')
    expect(book.title).to eq('Hard to Be a God')
    expect(book.author).to eq('Strugatsky Brothers')
  end
end
