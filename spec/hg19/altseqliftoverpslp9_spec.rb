require 'bio-ucsc'
describe "Bio::Ucsc::Hg19::AltSeqLiftOverPslP9" do 

  describe "#find_by_interval" do
    context "given range chr1:1-300,000,000" do
      it 'returns (r.tName == "chr1")' do
        Bio::Ucsc::Hg19::DBConnection.default
        Bio::Ucsc::Hg19::DBConnection.connect
        i = Bio::GenomicInterval.parse("chr1:1-300,000,000")
        r = Bio::Ucsc::Hg19::AltSeqLiftOverPslP9.find_by_interval(i)
        r.tName.should == "chr1"
      end
    end
  end

end
