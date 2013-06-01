# -*- coding: utf-8 -*-
#!/usr/bin/env ruby

require "fileutils"
include FileUtils

COPY_FROM = File.expand_path('~/test')
COPY_TO = File.expand_path('~/Dropbox/watch-men')

cd COPY_FROM

loop do
  Dir.glob("*.pdf").each do |file|
    if File.exist?(File.join(COPY_TO, file))
      # puts "'#{file} 'is exist."
    else
      cp(file, File.join(COPY_TO, file))
      puts "Copy PDF -> '#{file}' [#{Time.now}]"
    end
  end
  sleep 10
end
