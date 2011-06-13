#
# = hg18/snp128exceptions.rb
# Copyright::
#  Copyright (C) 2011 MISHIMA, Hiroyuki <missy at be.to / hmishima at nagasaki-u.ac.jp> 
# License::     The Ruby licence (Ryby's / GPLv2 dual)
#
# = Table description in UCSC Table Browser
# snp128Exceptions 

module Bio
  module Ucsc
    module Hg18
      class Snp128Exceptions < DBConnection
        extend Bio::Ucsc::Hg18::QueryUsingChromBin
        set_table_name 'snp128Exceptions'
        set_primary_key nil
       end
    end
  end
end