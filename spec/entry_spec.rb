require_relative '../models/entry'

RSpec.describe Entry do

  describe "attributes" do
    let(:entry) { Entry.new('Lucian Darteel', '000.000.0000', 'none@none.com') }

    it "responds to name" do
      expect(entry).to respond_to(:name)
    end

    it "reports its name" do
      expect(entry.name).to eq('Lucian Darteel')
    end

    it "respnds to phone number" do
      expect(entry).to respond_to(:phone_number)
    end

    it "reports its phone number" do
      expect(entry.phone_number).to eq('000.000.0000')
    end

    it "responds to email" do
      expect(entry).to respond_to(:email)
    end

    it "reports its email" do
      expect(entry.email).to eq('none@none.com')
    end
  end

  describe "#to_s" do
    it "prints an entry as a string" do
      entry = Entry.new('Lucian Darteel', '000.000.0000', 'none@none.com')
      expected_string = "Name: Lucian Darteel\nPhone Number: 000.000.0000\nEmail: none@none.com"
      expect(entry.to_s).to eq(expected_string)
    end
  end

end
