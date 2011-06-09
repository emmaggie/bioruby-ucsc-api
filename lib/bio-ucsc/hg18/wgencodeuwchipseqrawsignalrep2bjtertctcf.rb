# -*- coding: utf-8 -*-
# = hg18/wgencodeuwchipseqrawsignalrep2bjtertctcf.rb
# Copyright::
#  Copyright (C) 2011 MISHIMA, Hiroyuki
#                <missy at be.to / hmishima at nagasaki-u.ac.jp> 
# License::     The Ruby licence (Ryby's / GPLv2 dual)
#
# = Table desfription in UCSC Table Browser
# UW Histone - ENCODE Histone Modifications by Univ. Washington
# ChIP-seq
#
# = ommitted dynamic method(s) due to the method name collision
#  none

module Bio
  module Ucsc
    module Hg18
      class WgEncodeUwChIPSeqRawSignalRep2BjtertCtcf < DBConnection
        extend Bio::Ucsc::Hg18::QueryUsingChromBin
        set_table_name 'wgEncodeUwChIPSeqRawSignalRep2BjtertCtcf'
        set_primary_key nil
      end 
    end # module Hg18
  end # module Ucsc
end # Bio
