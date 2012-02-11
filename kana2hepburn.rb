#!/usr/bin/env ruby19
# coding: utf-8

module Kana2hepburn

  def k2h_hatsuon(str)          # 促音(っ)の変換
    return str unless str.include?('っ')
    
    while /っ(.)/.match(str)
      ch = Regexp.last_match(1)
      if ch == 'C'
        str.sub!(/っ#{ch}/, "T#{ch}")
      else
        str.sub!(/っ#{ch}/, "#{ch}#{ch}")
      end
    end
    str
  end

  def k2h_correct_n(str)        # 'ん' を m で表記する修正
    str.gsub!('NB', 'MB')
    str.gsub!('NM', 'MM')
    str.gsub!('NP', 'MP')
    str
  end

  def k2h_correct_long(str)     # 長音('お' や 'う')の修正
    str.gsub!(/O[OU]/, "O")
    str.gsub!("UU", "U")
    str
  end

  @k2hmap1 = {                  # かな to ヘボン 対応表1 (かな1文字用)
    'あ' =>	'A',  'い' => 'I',  'う' => 'U',  'え' => 'E',  'お' => 'O',
    'か' => 'KA', 'き' => 'KI', 'く' => 'KU', 'け' => 'KE', 'こ' => 'KO',
    'さ' => 'SA', 'し' => 'SHI','す' => 'SU', 'せ' => 'SE', 'そ' => 'SO',
    'た' => 'TA', 'ち' => 'CHI','つ' => 'TSU','て' => 'TE', 'と' => 'TO',
    'な' => 'NA', 'に' => 'NI', 'ぬ' => 'NU', 'ね' => 'NE', 'の' => 'NO',
    'は' => 'HA', 'ひ' => 'HI', 'ふ' => 'FU', 'へ' => 'HE', 'ほ' => 'HO',
    'ま' => 'MA', 'み' => 'MI', 'む' => 'MU', 'め' => 'ME', 'も' => 'MO',
    'や' => 'YA', 'ゆ' => 'YU', 'よ' => 'YO',
    'ら' => 'RA', 'り' => 'RI', 'る' => 'RU', 'れ' => 'RE', 'ろ' => 'RO',
    'わ' => 'WA', 'ゐ' => 'I', 	'ゑ' => 'E',  'を' => 'O',  'ん' => 'N',
    'が' => 'GA', 'ぎ' => 'GI', 'ぐ' => 'GU', 'げ' => 'GE', 'ご' => 'GO',
    'ざ' => 'ZA', 'じ' => 'JI', 'ず' => 'ZU', 'ぜ' => 'ZE', 'ぞ' => 'ZO',
    'だ' => 'DA', 'ぢ' => 'JI', 'づ' => 'ZU', 'で' => 'DE', 'ど' => 'DO',
    'ば' => 'BA', 'び' => 'BI', 'ぶ' => 'BU', 'べ' => 'BE', 'ぼ' => 'BO',
    'ぱ' => 'PA', 'ぴ' => 'PI', 'ぷ' => 'PU', 'ぺ' => 'PE', 'ぽ' => 'PO',
  }
  @k2hmap2 = {                  # かな to ヘボン対応表2 (かな2文字用)
    'きゃ' => 'KYA', 'きゅ' => 'KYU', 'きょ' => 'KYO',
    'しゃ' => 'SHA', 'しゅ' => 'SHU', 'しょ' => 'SHO',
    'ちゃ' => 'CHA', 'ちゅ' => 'CHU', 'ちょ' => 'CHO',
    'にゃ' => 'NYA', 'にゅ' => 'NYU', 'にょ' => 'NYO',
    'ひゃ' => 'HYA', 'ひゅ' => 'HYU', 'ひょ' => 'HYO',
    'みゃ' => 'MYA', 'みゅ' => 'MYU', 'みょ' => 'MYO',
    'りゃ' => 'RYA', 'りゅ' => 'RYU', 'りょ' => 'RYO',
    'ぎゃ' => 'GYA', 'ぎゅ' => 'GYU', 'ぎょ' => 'GYO',
    'じゃ' => 'JA',  'じゅ' => 'JU',  'じょ' => 'JO',
    'びゃ' => 'BYA', 'びゅ' => 'BYU', 'びょ' => 'BYO',
    'ぴゃ' => 'PYA', 'ぴゅ' => 'PYU', 'ぴょ' => 'PYO',
  }

  def k2h_general(str)
    @k2hmap2.each{|k,v|
      str.gsub!(/#{k}/, v)
    }
    @k2hmap1.each{|k,v|
      str.gsub!(/#{k}/, v)
    }
    str
  end

  module_function :k2h_general
  module_function :k2h_hatsuon
  module_function :k2h_correct_n
  module_function :k2h_correct_long
end


class String
  def kana2hepburn
    str = Kana2hepburn.k2h_general(self)
    str = Kana2hepburn.k2h_hatsuon(str)
    str = Kana2hepburn.k2h_correct_n(str)
    str = Kana2hepburn.k2h_correct_long(str)
    str
  end
end
