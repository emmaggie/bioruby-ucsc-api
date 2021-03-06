require "bio-ucsc"
require "pp"

describe "Bio::Ucsc::DroAna2" do

  before(:all) do
    Bio::Ucsc::DroAna2::DBConnection.connect
  end

  describe "Bio::Ucsc::DroAna2::All_mrna" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::All_mrna.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::Author" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::Author.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::BlastDm2FB" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::BlastDm2FB.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::Cds" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::Cds.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::Cell" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::Cell.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::ChainDm3" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::ChainDm3.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::ChainDm3Link" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::ChainDm3Link.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::ChromInfo" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::ChromInfo.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::Description" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::Description.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::Development" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::Development.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::Gap" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::Gap.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::GbCdnaInfo" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::GbCdnaInfo.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::GbExtFile" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::GbExtFile.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::GbLoaded" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::GbLoaded.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::GbMiscDiff" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::GbMiscDiff.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::GbSeq" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::GbSeq.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::GbStatus" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::GbStatus.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::GbWarn" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::GbWarn.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::Gc5Base" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::Gc5Base.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::GeneMapper" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::GeneMapper.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::GeneName" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::GeneName.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::Genscan" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::Genscan.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::GenscanPep" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::GenscanPep.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::Gold" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::Gold.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::Grp" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::Grp.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::HgFindSpec" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::HgFindSpec.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::History" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::History.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::ImageClone" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::ImageClone.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::Keyword" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::Keyword.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::Library" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::Library.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::MrnaClone" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::MrnaClone.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::MrnaOrientInfo" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::MrnaOrientInfo.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::NetDm3" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::NetDm3.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::Organism" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::Organism.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::ProductName" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::ProductName.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::RefLink" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::RefLink.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::RefSeqStatus" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::RefSeqStatus.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::RefSeqSummary" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::RefSeqSummary.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::Rmsk" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::Rmsk.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::Sex" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::Sex.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::SimpleRepeat" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::SimpleRepeat.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::Source" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::Source.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::TableDescriptions" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::TableDescriptions.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::Tissue" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::Tissue.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::TrackDb" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::TrackDb.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::XenoMrna" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::XenoMrna.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::XenoRefFlat" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::XenoRefFlat.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::XenoRefGene" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::XenoRefGene.first
        pp result
        result.should be_true
      end
    end
  end 

  describe "Bio::Ucsc::DroAna2::XenoRefSeqAli" do
    context ".first" do
      it 'returns the first records' do
        result = Bio::Ucsc::DroAna2::XenoRefSeqAli.first
        pp result
        result.should be_true
      end
    end
  end 

end
