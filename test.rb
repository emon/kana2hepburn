#!/usr/bin/env ruby19
# coding: utf-8

require './kana2hepburn'

puts '通常の変換'
puts 'あいうえお かきくけこ'.kana2hepburn
puts 'きゃきゅきょ'.kana2hepburn

puts '撥音(ん)の通常処理と例外'
puts 'あんこ'.kana2hepburn
puts 'どらえもん'.kana2hepburn
puts 'かんぽ'.kana2hepburn
puts 'ほんま'.kana2hepburn

puts '拗音(っ)の通常処理と例外処理'
puts 'へっぽこ'.kana2hepburn
puts 'べっぷ'.kana2hepburn
puts 'いっしき'.kana2hepburn
puts 'えっちゅう'.kana2hepburn
puts 'はっちょう'.kana2hepburn

puts '長音("お"や"う")の処理'
puts 'うさぎ'.kana2hepburn
puts 'たろう'.kana2hepburn
puts 'おおさま'.kana2hepburn
puts 'きょうと'.kana2hepburn
puts 'きょおと'.kana2hepburn
puts 'とおる'.kana2hepburn
puts 'さいとう'.kana2hepburn

