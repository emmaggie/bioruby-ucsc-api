# -*- coding: utf-8 -*-
# = hg18/wgencodecaltechrnaseqrawsignalrep2gm12878celllongpolyabb12x75.rb
# Copyright::
#  Copyright (C) 2011 MISHIMA, Hiroyuki
#                <missy at be.to / hmishima at nagasaki-u.ac.jp> 
# License::     The Ruby licence (Ryby's / GPLv2 dual)
#
# = Table desfription in UCSC Table Browser
# This track is produced as part of the ENCODE Project.
#
#  none

module Bio
  module Ucsc
    module Hg18
      class WgEncodeCaltechRnaSeqRawSignalRep2Gm12878CellLongpolyaBb12x75 < DBConnection
        extend Bio::Ucsc::Hg18::QueryUsingChromBin
        set_table_name 'wgEncodeCaltechRnaSeqRawSignalRep2Gm12878CellLongpolyaBb12x75'
        set_primary_key nil
      end 
    end # module Hg18
  end # module Ucsc
end # Bio
