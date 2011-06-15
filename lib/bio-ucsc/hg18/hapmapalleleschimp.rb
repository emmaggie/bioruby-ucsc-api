# -*- coding: utf-8 -*-
# = hg18/hapmapallelschimp.rb
# Copyright::
#  Copyright (C) 2011 MISHIMA, Hiroyuki
#                <missy at be.to / hmishima at nagasaki-u.ac.jp> 
# License::     The Ruby licence (Ryby's / GPLv2 dual)
#
# = Table desfription in UCSC Table Browser
# The HapMap Project identified a set of approximately four million
# common SNPs, and genotyped these SNPs in four populations in Phase
# II of the project. In Phase III, it genotyped approximately 1.4 to
# 1.5 million SNPs in eleven populations. This track shows the
# combined data from Phases II and III. The intent is that this data
# can be used as a reference for future studies of human disease. This
# track displays the genotype counts and allele frequencies of those
# SNPs, and (when available) shows orthologous alleles from the chimp
# and macaque reference genome assemblies.
#
# Ortho alleles for HapMap SNPs: Chimp
#
# = ommitted dynamic method(s) due to the method name collision
#  none

module Bio
  module Ucsc
    module Hg18
      class HapmapAllelesChimp < DBConnection
        extend Bio::Ucsc::Hg18::QueryUsingChromBin

        set_table_name 'hapmapAllelesChimp'
        set_primary_key nil
      end
    end
  end
end