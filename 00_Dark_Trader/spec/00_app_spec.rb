require_relative '../lib/00_app.rb'

describe "check if there's 20 values" do
    it "values=20" do
      expect(hash_count).to eq(20)
    end
end


describe "check if there's few symbols" do
    it "Check BTC, DOT, UST, ATOM" do
      expect(hash_check).to eq(true)
    end
end
