# -*- coding: utf-8 -*-
# = hg18/switchdbytss.rb
# Copyright::
#  Copyright (C) 2011 MISHIMA, Hiroyuki <missy at be.to / hmishima at nagasaki-u.ac.jp> 
# License::     The Ruby licence (Ryby's / GPLv2 dual)
#
# = Table description in UCSC Table Browser
# SwitchGear TSS - SwitchGear Genomics Transcription Start Sites
#
# = ommitted dynamic method(s) due to the method name collision
#  none

module Bio
  module Ucsc
    module Hg18
      class SwitchDbTss < DBConnection
        extend Bio::Ucsc::Hg18::QueryUsingChromBin
        set_table_name 'switchDbTss'
        set_primary_key nil
      end 
    end # module Hg18
  end # module Ucsc
end # Bio