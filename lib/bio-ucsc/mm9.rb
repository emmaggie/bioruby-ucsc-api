#
# = AUTOMATIC Table Definition of mm9
# Copyright::   Copyright (C) 2011, 2012
#               MISHIMA, Hiroyuki
#               <missy at be.to / hmishima at nagasaki-u.ac.jp> 
# License::     The Ruby licence (Ryby's / GPLv2 dual)
#

require "#{::File.dirname(__FILE__)}/db_connector"
require "#{::File.dirname(__FILE__)}/table_class_detector"

module Bio
  module Ucsc
    module Mm9
      CHROMS = 
%w(ChrM Chr1 Chr2 Chr3 Chr4 Chr5 Chr6 Chr7 Chr8 Chr9
Chr10 Chr11 Chr12 Chr13 Chr14 Chr15 Chr16 Chr17 Chr18 Chr19
ChrX ChrY)

      extend TableClassDetector
      include DBConnector
      DBConnection.database "mm9"

      base = "#{::File.dirname(__FILE__)}/mm9"
      autoload :ChainBraFlo1, "#{base}/chainbraflo1"
      autoload :ChainBraFlo1Link, "#{base}/chainbraflo1link"
      autoload :ChainCanFam2, "#{base}/chaincanfam2"
      autoload :ChainCanFam2Link, "#{base}/chaincanfam2link"
      autoload :ChainCavPor3, "#{base}/chaincavpor3"
      autoload :ChainCavPor3Link, "#{base}/chaincavpor3link"
      autoload :ChainFr2, "#{base}/chainfr2"
      autoload :ChainFr2Link, "#{base}/chainfr2link"
      autoload :ChainGalGal3, "#{base}/chaingalgal3"
      autoload :ChainGalGal3Link, "#{base}/chaingalgal3link"
      autoload :ChainGasAcu1, "#{base}/chaingasacu1"
      autoload :ChainGasAcu1Link, "#{base}/chaingasacu1link"
      autoload :ChainOrnAna1, "#{base}/chainornana1"
      autoload :ChainOrnAna1Link, "#{base}/chainornana1link"
      autoload :ChainOryLat2, "#{base}/chainorylat2"
      autoload :ChainOryLat2Link, "#{base}/chainorylat2link"
      autoload :ChainPetMar1, "#{base}/chainpetmar1"
      autoload :ChainPetMar1Link, "#{base}/chainpetmar1link"
      autoload :ChainPonAbe2, "#{base}/chainponabe2"
      autoload :ChainPonAbe2Link, "#{base}/chainponabe2link"
      autoload :ChainRheMac2, "#{base}/chainrhemac2"
      autoload :ChainRheMac2Link, "#{base}/chainrhemac2link"
      autoload :ChainRn4, "#{base}/chainrn4"
      autoload :ChainRn4Link, "#{base}/chainrn4link"
      autoload :Est, "#{base}/est"
      autoload :Gap, "#{base}/gap"
      autoload :Gold, "#{base}/gold"
      autoload :IntronEst, "#{base}/intronest"
      autoload :Mrna, "#{base}/mrna"
      autoload :Rmsk, "#{base}/rmsk"
    end
  end
end
