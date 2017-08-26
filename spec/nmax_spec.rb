require "spec_helper"

RSpec.describe Nmax do
  it "has a version number" do
    expect(Nmax::VERSION).not_to be nil
  end

  context '#execute(text, n)' do
    let(:text_with_numbers) { 'lollol 123 33434 32 1324 545 lol -34-' }
    let(:text_without_numbers) { 'lol lollool' }

    it 'message if n not a number' do
      expect { Nmax.execute(text_with_numbers, 0) }.to output("argument invalid\n").to_stdout
    end

    it 'message if text has no numbers' do
      expect { Nmax.execute(text_without_numbers, 5) }.to output("numbers has not found\n").to_stdout
    end

    it 'puts n biggest numbers' do
      expect { Nmax.execute(text_with_numbers, 1) }.to output("33434\n").to_stdout
      expect { Nmax.execute(text_with_numbers, 2) }.to output("1324\n33434\n").to_stdout
      expect { Nmax.execute(text_with_numbers, 3) }.to output("545\n1324\n33434\n").to_stdout
    end

    it 'puts all numbers if n > numbers count' do
      expect { Nmax.execute(text_with_numbers, 300) }.to output("32\n34\n123\n545\n1324\n33434\n").to_stdout
    end
  end
end
