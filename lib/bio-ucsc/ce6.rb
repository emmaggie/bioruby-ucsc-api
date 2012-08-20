#
# = AUTOMATIC Table Definition of ce6
# Copyright::   Copyright (C) 2011, 2012
#               MISHIMA, Hiroyuki
#               <missy at be.to / hmishima at nagasaki-u.ac.jp> 
# License::     The Ruby licence (Ryby's / GPLv2 dual)
#

require "#{::File.dirname(__FILE__)}/table_class_detector"

module Bio
  module Ucsc
    module Ce6
      CHROMS = %w(chrI chrII chrIII chrIV chrV chrM chrX)

      extend TableClassDetector
      def self.default
        DBConnection.default
      end

      def self.connect(param = Hash.new)
        DBConnection.db_adapter = param[:db_adapter] if param[:db_adapter]
        DBConnection.db_host = param[:db_host] if param[:db_host]
        DBConnection.db_username = param[:db_username] if param[:db_username]
        DBConnection.password = param[:password] if param[:password]
        DBConnection.connect
      end

      class DBConnection < ActiveRecord::Base
        include SafeAttributes
        self.inheritance_column = 'dummy_not_to_use'

        @@db_adapter  ||= 'mysql'
        @@db_host     ||= 'genome-mysql.cse.ucsc.edu'
        @@db_username ||= 'genome'
        @@db_password ||= ''
        @@db_name     ||= 'ce6'

        cattr_accessor :db_adapter, :db_host, :db_username, :db_password

        self.abstract_class = true

        def self.default
          @@db_adapter  = 'mysql'
          @@db_host     = 'genome-mysql.cse.ucsc.edu'
          @@db_username = 'genome'
          @@db_password = ''
        end

        def self.connect
          establish_connection({ :adapter =>  @@db_adapter,
                                 :host =>     @@db_host,
                                 :database => @@db_name,
                                 :username => @@db_username,
                                 :password => @@db_password, })
        end
      end # class DBConnection
      
      base = "#{::File.dirname(__FILE__)}/ce6"
      autoload :T25mersRepeats, "#{base}/t25mersrepeats"
      autoload :ChainCaeJap1, "#{base}/chaincaejap1"
      autoload :ChainCaeJap1Link, "#{base}/chaincaejap1link"
      autoload :ChainCaePb2, "#{base}/chaincaepb2"
      autoload :ChainCaePb2Link, "#{base}/chaincaepb2link"
      autoload :ChainCaeRem3, "#{base}/chaincaerem3"
      autoload :ChainCaeRem3Link, "#{base}/chaincaerem3link"
      autoload :ChainCb3, "#{base}/chaincb3"
      autoload :ChainCb3Link, "#{base}/chaincb3link"
      autoload :ChainPriPac1, "#{base}/chainpripac1"
      autoload :ChainPriPac1Link, "#{base}/chainpripac1link"
      autoload :ChainSelf, "#{base}/chainself"
      autoload :ChainSelfLink, "#{base}/chainselflink"
      autoload :Est, "#{base}/est"
      autoload :IntronEst, "#{base}/intronest"
      autoload :Gap, "#{base}/gap"
      autoload :Gold, "#{base}/gold"
      autoload :Mrna, "#{base}/mrna"
      autoload :Rmsk, "#{base}/rmsk"
    end
  end
end
