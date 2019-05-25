def my_inject(acc = nil,&prc)
    arr = self.dup
    acc ||= arr.shift
    i = 0
    while i < arr.size
        acc = prc.call(acc,arr[i])
        i += 1
    end
    acc
end

# w each

# def my_inject(acc = nil, &prc)
#     arr = self.dup
#     acc ||= arr.shift
#     arr.each {|el| acc = prc.call(acc,el)}
#     acc
# end

