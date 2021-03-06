#!/usr/bin/env ruby
# elephant LoxAfr3 spec generator

SPEC_FILE = "../spec/loxafr3_spec.rb"
KLASS = "Bio::Ucsc::LoxAfr3"

TABLES = %w(
all_mrna
author
blastHg18KG
cds
cell
chainHg19
chainHg19Link
chainMm9
chainMm9Link
chromInfo
description
development
ensGene
ensGtp
ensPep
gap
gbCdnaInfo
gbExtFile
gbLoaded
gbMiscDiff
gbSeq
gbStatus
gbWarn
gc5Base
geneName
gold
grp
hgFindSpec
history
imageClone
keyword
library
mrnaClone
mrnaOrientInfo
nestedRepeats
netHg19
netMm9
organism
productName
quality
refLink
refSeqStatus
refSeqSummary
rmsk
sex
simpleRepeat
source
tableDescriptions
tissue
trackDb
xenoMrna
xenoRefFlat
xenoRefGene
xenoRefSeqAli
)

def headup(str)
  (str[0..0].upcase + str[1..-1]) 
end

open(SPEC_FILE, 'w') do |fout|
  fout.puts <<"EOS"
require "bio-ucsc"
require "pp"

describe "#{KLASS}" do

  before(:all) do
    #{KLASS}::DBConnection.connect
  end

EOS

  TABLES.each do |table|
    next if table.start_with?('#')
    fout.puts <<"EOS"
  describe "#{KLASS}::#{headup(table)}" do
    context ".first" do
      it 'returns the first records' do
        result = #{KLASS}::#{headup(table)}.first
        pp result
        result.should be_true
      end
    end
  end 

EOS
  end

  fout.puts "end"
end

