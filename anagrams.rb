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
