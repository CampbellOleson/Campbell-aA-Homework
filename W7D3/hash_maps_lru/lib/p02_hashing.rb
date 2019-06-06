class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    alphabet = ("a".."z").to_a
    indices = []

    joined = self.join("").each_char do |char|
      if alphabet.include?(char)
        indices << alphabet.index(char)
      else 
        indices << char.to_i
      end
    end
    indices.join("").to_i.hash
  end
end

class String
  def hash
    alphabet = ("a".."z").to_a
    indices = []

    self.each_char do |char|
      indices << alphabet.index(char)
    end

    indices.join("").to_i.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    arr = self.sort_by {|k,v|k}
    arr.flatten!
    arr.hash
  end
end
