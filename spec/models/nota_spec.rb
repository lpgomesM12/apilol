require "rails_helper"

RSpec.describe Nota, type: :model do
  context "Validando" do  
    it "Nota válida?" do
      nota = Nota.new(:titulo => "Titulo nota teste", :texto => "Texto nota teste")
      expect(nota.valid?).to be_truthy
    end 
    
    it "Contado default?" do
      nota = Nota.new
      expect(nota.default_cont).to eql(0)
    end 
  end
end