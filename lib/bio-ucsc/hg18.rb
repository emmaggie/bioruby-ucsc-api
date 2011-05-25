#
# = hg18/ucsc.rb
# Copyright::   Cioyrught (C) 2011
#               MISHIMA, Hiroyuki <missy at be.to / hmishima at nagasaki-u.ac.jp> 
# Copyright::   Copyright (C) 2008
#               Jan Aerts <jan.aerts@gmail.com>
# License::     Ruby's

base = "#{File.dirname(__FILE__)}/hg18"
require "#{base}/db_connection"
require "#{base}/activerecord"

module Bio
  module Ucsc
    module Hg18
      base = "#{File.dirname(__FILE__)}/hg18"
      # Reference sequence retrieval via the 2bit file
      autoload :Reference,    "#{base}/reference"

      # group: Mapping and Sequencing Tracks ----------
      #
      ## track: Chromosome Band
      autoload :CytoBand,     "#{base}/cytoband"
      ## track: STS Markers
      autoload :StsMap,       "#{base}/stsmap"
      autoload :FishClones,   "#{base}/fishclones"
      autoload :StsAlias,     "#{base}/stsalias"
      autoload :StsInfo2,     "#{base}/stsinfo2"
      ## track: FISH Clones
             # :FishClones
      autoload :All_Bacends,  "#{base}/all_bacends"
      autoload :BacEndPairs,  "#{base}/bacendpairs"
      autoload :ClonePos,     "#{base}/clonepos"
      autoload :Seq,          "#{base}/seq"
             # :StsAlias
             # :StsInfo2
             # :StsMap
      ## track: Recomb Rate
      autoload :RecombRate,   "#{base}/recombrate"
      ## track: Map Contigs
      autoload :CtgPos,       "#{base}/ctgpos"
      ## track: Assembly
      autoload :Gold,           "#{base}/gold"
             # :ClonePos
             # :FishClones
      autoload :Hg18ContigDiff, "#{base}/hg18contigdiff"
             # :Seq
      ## track: Gap
      autoload :Gap,            "#{base}/gap"
      ## track: Coverage
             # :ClonePos
             # :FishClones
             # :Seq
      ## track: BAC End Pairs
             # :BacEndPairs
             # :All_Bacends
             # :FishClones
      ## track: Fosmid End Pairs
      autoload :FosEndPairs,    "#{base}/fosendpairs"
      autoload :All_Fosends,    "#{base}/all_fosends"
      ## track: GC Parcent
      autoload :Gc5Base,        "#{base}/gc5base"
      ## track: Hg19 Dif
             # :Hg18ContigDiff
      ## track: Wiki Track
      autoload :Hgcentral_WikiTrack, "#{base}/hgcentral_wikitrack"
      ## track BU ORChID
             # only "filname" tables
      ## track Mapability
      autoload :WgEncodeBroadMapabilityAlign36mer, "#{base}/wgencodebroadmapabilityalign36mer"
      autoload :WgEncodeDukeUniqueness20bp,        "#{base}/wgencodedukeuniqueness20bp"
      autoload :WgEncodeDukeUniqueness24bp,        "#{base}/wgencodedukeuniqueness24bp"
      autoload :WgEncodeDukeUniqueness35bp,        "#{base}/wgencodedukeuniqueness35bp"
      autoload :Uniqueness,                        "#{base}/uniqueness"
      autoload :WgEncodeUmassMapabilityUniq15,     "#{base}/wgencodeumassmapabilityuniq15"
      autoload :WgEncodeDukeRegionsExcluded,       "#{base}/wgencodedukeregionsexcluded"

      # group: Phenotype and Disease Associations ----------
      #
      ## track: GAD View
      autoload :Gad,          "#{base}/gad"
      autoload :KgXref,       "#{base}/kgxref"
      ## track: R-DMR
      autoload :Rdmr,         "#{base}/rdmr"
      autoload :RdmrRaw,      "#{base}/rdmrraw"
      ## track: OMIM Genes
      autoload :OmimGene,             "#{base}/omimgene"
      autoload :OmimGeneMap,          "#{base}/omimgenemap"
      autoload :OmimMorbidMap,        "#{base}/omimmorbidmap"
      autoload :OmimToKnownCanonical, "#{base}/omimtoknowncanonical"
      autoload :RefLink,              "#{base}/reflink"
      ## track: GWAS Catalog
      autoload :GwasCatalog,          "#{base}/gwascatalog"
      autoload :Snp130,               "#{base}/snp130"
      autoload :Snp130CodingDbSnp,    "#{base}/snp130codingdbsnp"
      autoload :Snp130Exceptions,     "#{base}/snp130exceptions"
      autoload :Snp130OrthoPt2Pa2Rm2, "#{base}/snp130orthopt2pa2rm2"
      autoload :Snp130Seq,            "#{base}/snp130seq"
      autoload :SnpArrayIlluminaHuman660W_Quad, "#{base}/snparrayilluminahuman660w_quad"
      autoload :SnpArrayIlluminaHumanCytoSNP_12, "#{base}/snparrayilluminahumancytosnp_12"
      autoload :SnpArrayIlluminaHumanOmni1_Quad, "#{base}/snparrayilluminahumanomni1_quad"
      ## track: RGD Human QTL
      autoload :RgdQtl,       "#{base}/rgdqtl"
      autoload :RgdQtlLink,   "#{base}/rgdqtllink"
      ## track: RGD Rat QTL
      autoload :RgdRatQtl,     "#{base}/rgdratqtl"
      autoload :RgdRatQtlLink, "#{base}/rgdratqtllink"
      ## track: MGI Mouse QTL
      autoload :JaxQtlAsIs,    "#{base}/jaxqtlasis"
      autoload :JaxQtlPadded,  "#{base}/jaxqtlpadded"

      # group: Genes and Gene Prediction Tracks ----------
      #
      ## track: UCSC Genes
      autoload :KnownGene,                     "#{base}/knowngene"
      autoload :AffyExonTissuesGs,             "#{base}/affyexontissuesgs"
      autoload :AffyExonTissuesGsMedian,       "#{base}/affyexontissuesgsmedian"
      autoload :AffyExonTissuesGsMedianDist,   "#{base}/affyexontissuesgsmediandist"
      autoload :BioCycPathway,                 "#{base}/biocycpathway"
      autoload :CcdsKgMap,                     "#{base}/ccdskgmap"
      autoload :CeBlastTab,                    "#{base}/ceblasttab"
      autoload :DmBlastTab,                    "#{base}/dmblasttab"
      autoload :DrBlastTab,                    "#{base}/drblasttab"
      autoload :FoldUtr3,                      "#{base}/foldutr3"
      autoload :FoldUtr5,                      "#{base}/foldutr5"
      autoload :GnfAtlas2Distance,             "#{base}/gnfatlas2distance"
      autoload :GnfU95Distance,                "#{base}/gnfu95distance"
      autoload :HgFixed_TransMapGeneUcscGenes, "#{base}/hgfixed_transmapgeneucscgenes"
      autoload :HumanHprdP2P,                  "#{base}/humanhprdp2p"
      autoload :HumanVidalP2P,                 "#{base}/humanvidalp2p"
      autoload :HumanWankerP2P,                "#{base}/humanwankerp2p"
      autoload :KeggPathway,                   "#{base}/keggpathway"
      autoload :Kg2ToKg3,                      "#{base}/kg2tokg3"
      autoload :Kg3ToKg4,                      "#{base}/kg3tokg4"
      autoload :Kg3ToKg4,                      "#{base}/kg3tokg4"
      autoload :KgAlias,                       "#{base}/kgalias"
      autoload :KgColor,                       "#{base}/kgcolor"  
      autoload :KgProtAlias,                   "#{base}/kgprotalias"  
      autoload :KgProtMap2,                    "#{base}/kgprotmap2"
      autoload :KgSpAlias,                     "#{base}/kgspalias"
      autoload :KgTargetAli,                   "#{base}/kgtargetali"
      autoload :KgTxInfo,                      "#{base}/kgtxinfo"
             # :KgXref
      autoload :KnownBlastTab,                 "#{base}/knownblasttab"
      autoload :KnownCanonical,                "#{base}/knowncanonical"
      autoload :KnownGeneMrna,                 "#{base}/knowngenemrna"
      autoload :KnownGenePep,                  "#{base}/knowngenepep"
      autoload :KnownIsoforms,                 "#{base}/knownisoforms"
      autoload :KnownToAllenBrain,             "#{base}/knowntoallenbrain"
      autoload :KnownToEnsembl,                "#{base}/knowntoensembl"
      autoload :KnownToGnf1h,                  "#{base}/knowntognf1h"
      autoload :KnownToGnfAtlas2,              "#{base}/knowntognfatlas2"
      autoload :KnownToHInv,                   "#{base}/knowntohinv"
      autoload :KnownToHprd,                   "#{base}/knowntohprd"

      autoload :RefGene,      "#{base}/refgene"
      autoload :Dgv,          "#{base}/dgv"
      autoload :CnpIafrate2,  "#{base}/cnpiafrate2"
      autoload :CnpLocke,     "#{base}/cnplocke"
      autoload :CnpRedon,     "#{base}/cnpredon"
      autoload :CnpSebat2,    "#{base}/cnpsebat2"
      autoload :CnpSharp2,    "#{base}/cnpsharp2"
      autoload :Rmsk,         "#{base}/rmsk.rb"
    end
  end
end
