# class Array

#     def bsearch(target)
#     return nil if arr.size == 0
#     probe_i = self.size / 2
#         case self[probe_i] <=> target
#         when 0
#             return probe_i # we found our target
#         when 1
#             left_half = self.take(probe_i) #since we are looking at the left half, we preserve our proper index
#             left_half.bsearch(target)
#         when -1 
#             compensated_index = probe_i+1 # this is the index where we .drop from. It also represents the amount of indicies lost through splicing, which is why we add it back
#             right_half = self.drop(compensated_index)
#             right_half.bsearch(target) + (compensated_index)
#         end
#     end

# end

# non-monkey

def bsearch(arr,target)
return nil if arr.size == 0
probe_i = arr.size / 2
    
    case arr[probe_i] <=> target
    when 0
        return probe_i
    when 1
        left_half = arr.take(probe_i)
        bsearch(left_half,target)
    when -1
        compensated_index = probe_i + 1
        right_half = arr.drop(compensated_index)
        searched_half = bsearch(right_half,target)
        searched_half + compensated_index if !searched_half.nil?
    end
end

