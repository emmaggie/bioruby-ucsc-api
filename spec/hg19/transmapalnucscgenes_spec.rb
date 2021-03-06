require 'bio-ucsc'
describe "Bio::Ucsc::Hg19::TransMapAlnUcscGenes" do 

  describe "#find_by_interval" do
    context "given range chr1:1-900,000" do
      it "returns an array of results" do
        Bio::Ucsc::Hg19::DBConnection.default
        Bio::Ucsc::Hg19::DBConnection.connect
        i = Bio::GenomicInterval.parse("chr1:1-900,000")
        r = Bio::Ucsc::Hg19::TransMapAlnUcscGenes.find_all_by_interval(i)
        r.should have(1).items
      end

      it 'returns (r.tName == "chr1")' do
        Bio::Ucsc::Hg19::DBConnection.default
        Bio::Ucsc::Hg19::DBConnection.connect
        i = Bio::GenomicInterval.parse("chr1:1-900,000")
        r = Bio::Ucsc::Hg19::TransMapAlnUcscGenes.find_by_interval(i)
        r.tName.should == "chr1"
      end
    end
  end

end
