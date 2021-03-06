# Original code from https://github.com/chasemgray/Ruby-ADT/blob/master/lib/adt/globals.rb
module RADT
  class RADTError < StandardError; end



  MS_PER_SECOND = 1000
  MS_PER_MINUTE = MS_PER_SECOND * 60
  MS_PER_HOUR = MS_PER_MINUTE * 60

  HEADER_LENGTH = 400

  COLUMN_LENGTH = 200
end
