# bio-ucsc-api version 0.5.0rc

**The Ruby UCSC API**: accessing the UCSC Genome Database using Ruby.

Your comments, suggestions and requests are welcome. Documentation and
feedback are available at the UserEcho site at
http://rubyucscapi.userecho.com/.

# Install

```bash
$ gem install bio-ucsc-api
```

# Features

* Supporting all organisms in the UCSC genome database.
* Using ActiveRecord as an O/R mapping framework. Basically, each tables can access using ActiveRecord method convention.
* Using the Bin index system to improve query performance. This is one of the reason why you use Ruby UCSC API instead of submitting SQL queries directly.
* Supporting genomic sequence query using locally downloaded "2bit" files. Genomic sequences are not stored in UCSC's official MySQL database. 
* Automatic conversion of "1-based full-closed intervals" to internal "0-based left-closed right-open intervals" (see also bioruby-genomic-interval)
* Supporting non-official full/partial mirror MySql hosts (e.g. local servers)
* Using Rspec for the testing framework
* Written in pure Ruby and supporting multiple Ruby interpreter implementations including Ruby1.8, Ruby1.9, and JRuby1.6
* Designed as a BioRuby plugin
* Current version does not support table-linked bigWIG/bigBED/BAM files.

# Supported databases (genome assemblies)

* **human** Hg19, Hg18
* **mammals** chimp (PanTro3), orangutan (PonAbe2), rhesus (RheMac2), marmoset (CalJac3), mouse (Mm9), rat (Rn4), guinea pig (CavPor3), rabbit (OryCun2), cat (FelCat4), panda (AilMel1), dog (CanFam2), horse (EquCab2), pig (SusScr2), sheep (OviAri1), cow (BosTau4), elephant (LoxAfr3), opossum (MonDom5), platypus (OrnAna1)
* **vertebrates** chicken (GalGal3), zebra finch (TaeGut1), lizard (AnoCar2), X. tropicalis (XenTro2), zebrafish (DanRer7), tetraodon (TetNig2), fugu (Fr2), stickleback (GasAcu1), medaka (OryLat2), lamprey (PetMar1)
* **deuterostomes** lancelet (BraFlo1), sea squirt (Ci2), sea urchin (StrPur2)
[insects] D.melanogaster (Dm3), D.simulans (DroSim1), D.sechellia (DroSec1), D.yakuba (DroYak2), D.erecta (DroEre1), D.ananassae (DroAna2), D.pseudoobscura (Dp3), D.persimilis (DroPer1), D.virilis (DroVir2), D.mojavensis (DroMoj2), D.grimshawi (DroGri1), Anopheles mosquito (AnoGam1), honey bee (ApiMel2)
* **nematodes** C.elegans (Ce6), C.brenneri (CaePb3), C.briggsae (Cb3), C.remanei (CaeRem3), C.japonica (CaeJap1), P.pacificus (PriPac1)
* **others** sea hare (AplCal1), yeast (SacCer2)
* **genome assembly independent** Go, HgFixed, Proteome, UniProt, VisiGene

# Implementation
This package is based on the followings:

* original ruby-ucsc-api: https://github.com/jandot/ruby-ucsc-api
* ruby-ensembl-api: https://github.com/jandot/ruby-ensembl-api

Supported Ruby interpreter implementations:

* Ruby version 1.9.2 or later
* Ruby version 1.8.7 or later
* JRuby version 1.6.3 or later - Appropiate Java heap size may have to be specified to invoke JRuby, especially when you use Bio::Ucsc::File::Twobit. Try "jruby -J-Xmx3g your_script.rb" to keep 3G byte heap.

Major dependent gems:

* active_record - http://api.rubyonrails.org/classes/ActiveRecord/Base.html
* safe_attributes - https://github.com/bjones/safe_attributes
* bioruby-genomic-interval - https://github.com/misshie/bioruby-genomic-interval
* mysql (MySQL/Ruby MySQL API module) - http://www.tmtm.org/mysql/ruby/README.html

See also:

* **Strozzi F and Aerts J**: A Ruby API to query the Ensembl database for genomic features. *Bioinformatics* 2011, **27**:1013-1014. http://dx.doi.org/10.1093/bioinformatics/btr050
* UCSCBin library - https://github.com/misshie/UCSCBin
 
# Change Log
* **UPDATE** (v0.4.0): now `<TABLE>#find_by_interval` accepts both "chr1:123-456" and Bio::GenomicInterval objects
* **BUG-FIX** (v0.4.0): By using the safe_attribute gem, newest version of ActiveRecord is supported.
* **UPDATE** (v0.4.0): `Bio::Ucsc::Reference` is moved to `Bio::Ucsc::File::Twobit` (backward compatibility is kept). `Bio::Ucsc::File::Twobit.open` and `Bio::Ucsc::File::Twobit#subseq` is are introduced.
* **UPDATE** (v0.4.0): `<DB_NAME>::DBConnection.connect` is simplified by the new `<DB_NAME>.connect` class method (backward compatibility is kept). Server parameters can be defined by using a hash being an argument of the method.  
* **UPDATE** (v0.3.2): Genomic interval queries are implemented using ARel's relation objects instead of (named) scopes. Usage of the API is not changed.
* **BUG** (v0.3.1): Does not work with ActiveRecord version 3.1.0. Data retrieval methods occur the error, "(Object doesn't support #inspect)". The author is working on this bug. So far, please use version 3.0 seriese. Gemfile for gem dependencies is updated. Thanks for bug reports from Diego F. Pereira.
* **BUG-FIX** (v0.3.1): "func" fields in tables did not work. The bug was fixed.
* **BUG-FIX** (v0.3.1): PredGene-type tables without the bin index did not work. The bug was fixed.
* **NEW** (v0.3.0): Now genomic interval queries are expressed using the named scope "with_interval". 'Table#find_(all_)by_interval' is now deprecated. Sorry for an inconstant API. However, this change enable combination queries using genomic intervals and any fields. 
* **NEW** (v0.3.0): `Bio::GenomicInterval#bin_all` and `Bio::GenomicInterval#bin` return the bin index for the given interval.
* **NEW** (v0.3.0): Supporting JRuby 1.6.3 or later. Appropiate Java heap size may have to be specified to invoke JRuby, especially when you use `Bio::Ucsc::Reference`. Try `jruby -J-Xmx3g your_script.rb` to keep 3G byte heap.
* **NEW** (v0.2.1): New genome assemblies are supported: [chimp] PanTro3, [orangutan] PonAbe2, [rhesus] RheMac2, [marmoset] CalJac3, [rat] Rn4, [guinea pig] CavPor3, [rabbit] OryCun2, [cat] FelCat4, [panda] AilMel1, [Dog] CanFam2, [horse] EquCab2, [pig] SusScr2, [sheep] OviAri1, [cow] BosTau4, [elephant] LoxAfr3, [opossum] MonDom5, [platypus] OrnAna1, [chicken] GalGal3, [zebra finch] TaeGut1, [lizard] AnoCar2, [X. tropicalis] XenTro2, [zebrafish] DanRer7, [tetraodon] TetNig2, [fugu] Fr2, [stickleback] GasAcu1, [medaka] OryLat2, [lamprey] PerMar1, [lancelet] BraFlo1, [sea squirt] Ci2, [sea urchin] StrPur2, [D.simulans] DroSim1, [D.sechellia] DroSec1, [D.yakuba] DroYak2, [D.electa] DroEre1, [D.ananassae] DroAna2, [D.pseudoobscura] Dp3, [D.persimilis] DroPer1, [D. virilis] DroVir2, [D.mojavensis] DroMoj2, [D.grimshawi] DroGri1, [Anopheles mosquito] AnoGam1, [honey bee] ApiMel2,  [C.brenneri] CaePb3, [C.briggsae] Cb3, [C.remanei] CaeRem3, [P.pacificus] PriPac1, [sea hare] AplCal1, [yeast] SacCer2
* **NEW** (v0.2.1): Supporting Ruby 1.8.7 or later
* **NEW** Adding to human Hg19 and Hg18, the following genome assemblies are supported: [mouse] Mm9, [fruitfly] Dm3, [C. elegans] Ce6, [genome assembly independent] Go, HgFixed, Proteome, UniProt, VisiGene
* **UPDATE** (v0.2.0): Internal table class mapping algorithm are changed. Now table types are automatically detected and dynamically defined as classes. Previous versions used static class definition for all tables.
* **MODIFIED** (v0.2.0):  Bio::Ucsc::[Hg18|Hg19]::ReferenceSequence are removed. Use Bio::Ucsc::Reference instead. This class is more object-oriented.
* **MODIFIED** (v0.1.0): The name of this library is now "Ruby UCSC API". The RubyGem name and the GitHub account and the library name are not changed.
* **MODIFIED** (v0.1.0): `Bio::Ucsc::[Hg18|Hg19]::Reference` is replaced by `Bio::Ucsc::[Hg18|Hg19]::ReferenceSequence`.
* **UPDATE** (v0.0.5): Almost all hg18 tables are supported.
* **UPDATE** (v0.0.5): find_by_interval and find_all_by_interval class methods accept the "partial" option. Default is true. When "partial: false" is opted, return value will be only fully-included (non-partially-included) records.  
* **UPDATE** (v0.0.4): Almost all hg19 tables are supported. "filename" tables in ENCODE dataset are omitted. Each of them contains only single record of a path to the raw data file. Definitions of table relations are incomplete. 
* **NEW** (v0.0.3): Supporting locally-stored '2bit' files, which can be downloaded from the UCSC site, to retrieve referential sequence. Now supporting unknown "N" nucleotide blocks, however, "mask-blocks", which are shown in lower-case in UCSC's DNA function, are not supported yet.
* **MODIFIED** (v0.0.3): For the "TABLE" class and the "column" column, `<TABLE>.find_by_column` retrieves a first record, and `<TABLE>.find_all_by_column` retrieves all the records as an Array.
* **NEW** (v0.0.3-0.0.4): Supporting tables divided into each chromosome, such as "*_RmsK" and "*_gold". Actual names of them are like "chr1_Rmsk", "chr2_Rmsk"... They can be accessed without chromosome names; but with just like "Rmsk" and "Gold".

# How to Use
## Basics
* A database of a genome assembly is represented as a module in the `Bio::Ucsc module`. For example, human hg19 database is referred by `Bio::Ucsc::Hg19`.
* Before using a database, establish a connection to the database. For example, `Bio::Ucsc::Hg19::DBConnection.connect`. 
* A table in a database is represented as a class in the database module. For example, the snp132 table in the hg19 database is referred by `Bio::Ucsc::Hg19::Snp132`.
* Queries to a field (column) in a table are represented by class methods of the table class. For example, finding the first record (row) of the snp132 table in the hg19 database is `Bio::Ucsc::Hg19::Snp132.first`. 
* Queries using genomic intervals are supported by the named scope ".with_intervals" and ".with_intervals_excl (omitting pertially included annotations)" method of the table class. These methods accept a genomic interval string like "chr1:1233-5678". If a table to query has the "bin" column, the bin index system is automatically used to speed-up the query.
* Fields in a retrieved record can be acccessed by using instance methods of a record object. For example, the name field of a table record stored in the "result" variable is "result.name".  

## Sample Codes
At first, you have to declare the API and establish the connection to a database. 

```ruby
 require 'bio-ucsc'

 include Bio # shorthand for ommitting the "Bio::" prefix
 Ucsc::Hg19.connect
```

Table search using genomic intervals:

```ruby
 Ucsc::Hg19::Snp131.with_interval("chr1:1-11,000").find(:all).each do |e|
   i = GenomicInterval.zero_based(e.chrom, e.chromStart, e.chromEnd)
   puts "#{i.chrom}\t#{i.chr_start}\t#{e.name}\t#{e[:class]}" # "e.class" does not work
 end

 gi = "chr17:7,579,614-7,579,700"
 puts Ucsc::Hg19::Snp131.with_interval(gi).find(:all)

 puts Ucsc::Hg19::Snp131.with_interval_excl(gi).find(:all)

 relation = Ucsc::Hg19::Snp131.with_interval(gi).select(:name)
 puts relation.to_sql 
  # => SELECT name FROM `snp131`
        WHERE (chrom = 'chr17' AND bin in (642,80,9,1,0)
        AND ((chromStart BETWEEN 7579613 AND 7579700) AND
             (chromEnd   BETWEEN 7579613 AND 7579700)))"
 puts relation.find_all_by_class_and_strand("in-del", "+").size # => 1

 puts Ucsc::Hg19::Snp131.find_by_name("rs56289060")
```

Sometimes, queries using raw SQLs provide elegant solutions.

```ruby
 sql << 'SQL'
 SELECT name,chrom,chromStart,chromEnd,observed
 FROM snp131 
 WHERE name="rs56289060"
 SQL
 puts Ucsc::Hg19::Snp131.find_by_sql(sql)
```

retrieve reference sequence from a locally-stored 2bit file. The "hg19.2bit" file can be downloaded from http://hgdownload.cse.ucsc.edu/goldenPath/hg19/bigZips/hg19.2bit

```ruby
 hg19ref = Ucsc::File::Twobit.load("hg19.2bit")
 puts hg19ref.find_by_interval("chr1:9,500-10,999")

 # another way to access a twobit file
 puts Ucsc::File::Twobit.open("hg19.2bit"){|tb|tb.find_by_interval("chr1:9,500-10,999")}
```

Connetcting to non-official or local full/partial mirror MySQL servers

```ruby
 Ucsc::Hg18.connect { :db_host = 'localhost',
                      :db_username = 'genome',
                      :db_password = '' }

 Ucsc::Hg18.default # reset to connect UCSC's public MySQL sever
 Ucsc::Hg18.connect
```

And see also sample scripts in the samples directory.

* **num-gene-exon.rb** - calculation of total number of genes and exons using genomic interval
* **symbol2summary.rb** - getting summary descriptions using gene symbol
* **hg19-2bit-retrieve.rb** - outputting reference sequence in FASTA format   
* **bed2refseq.rb** - getting unique gene symbols in the genomic intervals in a BED file.
* **snp2gene.rb** - sample for retrieving fields from associated tables

## Notes of Exceptions in Table Support
* Table names starting with a number: Because Ruby class names cannot start with number, use the table class name starting with "T" (T for Table). Thus, the "2micron_est" table is supported by the "T2micron_est" class.
* Table names starting with uppercase character: Classes for "HInv" and "NIAGene" tables are "HInv" and "NIAGene", respectively
* Accessing chromosome-specific tables: For example, the 'rmsk' table in hg18 is actually separated into 'chr1_rmsk', 'chr2_rmsk'... There is two way to access to them. (1) Accessing separated tables directly. There is no difference from other regular tables. However, you have to manage each separated tables. (2) Use abstract table classes (e.g., 'Rmsk') and their class methods ".find_by_interval' or '.find_all_by_interval'. These methods look for correspondent separated tables automatically. However, you cannot combine with other 'find_by_[field]' methods. Moreover, if you have to perform single- or multi-chromosomal search, you have to access separated tables individually and integrate results by yourself. Fortunately, recent databases, including hg19, seem not to use chromosome-specific tables.
* For honey bee ApiMel2 database, Group*_chainDm2 and Group*_chainDm2Link tables are accessible using find(_all)_by_interval class methods of the ChainDm2 and ChainDm2Link classes. 
* Special field (column) names: Field names such as 'attribute', 'valid', 'validate', 'class', 'method', 'methods', and 'type' cannot be accessed using instance methods. This restriction is because of the collision of method names that are internally used by ActiveRecord. Instead, use hash to access the field like "result[:type]".

## Details in "with_interval"
* When a table class is referred first time, the API prefetches the table to get a list of fields and dynamically defines a class using following algorithm.
* If chrom/chromStart/chromEnd fields exist (BED table), the API uses them for interval queries.
* When tName/tStart/tEnd fields exist (PSL table), the API uses them for interval queries.
* When chrom/txStart/txEnd fields exist (genePred table), the API uses them for interval queries.
* When genoName/genoStart/genoEnd fields exist (RMSK table), the API uses them for interval queries.
* If the table has the "bin" column, the API calculate bin index to build a query.
* Otherwise, the API does not support interval queries but support only ActiveRecord's standard methods such as "find_(all_)by_[field name]".

## Table Associations
See samples/snp2gene.rb. Association definitions using `has_one`/`has_many` methods are shown below. `class_eval` is used not to replace but to add definition. 

```ruby
 Bio::Ucsc::Hg19::KnownGene.class_eval do
   has_one :knownToEnsembl, {:primary_key => :name, :foreign_key => :name}
 end
 Bio::Ucsc::Hg19::KnownToEnsembl.class_eval do
   has_one :ensGtp, {:primary_key => :value, :foreign_key => :transcript}
   has_one :kgXref, {:primary_key => :name, :foreign_key => :kgID}
 end
 Bio::Ucsc::Hg19::KgXref.class_eval do
   has_one :refLink, {:primary_key => :mRNA, :foreign_key => :mrnaAcc}
 end
```
And fields can be referred like the followings:
 
```ruby
 kg.knownToEnsembl.ensGtp.gene
 kg.knownToEnsembl.kgXref.geneSymbol
 kg.knownToEnsembl.kgXref.refLink.mrnaAcc
```
`ActiveRecord::Base#find` can be used with the :include option to perform "eager fetching" to reduce number of SQL statement submission.

```ruby
 kg = Bio::Ucsc::Hg19::KnownGene.with_interval(gi).
        find(:first,
             :include => [:knownToEnsembl => :ensGtp,
                          :knownToEnsembl => {:kgXref => :refLink}])
```

# Copyright
**Copyright**: (c) 2011-2012 MISHIMA, Hiroyuki (hmishima at nagasaki-u.ac.jp / Twitter: @mishima_eng (in English) and @mishimahryk (in Japanese)

**Copyright**: (c) 2010 Jan Aerts

**License**: Ruby license (Ruby's / GPLv2 dual). See COPYING and COPYING.ja for further details..
