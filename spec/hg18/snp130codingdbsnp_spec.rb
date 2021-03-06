require 'bio-ucsc'
describe "Bio::Ucsc::Hg18::Snp130CodingDbSnp" do 

  describe "#find_by_interval" do
    context "given range chr1:1-80,000" do
      it "returns an result with column accessors" do
        Bio::Ucsc::Hg18::DBConnection.default
        Bio::Ucsc::Hg18::DBConnection.connect
        i = Bio::GenomicInterval.parse("chr1:1-80,000")
        r = Bio::Ucsc::Hg18::Snp130CodingDbSnp.find_by_interval(i)
        r.chrom.should == "chr1"
      end
    end
  end

end
