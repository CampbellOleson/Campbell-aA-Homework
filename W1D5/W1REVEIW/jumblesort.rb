def jumble_sort(input_str, alpha = nil)

    alpha ||= ("a".."z").to_a
    str = input_str.dup

    jumbled_str = str.split("").sort do |el1,el2|
        alpha.index(el1) <=> alpha.index(el2)
    end
    jumbled_str.join("")

end




# bubble sort strat
# def jumble_sort(input_str,alpha = nil)
#     alpha ||= ("a".."z").to_a
#     str = input_str.dup
#     sorted = false 
#     until sorted
#         sorted = true
#         (0...str.size-1).each do |i|
#             if alpha.index(str[i]) > alpha.index(str[i+1])
#                 str[i],str[i+1] = str[i+1],str[i]
#                 sorted = false
#             end
#         end
#     end
#     str
# end


# def jumble_sort(input_string,alpha = nil)
#     alpha ||= ("a".."z").to_a
#     jumbled_str = ""
#     str = input_string.dup

#     sorted = false
#     while !sorted
#         sorted = true
#         alpha.each do |char|
#             if str.include?(char)
#                 jumbled_str += char
#                 str[str.index(char)] = ""
#                 sorted = false
#                 break
#             end
#         end
#     end
#     jumbled_str
# end

p jumble_sort("campbell") #"abcellmp"
p jumble_sort("hello") #"ehllo"
p jumble_sort("hello",['o', 'l', 'h', 'e']) #=> 'ollhe'

# class String
#     def jumble_sort(alpha = nil)
#         alpha ||= ("a".."z").to_a
#         jumbled = []
#         clone = self.dup.split("")
#         until clone.empty?
#             alpha.each_with_index do |char,i|
#                     if clone.include?(char)
#                         index_in_clone = clone.index(char) 
#                         clone[index_in_clone]
#                         jumbled << clone[index_in_clone]
#                         clone = clone.take(index_in_clone) + clone.drop(index_in_clone + 1)
#                     break
#                 end
#             end
#         end
#         jumbled.join("")
#     end
# end

# p "campbell".jumble_sort
# p "hello".jumble_sort
# p "hello".jumble_sort(['o', 'l', 'h', 'e']) #=> 'ollhe'

# non mp 
# def jumble_sort(str, alpha = nil)
#     alpha ||= ("a".."z").to_a
#     jumbled = []
#     clone = str.dup.split("")
#     until clone.empty?
#         alpha.each_with_index do |char,i|
#                 if clone.include?(char)
#                     index_in_clone = clone.index(char) 
#                     clone[index_in_clone]
#                     jumbled << clone[index_in_clone]
#                     clone = clone.take(index_in_clone) + clone.drop(index_in_clone + 1)
#                 break
#             end
#         end
#     end
#     jumbled.join("")
# end


# p jumble_sort("campbell")
# p jumble_sort("hello")
# p jumble_sort("hello",['o', 'l', 'h', 'e']) #=> 'ollhe'
