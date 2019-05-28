# CAMPBELL Q1
# new merge sort accepting proc
# monkey patch
# no modify -- new array 

Class Array

    def merge_sort(&prc)
    
        prc ||= Proc.new {|a,b|a <=> b}

        arr = self.dup
        return arr if arr.size == 1 || arr.size == 0 
        mid_i = arr.size / 2
        left = arr.take(mid_i)
        right = arr.drop(mid_i)
        sorted_left = left.merge_sort(&prc)
        sorted_right = right.merge_sort(&prc)
        Array.merge(left,right,&prc)
    end

    def merge(left,right,&prc)
    sorted = []
        until left.empty? || right.empty?
            
            case prc.call(left[0],right[0])
            when 1
                sorted << right.take(1)
            when -1 
                sorted << left.take(1)
            when 0 
                sorted << left.take(1)
            end
        end
        sorted + left + right
    end

end

#Mac 01

def bsearch(array, target)
    return nil if array.empty?

    mid = array.length / 2
    case target <=> array[mid]
          
    when 0
        return mid
    when -1
        bsearch(array.take(mid), target)
    when 1
        search_res = bsearch(array.drop(mid+1), target)
        search_res.nil? ? nil : search_res + 1 + mid
    end
return search_res
end

# CAMPBELL Q2
# monkey patch my flatten
# takes level to flatten to

arr = [["a"], "b", ["c", "d", ["e"]]]

class Array

    def my_flatten(level)
    dup_arr = self.dup
    return [dup_arr] if !dup_arr.is_a?(Array) || level == 0
    arr = []
        dup_arr.each do |el|
            if el.is_a?(Array)
            arr += el.my_flatten(level - 1)
            else
                arr += [el]
            end
        end
    arr
    end

end

#GO BACK TO EXAMPLE

#MAC

class Array
    def my_each(&prc)
        i = 0
        while i < self.length
             prc.call(self[i])
            i += 1
        end
        self
    end
end


#CAMPBELL Q3

class Array
    def my_reduce(acc = nil, &prc)
    acc ||= self.shift
    i = 0
        while i < self.size
            acc += prc.call(acc,self[i])
            i += 1
        end
        acc
    end
end


#MAC Q3

arr = [1,0,1,3,5,0]

class Array
    def dups
        h1 = Hash.new {|h,k| h[k] = [] }
        self.each_with_index do |el, idx|
            h1[el] << idx if self.count(el) > 1
        end
        h1
    end
end

# CAMPBELL Q3   


class String

    def shuffled_sentence_detector(str)
    words_1 = self.split(" ")
    words_2 = str.split(" ")
        return words_1.all? {|word|words_2.include?(word)} && 
        words_2.all? {|word|words_1.include?(word)} && 
        words_1.size == words_2.size
    end 

    def shuffled_sentence_detector(str)
    self.split(" ").sort == str.split(" ").sort
    end

end
p "cats are cool".shuffled_sentence_detector("dogs are cool") => false

#MAC Q4
#[1,1,2],6  num = 3
#prev_fac = facs_rec(2)

def facs_rec(num)
    return [1] if num == 0

    prev_facs = facs_rec(num - 1)
    prev_facs << (prev_fac[-1] * num )

end

p facs_rec(6)

<!-- def factorials_rec(num)
  if num == 1
    [1]
  else
    facs = factorials_rec(num - 1)
    facs << facs.last * (num - 1)
    facs
  end
end

p factorials_rec(6) -->

# CAMPBELL Q5

[1,1,2,3,5]

def n_fib(n)
return [1,1].take(n) if n <= 2
    prev_fib = n_fib(n-1)
    new_fib = prev_fib[-1] + prev_fib[-2]
    prev_fib << new_fib
end

# MAC Q5
<!-- num = 12 -->

def digital_root(num)
    return num if num < 10
    last_dig = num % 10
    new_num = num / 10
    digital_root(digital_root(new_num) + last_dig)
end

p digital_root(12345)

def digital_root(num) => 123
  while num > 10
    num = digital_root_step(123)
  end

  num => 6
end

def digital_root_step(123)
  root = 0
  while num > 0
    root += (num % 10) => 3 2 1

    num /= 10 => 12 1
  end

  root
end


# CAMPBELL Q6

def is_prime?(n)
return false if n < 2
(2...n).none? {|factor|num % factor == 0}
end

def largest_prime_factor(n)
    n.downto(2).each do |factor|
        if n % factor == 0 && is_prime?(factor)
            return n
        end
    end
    nil
end

# MAC Q6

def jumble_sort(str, alph = nil)  
    alph ||= ("a".."z").to_a
    jumbled = []
    arr = str.split("")
    until arr.empty?
        alph.each_with_index do |letter, idx| 
                if arr.include?(letter)
                    index_in_word = arr.index(letter)
                    jumbled << arr[index_in_word]
                    arr = arr[0...index_in_word] + arr[index_in_word+1..-1] 
                    break
                end
        end
    end
        jumbled.join("")
end

 
p jumble_sort("hello") 
p jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

def jumble_sort(str, alphabet = nil)
  alphabet ||= ('a'..'z').to_a

  sorted = false
  until sorted
    sorted = true

    str.length.times do |i|
      break if i == (str.length - 1)
      if alphabet.index(str[i]) > alphabet.index(str[i + 1])
        str[i], str[i + 1] = str[i + 1], str[i]
        sorted = false
      end
    end
  end

  str
end


##ASK ABOUT THIS##
def jumble_sort(str, alphabet = nil)
   alphabet ||= ('a'..'z').to_a

   sorted_chars = str.chars.sort do |chr1, chr2|
     alphabet.index(chr1) <=> alphabet.index(chr2)
    end

   sorted_chars.join
 end