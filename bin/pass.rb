#!/usr/bin/env ruby
# coding: utf-8

num_times = ARGV[0].to_i if ARGV[0] ||=1
num       = 12
list      = [*'a'..'z',*'A'..'Z',*1..9]

num_times.times{
  begin
    pass = ''
    num.times{
      rand_num = rand(list.size)
      pass += "#{list[rand_num]}"
    }
  end
  puts "pass:\t#{pass}"
}
