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
