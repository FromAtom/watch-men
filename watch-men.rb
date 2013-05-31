#!/usr/bin/env ruby

require "fileutils"
include FileUtils

COPY_FROM = File.expand_path('~/test')
COPY_TO = File.expand_path('~/Dropbox/watch-men')
TARGET_SIZE = 1
SLEEP_SECOND = 10

def putlog(msg)
  puts "#{Time.now}: #{msg}"
end

cd COPY_FROM
before_time = nil

loop do
  files = Dir.glob("*")
  target_files = files.select {|f| File.size(f) > TARGET_SIZE }
  latest_file = target_files.max_by {|f| File.mtime(f) }
  if latest_file
    modify_time = File.mtime(latest_file)
    if before_time != modify_time
      fname = "#{latest_file}"
      cp_r(latest_file, File.join(COPY_TO, fname))
      putlog "Copy file to #{fname}"
      before_time = modify_time
    else
      putlog "Not found of new file."
    end
  else
    putlog "Not found of target file."
  end
  sleep SLEEP_SECOND
end
