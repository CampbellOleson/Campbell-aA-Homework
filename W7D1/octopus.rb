#sluggish
def eat_fish(fishes)
    biggest = fishes[0]
    (0...fishes.size).each do |i1|
        (0...fishes.size).each do |i2|
            biggest = fishes[i2] if fishes[i2].size > fishes[i1].size && i2 > i1
        end
    end
    return biggest
end

fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# p eat_fish(fishes)

#clever
def clever_eats(fishes)
    biggest = fishes[0]
    fishes.each {|fish|biggest = fish if fish.size > biggest.size}
    biggest
end

# p clever_eats(fishes)

#dominant
def dominant_octo(fishes)
    return fishes if fishes.size < 2
    pivot = fishes[0]
    left = fishes.select {|fish|fish.size < pivot.size}
    right = fishes.select {|fish|fish.size > pivot.size}
    sorted_left = dominant_octo(left)
    sorted_right = dominant_octo(right)
    sorted = sorted_left + [pivot] + sorted_right
end

# p dominant_octo(fishes).last

#dancing
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(pos,tiles_array)
    tiles_array.each_with_index {|p,i|return i if p == pos}
end

# p slow_dance("left",tiles_array)

def fast_dance(pos,tiles_array)
    tiles_array.index(pos)
end

p fast_dance("left",tiles_array)