# -*- coding: utf-8 -*-
# = hg19/gbseq.rb
# Copyright::
#  Copyright (C) 2011 MISHIMA, Hiroyuki <missy at be.to / hmishima at nagasaki-u.ac.jp> 
# License::     The Ruby licence (Ryby's / GPLv2 dual)
#
# = Table desfription in UCSC Table Browser 
# Information about sequences contained in files described in
# gbExtFile
#
# = ommitted dynamic method(s) due to the method name collision
#  none

module Bio
  module Ucsc
    module Hg19
      class GbSeq < DBConnection
        set_table_name 'gbSeq'
        set_primary_key :id
        columns_hash.delete("type")
      end 
    end # module Hg19
  end # module Ucsc
end # Bio
