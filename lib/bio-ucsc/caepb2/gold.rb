# Copyright::
#  Copyright (C) 2011 MISHIMA, Hiroyuki <missy at be.to / hmishima at nagasaki-u.ac.jp> 
# License::     The Ruby licence (Ryby's / GPLv2 dual)
#
# his table is actually separated
# into "chr1_*", "chr2_*", etc. This class dynamically
# define *::Chr1_*, *::Chr2_*, etc. The
# Rmsk.find_by_interval calls an appropreate class automatically.

module Bio
  module Ucsc
    module CaePb2

      class Gold
        include DBConnector
        DBConnection.database "caePb2"

        KLASS = "Gold"
        KLASS_S = "gold"

        Bio::Ucsc::CaePb2::CHROMS.each do |chr|
          class_eval %!
            class #{chr[0..0].upcase + chr[1..-1]}_#{KLASS} < DBConnection
              set_table_name "#{chr[0..0].downcase + chr[1..-1]}_#{KLASS_S}"
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
      chrom = :chrom
AND   bin in (:bins)
AND ((chromStart BETWEEN :zstart AND :zend)
 OR  (chromEnd BETWEEN :zstart AND :zend)
 OR  (chromStart <= :zstart AND chromEnd >= :zend))
                  SQL
                else
                  where = <<-SQL
      chrom = :chrom
AND   bin in (:bins)
AND ((chromStart BETWEEN :zstart AND :zend)
AND  (chromEnd BETWEEN :zstart AND :zend))
                  SQL
                end
                cond = {
                  :chrom  => interval.chrom,
                  :bins   => Bio::Ucsc::UcscBin.bin_all(zstart, zend),
                  :zstart => zstart,
                  :zend   => zend,
                }
                self.find(first_all,
                          { :select => "*",
                            :conditions => [where, cond], })
              end
            end
          !
        end # each chromosome

        def self.find_by_interval(interval, opt = {:partial => true})
          chrom = interval.chrom[0..0].upcase + interval.chrom[1..-1]
          chr_klass = self.const_get("#{chrom}_#{KLASS}")
          chr_klass.__send__(:find_by_interval, interval, opt)
        end

        def self.find_all_by_interval(interval, opt = {:partial => true})
          chrom = interval.chrom[0..0].upcase + interval.chrom[1..-1]
          chr_klass = self.const_get("#{chrom}_#{KLASS}")
          chr_klass.__send__(:find_all_by_interval, interval, opt)
        end
      end # class

    end # module Hg18 
  end # module Ucsc
end # module Bio
