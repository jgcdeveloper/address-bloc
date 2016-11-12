require_relative '../models/address_book'

RSpec.describe AddressBook do

  describe "attributes" do
    let(:book) {AddressBook.new}

    it "responds to entries" do
      expect(book).to respond_to(:entries)
    end

    it "initializes entries as an array" do
      expect(book.entries).to be_an(Array)
    end

    it "initializes entries as empty" do
      expect(book.entries.size).to eq(0)
    end
  end

  describe "#add_entry" do
    let(:book) {AddressBook.new}

    it "adds only one entry to the address book" do
      book.add_entry('Lucian Darteel', '000.000.0000', 'none@none.com')
      expect(book.entries.size).to eq(1)
    end

    it "adds the correct information to entries" do
      book.add_entry('Lucian Darteel', '000.000.0000', 'none@none.com')
      new_entry = book.entries[0]

      expect(new_entry.name).to eq('Lucian Darteel')
      expect(new_entry.phone_number).to eq('000.000.0000')
      expect(new_entry.email).to eq('none@none.com')
    end
  end

 end
