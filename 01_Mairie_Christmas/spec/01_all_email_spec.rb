require_relative '../lib/01_all_email.rb'

describe "check if there's bedarieux and Perols in the values" do
    it "Perols and bedarieux= true" do
      expect(iscommunethere).to eq(true)
    end
end


#describe "check if there's few symbols" do
    #it "Check BTC, DOT, UST, ATOM" do
      #expect(hash_check).to eq(true)
    #end
#end
