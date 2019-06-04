require 'benchmark'
require 'faker'
# anagram?("gizmo", "sally")    #=> false
# anagram?("elvis", "lives")    #=> true

# time: O(!n)
# space: O(!n)
def first_anagram?(str1, str2)
    all_combo = str1.split('').permutation.to_a
    all_combo.include?(str2.split(""))
end

# p first_anagram?("gizmo", "sally")
# p first_anagram?("elvis", "lives")

# time: O(n^2)
# space: O(1)
def second_anagram?(str1, str2)
    str1.each_char do |char|
        i2 = str2.index(char)
        str2.split('').delete_at(i2) unless i2.nil?
    end
    str2.empty? ? true : false
end

# time: O(n*log(n))
# space: O(log(n))  ??
def third_anagram?(str1, str2)
    str1.split("").sort == str2.split("").sort
end

# third_anagram?("james","sjame")
# time: O(n)
# space: O(1) -- 26 letters in the alphabet, YO!
def fourth_anagram?(str1, str2)
    h_1 = Hash.new(0)
    # h_2 = Hash.new(0)

    str1.split('').each {|char| h_1[char] += 1 }
    str2.split('').each {|char|h_1[char] -= 1} 

    h_1.values.all? {|ele| ele == 0}
end

str = (1..1000000).to_a.shuffle.join

#link github to Mashu at the end of the day

# puts "O(!n): #{Benchmark.measure { first_anagram?("gizmowqqwg", "sally") }}"
# puts "O(!n): #{Benchmark.measure { first_anagram?("elvisewedf", "lives") }}"
# puts "O(n^3): #{Benchmark.measure { second_anagram?(str, str) }}"
# puts "O(n^3): #{Benchmark.measure { second_anagram?(str, str) }}"
puts "O(n*log(n)): #{Benchmark.measure { third_anagram?(str, str) }}"
# puts "O(n*log(n)): #{Benchmark.measure { third_anagram?(str, str) }}"
# puts "O(n): #{Benchmark.measure { fourth_anagram?(str, str) }}"
puts "O(n): #{Benchmark.measure { fourth_anagram?(str, str) }}"

