def first_anagram?(str1, str2)
  time = Time.now
  sub_strs(str1).include?(str2)
  p (Time.now - time) * 1000
end


def sub_strs(str)
  return [str] if str.length <= 1
  first = str[0]
  str = str[1..-1]
  subs = sub_strs(str)
  total_subs = []
  subs.each do |sub|
    (0..sub.length).each do |i|
      total_subs << sub[0...i] + first + sub[i..-1]
    end
  end
  total_subs
end


def anagram2?(str1, str2)
  time = Time.now
  str1_dup = str1.dup
  str1_dup.chars.each do | char |
    idx1 = str1.index(char)
    idx2 = str2.index(char)
    return false if idx2.nil?
    str1 = str1[0...idx1] + str1[idx1+1..-1]
    str2 = str2[0...idx2] + str2[idx2+1..-1]
  end
  p (Time.now - time) * 1000
  return true if str1.length == 0 && str2.length == 0
  false
end

def anagram3?(str1, str2)
  time = Time.now
  b = str1.chars.sort == str2.chars.sort
  p (Time.now - time) * 1000
  b
end
