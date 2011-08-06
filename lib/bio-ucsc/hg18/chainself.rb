# = hg18/chainself.rb
# Copyright::
#  Copyright (C) 2011 MISHIMA, Hiroyuki <missy at be.to / hmishima at nagasaki-u.ac.jp> 
# License::     The Ruby licence (Ryby's / GPLv2 dual)
#
# In the hg18 database, this table is actually separated
# into "chr1_*", "chr2_*", etc. This class dynamically
# define *::Chr1_*, *::Chr2_*, etc. The
# Rmsk.find_by_interval calls an appropreate class automatically.

module Bio
  module Ucsc
    module Hg18

      class ChainSelf
        %w(ChrM Chr1 Chr2 Chr3 Chr4 Chr5 Chr6 Chr7 Chr8 Chr9
Chr10 Chr11 Chr12 Chr13 Chr14 Chr15 Chr16 Chr17 Chr18 Chr19
Chr20 Chr21 Chr22 ChrX ChrY).each do |chr|
          class_eval %!
            class #{chr}_ChainSelf < DBConnection
              set_table_name "#{chr.downcase}_chainSelf"
              set_primary_key nil
              set_inheritance_column nil

              def self.find_by_interval(interval, opt = {:partial => true})
                find_first_or_all_by_interval(interval, :first, opt)
              end
        
              def self.find_all_by_interval(interval, opt = {:partial => true})
                find_first_or_all_by_interval(interval, :all, opt)
              end

              def self.find_first_or_all_by_interval(interval, first_all, opt)
                zstart = interval.zero_start
                zend   = interval.zero_end
                if opt[:partial] == true
                  where = <<-SQL
      tName = :chrom
AND   bin in (:bins)
AND ((tStart BETWEEN :zstart AND :zend)
 OR  (tEnd BETWEEN :zstart AND :zend)
 OR  (tStart <= :zstart AND tEnd >= :zend))
                  SQL
                else
                  where = <<-SQL
      tName = :chrom
AND   bin in (:bins)
AND ((tStart BETWEEN :zstart AND :zend)
AND  (tEnd BETWEEN :zstart AND :zend))
                  SQL
                end
                cond = {
                  :chrom  => interval.chrom,
                  :bins   => Bio::Ucsc::UcscBin.bin_all(zstart, zend),
                  :zstart => zstart,
                  :zend   => zend,
                }
                self.find(first_all,
                          :select => "*",
                          :conditions => [where, cond],)
              end
            end
          !
        end # each chromosome

        def self.find_by_interval(interval, opt = {:partial => true})
          chr_klass = self.const_get("#{interval.chrom.capitalize}_ChainSelf")
          chr_klass.__send__(:find_by_interval, interval, opt)
        end

        def self.find_all_by_interval(interval, opt = {:partial => true})
          chr_klass = self.const_get("#{interval.chrom.capitalize}_ChainSelf")
          chr_klass.__send__(:find_all_by_interval, interval, opt)
        end
      end # class

    end # module Hg18 
  end # module Ucsc
end # module Bio
