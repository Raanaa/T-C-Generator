require_relative '../generator.rb'

RSpec.describe Generator do
  describe '#generate' do
    it "Creates T&C document" do
        T_C_example = File.read("T_C_example.txt")
        expect(Generator.new.generate("clauses.txt" , "sections.txt" , "template_example.txt")).to eq(T_C_example)
    end
  end
end