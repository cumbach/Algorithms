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
largestDifference([9,4,1,10,3,4,0,-1,-2])
# p largestDifference([3,2,1])
