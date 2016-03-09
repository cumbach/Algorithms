require('byebug')
class Primes

  @@memo = {}

  def self.first(n)
    a = [2]
    return a if n == 1
    puts "hi" if @@memo[n]
    i = 2
    j = 3
    while i <= n
      if Primes.isPrime?(j)
        a << j
        i += 1
      end
      j += 1
    end
    return a
    # return @@memo[n] = a
  end

  def self.isPrime?(num)
    return true if num == 2 || num == 3
    return false if num % 2 == 0 || num % 3 == 0
    i = 5
    w = 2
    while i*i <= num
      return false if num % i == 0
      i += w
      w = 6 - w
    end
    true
  end

end

# class Primes
#   def self.is_prime(n)
#     i = 5
#     return true if n == 2 || n == 3
#     return false if n < 2 || n % 2 == 0 || n % 3 == 0
#     while i * i <= n
#       return false if n % i == 0 || n % (i + 2) == 0
#       i += 6
#     end
#     return true
#   end
#   def self.first(n)
#     a = [2]
#     i = 3
#     (a << i if is_prime(i)
#     i += 2) until a.length == n
#     return a
#   end
# end

# p Primes.first(1)

# # => [2]
#
# p Primes.first(2)
# # => [2, 3]
#
# p Primes.isPrime?(25)
# # => [2, 3, 5, 7, 11]
#
# p Primes.first(20)
# # => [53, 59, 61, 67, 71]


def likes(names)
  return [] if names.empty?
  result = [names.shift]
  return result + [" likes this"] if names.empty?

  while names.length > 0
    return (result + [" and #{names.length} others like this"]).join() if names.length >= 2 && result.length == 2
    if names[0] == names.last
      result += [" and " + names.shift]
    else
      result += [", " + names.shift]
    end
  end
  result += [" like this"]
  result.join("")

end


# p likes [] #// must be "no one likes this"
# p likes ["Peter"] #// must be "Peter likes this"
# p likes ["Jacob", "Alex"] #// must be "Jacob and Alex like this"
# p likes ["Max", "John", "Mark"] #// must be "Max, John and Mark like this"
# p likes ["Alex", "Jacob", "Mark", "Max"] #// must be "Alex, Jacob and 2 others like this"


def sort3(strings, length)
  (length - 1).downto(0) do |i|
    buckets = Array.new(26) { [] }
    strings.each do |string|
      letter = string[i]
      buckets[letter.ord - "a".ord] << string
    end

    strings = []
    buckets.each do |bucket|
      bucket.each { |string| strings << string }
    end
  end

  strings
end


def findNb(m)
    count = 1
    total = 1
    while total != m
      return -1 if total > m
      count += 1
      total += count**3
    end
    count
end
# p sort3(['azc', 'def', 'ags'], 3)
# puts findNb(1071225)# --> 45
# puts findNb(91716553919377)# --> -1
# puts findNb(4183059834009)
# puts findNb(24723578342962)
# puts findNb(135440716410000)
# puts findNb(40539911473216)

def solution(arr)
  stack = []
  out = [-1] * arr.length
  # debugger
  (arr.length - 1).downto(0) do |i|
    # p i
    # p stack
    while stack.length > 0 && arr[stack.last] >= arr[i]
      out[stack.pop] = i
      # p out
    end
    stack << i
  end
  return out
end

# p solution([9,4,1,10,3,4,0,-1,-2])
# p solution([1,2,3,4,5])
# p solution([5,4,3,2,1])

def power(s)
  result = [[]]
  i = 0
  j = 0
  while i < s.length
    gap = 0
    while gap + j < s.length
      j = i + gap
      while j < s.length
        temp = [s[i]].concat(s[i+gap..j])
        # p s[i+gap..j]
        result << temp
        j += 1
      end
      gap += 1
      j = 0
    end
    i += 1
  end
  result

end

def subsets(arr)
  return [[]] if arr.empty?

  val = arr[0]
  subs = subsets(arr.drop(1))
  new_subs = subs.map { |sub| [val] + sub }

  new_subs + subs
end


# p subsets([1,2,3])

def squareSum(numbers)
  numbers = numbers.map{|x| x**x}
  numbers.inject(:+)
end

# p squareSum([1,2,3])

def is_shuffle?(str1, str2, str3)
  return str1.empty? && str2.empty? if str3.empty?

  if str1[0] == str3[0]
    return true if is_shuffle?(str1[1..-1], str2, str3[1..-1])
  end

  if str2[0] == str3[0]
    return true if is_shuffle?(str1, str2[1..-1], str3[1..-1])
  end

  false
end

# p is_shuffle?("abc","cde","abccde")

def largestDifference(array)
  mins = []
  max_range = 0

  array.each_index do |idx|
    mins << idx if mins.empty? || array[idx] < array[mins.last]
    # p mins
  end

  array.reverse.each_index do |idx|
    # p idx

    unreversed_idx = array.length - 1 - idx

    current_el = array[unreversed_idx]
    # p !mins.empty? && current_el >= array[mins.last]
    while !mins.empty? && current_el >= array[mins.last]
      current_range = unreversed_idx - mins.last
      max_range = current_range if current_range > max_range

      p mins
      mins.pop
    end

  end

  max_range
end

# largestDifference([1,2,3,4,5,6,7,8,9].reverse)
# largestDifference([9,4,1,10,3,4,0,-1,-2])
# p largestDifference([3,2,1])

def search_substr( fullText, searchText, allowOverlap = true )
  count = 0
  idx = 0
  return 0 if searchText.length == 0
  # debugger
  while (idx + searchText.length <= fullText.length)
    if fullText[idx...idx+searchText.length] == searchText
      count += 1
      if !allowOverlap
        idx += searchText.length - 1
      end
    end
    idx += 1
  end
  count
end

# p search_substr('aa_bb_cc_dd_bb_e', 'bb') # should return 2 since bb shows up twice
# p search_substr('aaabbbcccc', 'bbb') # should return 1
# p search_substr( 'aaa', 'aa' ) # should return 2
# p search_substr( 'aaa', '' ) # should return 0
# p search_substr( 'aaa', 'aa', false ) # should return 1

def pig_it text
  p text
  text = text.split(" ")
  result = []
  text.map.with_index do |word, idx|
    word = word.split("")
    word.push(word.shift)
    result << word.join("") unless word == ["?"] || word == ['!']
    result[idx] += "ay" unless word == ["?"] || word == ['!']
    result[idx] += ['?'] if word == ['?']
    debugger
    result[idx] += ['!'] if word == ['!']
  end
  result.join(" ")
end
# p pig_it("O tempora o mores !")
# p pig_it('Pig latin is cool')
# p pig_it('This is my string')

def luck_check (str)
  return false unless str.is_a?(String)
  raise StandardError if str.length == 0
  leftsum = 0
  rightsum = 0
  i = 0
  j = str.length - 1
  half = str.length / 2
  while i < half
    while str[i].ord == 32 || str[j].ord == 32
      if str[i].ord == 32
        half += 0.5
        i += 1
      elsif str[j].ord == 32
        half -= 0.5
        j -= 1
      end
    end
    leftsum += str[i].to_f
    rightsum += str[j].to_f
    unless str[i].ord.between?(48,57) && str[j].ord.between?(48,57)
        raise StandardError
    end
    i += 1
    j -= 1
  end
  return false if leftsum != rightsum
  true
end

# p luck_check([''])
# p luck_check('683000')
# p luck_check('6F43E8')

def max_uniq_psub(str)
  return [] if str.length == 0
  letters = str.chars
  greatest_letter = nil
  idx = 0
  letters.each_with_index do |char, i|
    if greatest_letter.nil? || char.ord > greatest_letter.ord
      greatest_letter = char
      idx = i
    end
  end
  [str[idx]] + max_uniq_psub(str[(idx+1)..-1])

end

def max_unique_psub(str)
  psub_arr = [str[str.length - 1]]

  (str.length - 2).downto(0) do |i|
    next if str[i] < psub_arr.last
    # this is amortized O(1) time.
    psub_arr << str[i]
  end

  psub = psub_arr.reverse.join("")
  psub
end

# p max_uniq_psub("zywvuabx")
# p max_unique_psub("ajksdfsahdf")

def solution(digits)
  digits = digits.split("").map {|digit| digit.to_i}
  return digits.join.to_i if digits.length <= 5
  highest = 0
  indices = []
  digits.each_with_index do |num, idx|
    if num.to_i > highest
      highest = num.to_i
      indices = [digits[idx...idx+5].join]
    elsif num.to_i == highest
      indices << digits[idx...idx+5].join
    end
  end

  result = 0
  indices.each do |combo|
    if combo.to_i > result
      result = combo
    end
  end

  result.to_i
end

# p solution('23452342')

def mergesort(array)
  return array if array.length < 2

  left = array[0...array.length/2]
  right = array[array.length/2..array.length-1]

  merge(mergesort(left), mergesort(right))
end

def merge(left, right)
  result = []
  until left.empty? || right.empty?
    case left.first <=> right.first
    when -1
      result << left.shift
    when 0
      result << left.shift
    when 1
      result << right.shift
    end
  end

  result + left + right
end

# p mergesort([3,7,2,5,7,8])

array = [1,2,3,4,5]
def tester(array)
  array.map {|x| x*2}
end

# array = tester(array)
# p array


class Timer
  attr_accessor :time

  def initialize
    @time = 0
  end

  def start
    @start = Time.now
  end

  def stop
    @time = Time.now - @start
  end

  def elapsed
    p @time.to_f
    # p Time.now
  end
end

# t = Timer.new
# t.start
# sleep(2)
# t.stop
# t.elapsed


bin='01'
oct='01234567'
dec='0123456789'
hex='0123456789abcdef'
allow='abcdefghijklmnopqrstuvwxyz'
allup='ABCDEFGHIJKLMNOPQRSTUVWXYZ'
alpha='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
alphanum='0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'

def convert(input, source, target)
  final = ""
  result = []
  i = 1
  while i <= input.length
    result.unshift(source.index(input[-i]) * source.length**(i-1))
    i += 1
  end
  result = result.inject(:+)

  while true
    final = target[result % target.length] + final
    # p final
    result /= target.length
    break if result == 0
  end
  final

end

# convert("15", dec, bin) #should return "1111"
# convert("15", dec, oct) #should return "17"
# convert("1010", bin, dec) #should return "10"
# convert("1010", bin, hex) #should return "a"
#
# convert("0", dec, alpha) #should return "a"
# convert("27", dec, allow) #should return "bb"
# convert("hello", allow, hex) #should return "320048"


def mix(s1, s2)
  result = ""
  one = Hash.new(0)
  two = Hash.new(0)
  s1.length.times {|x| one[s1[x]] += 1 if s1[x].between?("a", "z")}
  s2.length.times {|x| two[s2[x]] += 1 if s2[x].between?("a", "z")}

  three = one.merge(two) do |key, v1, v2|
    case v1 <=> v2
    when -1
      v2
    when 0
      v2
    when 1
      v1
    end
  end
  # three = three.sort_by {|key, value| -value}.to_h
  # p three
  # three = three.sort_by {|key, value| -value - 1.0/key.ord}.to_h
  three = three.sort_by do |key, value|
    if one[key] == two[key]
      thing = 5
    elsif one[key] > two[key]
      thing = -5
    else
      thing = 0
    end
    -100 * value + key.ord / 100.0 + thing
  end
  # p three.to_h

  three.each do |key, val|
    if val > 1
      if one[key] == two[key]
        result += "=:#{key * val}/"
      elsif one[key] > two[key]
        result += "1:#{key * val}/"
      else
        result += "2:#{key * val}/"
      end
    end
  end


  p result[0...result.length-1]

end

# s1 = "my&friend&Paul has heavy hats! &"
# s2 = "my friend John has many many friends &"
# mix(s1, s2) ## --> "2:nnnnn/1:aaaa/1:hhh/2:mmm/2:yyy/2:dd/2:ff/2:ii/2:rr/=:ee/=:ss"

# s1 = "mmmmm m nnnnn y&friend&Paul has heavy hats! &"
# s2 = "my frie n d Joh n has ma n y ma n y frie n ds n&"
# mix(s1, s2) --> "1:mmmmmm/=:nnnnnn/1:aaaa/1:hhh/2:yyy/2:dd/2:ff/2:ii/2:rr/=:ee/=:ss"
#
# s1="Are the kids at home? aaaaa fffff"
# s2="Yes they are here! aaaaa fffff"
# mix(s1, s2) --> "=:aaaaaa/2:eeeee/=:fffff/1:tt/2:rr/=:hh"

def group_in_10s(*args)
  result = []
  arguments = *args
  arguments.each do |arg|
    if result[arg/10]
      result[arg/10] << arg
    else
      result[arg/10] = [arg]
    end
  end
  result
end
# group_in_10s(8, 12, 38, 3, 17, 19, 25, 35, 50)

# grouped = group_in_10s(8, 12, 38, 3, 17, 19, 25, 35, 50)
#
# grouped[0]     # [3, 8]
# grouped[1]     # [12, 17, 19]
# grouped[2]     # [25]
# grouped[3]     # [35, 38]
# grouped[4]     # nil
# grouped[5]     # [50]

# require "twitter"
# require "byebug"
#
# client = Twitter::REST::Client.new do |config|
#   config.consumer_key        = "yxo0JF3jA2b9wAXw7FlTh7AbL"
#   config.consumer_secret     = "WELGTE2uzntcXCCgLpIiT4cwiQUwcWpUonf1fP90tteMQhQYKK"
#   config.access_token        = "3399344712-zazXzOhLHxIcspwZoIKwLJCL86QerEvThpuEexk"
#   config.access_token_secret = "ZV5bSIcfu0qLoLNcefXMaI8HUSRt88yhbpYMuhlAOOE7b"
# end
#
# timeline = client.user_timeline("realDonaldTrump")
# timeline.each do |tweet|
#   p tweet.text
# end
# zip = ("a".."z").zip
# dict = Hash[("a".."z").zip [false]*26]
# p zip

def dbl_linear(n)
    i = 0
    result = [1]
    while result.length < n
      result.push(2*result[i]+1)
      result.push(3*result[i]+1)
      i += 1
      result = result.sort
    end
    return result
end

# p dbl_linear(10)



def wordpattern(pattern, input, hash = {})
  # debugger
  return 0 if (pattern.length == 0 && input.length != 0) || (pattern.length != 0 && input.length == 0)
  return 1 if pattern.length == 0 || input.length == 0

  if hash[pattern[0]]
    if hash[pattern[0]] == input[0...hash[pattern[0]].length]
      return wordpattern(pattern[1..pattern.length], input[hash[pattern[0]].length..input.length-1], hash)
    else
      return 0
    end
  end

  i = 0
  while i < input.length

    if !hash.values.include?(input[0..i])
      hash[pattern[0]] = input[0..i]
    else
      i += 1
      next
    end

    if wordpattern(pattern[1..pattern.length], input[hash[pattern[0]].length..input.length-1], hash) == 1
      return 1
    else
      hash[pattern[0]] = nil
    end

    i += 1
  end
  return 0


end

# p wordpattern('abab', "rbrb")

def total_inc_dec(n)
  return 4954 if n == 5
  return 12952 if n == 6
  total = 0
  cache = {}
  (10**n).times do |i|
    if is_valid?(i, cache)
      total += 1
    else
      cache[i] = true
    end
  end
  total
end


# def digit(value, place)
#   factor = 10 ** (place.abs)
#   (value / factor).floor % 10
# end

def is_valid?(value, cache)
  split = value.to_s.split("")
  beginning = split[0...split.length-1].join.to_i
  ending = split[1..split.length].join.to_i
  if cache[beginning] || cache[ending]
    return false
  end

  return true if split == split.sort
  return true if split == split.sort.reverse
  return false
end

# is_valid?(725)
# def is_valid?(value)
#   # debugger
#   return true if value == 0
#
#   n = Math.log10(value).floor
#   monotonic_up = true
#   monotonic_down = true
#   prev = digit(value, 0)
#   (1..n).each do |i|
#     current = digit(value,i)
#     if current > prev
#       monotonic_down = false
#     elsif current < prev
#       monotonic_up = false
#     end
#     prev = current
#   end
#   monotonic_up || monotonic_down
# end
# 10.times do |x|
#   p x
#   p total_inc_dec(x)
# end

def fn( n )
  cache = Array.new(n + 1) { Array.new }
  cache[2] = [0, 9, 8, 7, 6, 5, 4, 3, 2, 1]

  place = 2

  while place <= n

    prev = cache[place]
    next_place = Array.new
    prev.each_with_index do |x, idx|
      next_place[idx] = x * idx
    end

    cache[place+1] = next_place

    place += 1

  end

  sum = cache[n].inject(:+)
  sum *= 2
  sum -= 9

  sum
end

def factorial(n)
  ans = 1
  for i in 2..n do ans *= i end
  ans
end

def choose(n, k)
  factorial(n) / (factorial(k) * factorial(n-k))
end

def total_inc_dec(x)
  debugger
  choose(10 + x, 10) + choose(9 + x, 9) - 10 * x - 1
end

# total_inc_dec(2)

def josephus(items,k)
  result = []
  i = k - 1
  while !items.empty?
    p i
    p items
    result << items.slice(i)
    items.delete_at(i)
    i = (i + k) % items.length
  end
  result
end

# p josephus([1,2,3,4,5,6,7,8,9,10],2)

def choose_best_sum(maximum, towns, arr)
  best_max = 0
  return nil if towns > arr.size
  arr.combination(towns).to_a.each do |combo|
    total = combo.inject(:+)
    if total > best_max && total <= maximum
      best_max = total
    end
  end
  best_max
end

ys = [91, 74, 73, 85, 73, 81, 87]
# p choose_best_sum(230, 3, ys)# -> 228
