# Campbell Q1
# class is an object 
# contains attributes and method
# class methods -- don't rely on any instance-specific data
# instance methods -- specific to a particular instance of the class

#A text-book answer: classes are a blue-print for constructing computer models for real or virtual objects.
#In reality: classes hold data, have methods that interact with that data, and are used to instantiate objects.

# Savannah Q1
In object-oriented programming, objects are typically the real-world objects that are represented by classes in programming. They are also classes such as

An instance of a class. It's also the root class in ruby (Object). Classes themselves descend from the Object root class.

# C Q2
# if you're inside a method it's whatever the method is called on
array.sort
    def sort
        if self[i] > self[i+1]
            self[i] , self[i] = self[i+1],self[i]
        end
    end
end

`self` always refers to the current object. But this question is more difficult than it seems because Classes are also objects in ruby.

# class WhatIsSelf
#   def test
#     puts "At the instance level, self is #{self}"
#     # self is the current instance of class
#   end

#   def self.test
#     puts "At the class level, self is #{self}"
#     # self is the class
#   end
# end

# WhatIsSelf.test
#  #=> At the class level, self is WhatIsSelf

# WhatIsSelf.new.test
#  #=> At the instance level, self is #<WhatIsSelf:0x28190>

# Sav: Q 2
2. **Explain this ruby idiom: `a ||= b`**
If a is nil or false, then a is b.

# Cam Q3
#Class2
#    def initialize(thing2)
#end

#Class < Class2
#    def initialize(thing, thing2)
#    @classstuff = thing
#    super(thing2)

It calls a method on the parent class with the same name as the method that calls `super`.

# Sav Q3
Specs in unit testing only tests one thing. Specific; doesn't test how different object interact with each other; and uses mocks. Individually tests methods.

Unit testing, simply put, is testing methods -- the smallest unit in object-oriented programming. The primary way to achieve this is to assert that the **actual** result of the method matches an **expected** result.
### Prompt

Design a musical jukebox using object-oriented principles.
Assume the jukebox is virtual or computer-simulated.
Assume the jukebox operates free of charge.
```rb

class Jukebox
    @queue = []
    @current_song = queue[0]

    def add_to_queue(song)
        @queue << song
    end

    def play_song
        @current_song
    end

    def skip
        @queue.shift
    end

end

class Song
    attr_reader :title, :duration, :artist
    def initialize(title,duration,artist)
        @title = title
        @duration = duration
        @artist = artist
    end
end

until Jukebox.current_song.over?
    Jukebox.current_song
    Jukebox.skip
end

class Jukebox
  attr_accessor :user
  attr_reader :current_track

  def initialize(player, user)
    @player = player
    @user = user
    @current_track = nil
  end
end

class Player
  attr_accessor :album, :playlist

  def initialize(album, playlist)
    @album = album
    @playlist = playlist
  end

  def play_track(track)
    # Begin playing...
  end
end

class Playlist
  def initialize
    @queue = []
  end

  def add_track(track)
    @queue.push(track)
  end

  def shift
    @queue.shift
  end
end

class Album
  # Information about the album
end

class Track
  # Information about the track, including album
end

class User
  # Information about the user.
end
```

# SAV
Design a parking lot using object-oriented principles.

(Don't spend too much time fleshing out actual methods. Aim to give a
holistic view of which methods exist on each of the classes.)

class ParkingSpaces
    def initialize(size)
        @size = size
    end

    def is_fit?

    end

    def occupied?

    end
end

class Cars
    def initialize(size)
        @size = size
    end
end

class Sedan < Cars
    def initialize(size)
        @size = size
    end
end

class Truck < Cars
end

class SemiTruck < Cars
end

class Meters
    def initialize(space)
        @space = space
    end

    def time_limit
    end

    def 
end

class Driver
    def initialize(car, parking_space)
        @car = car
        @parking_space = parking_space
    end

    def is_parked?
    end

    def pay_meter
    end
end


class Vehicle
  attr_reader :spots_needed, :size

  def initialize(license_plate)
    @parking_spots = []
    @license_plate = license_plate
  end

  def park_in_spot(spot)
    # ...
  end

  def clear_spots
    # ...
  end

  def can_fit_in_spot(spot)
    # ...
  end
end

class Bus < Vehicle
  def initialize
    super
    @spots_needed = 5
    @size = :large
  end

  def can_fit_in_spot(spot)
    # Checks if spot is :large
  end
end

class Car < Vehicle
  def initialize
    super
    @spots_needed = 1
    @size = :compact
  end

  def can_fit_in_spot(spot)
    # Check if spot is :compact or :large
  end
end

class Motorcycle < Vehicle
  def initialize
    super
    @spots_needed = 1
    @size = :compact
  end
end

class ParkingLot
  def initialize
    @levels = # generate_levels
  end

  def park_vehicle(vehicle)
    # Park the vehicle in a spot or multiple spots. Return false if failed.
  end
end

class Level
  def initialize(floor, num_spots)
    @spots = # generate spots
    @available_spots = num_spots
    @floor = floor
  end

  def park_vehicle(vehicle)
    # Find a place to park vehicle or return false.
  end

  def park_starting_at(spot_num, vehicle)
    # Park a vehicle starting at spot number and continue until vehicle.spots_needed.
  end

  def find_available_spots(vehicle)
    # Find a spot to park the vehicle. Return index of spot or -1.
  end

  def spot_freed
    @available_spots += 1
  end
end

class ParkingSpot
  attr_reader :row, :spot_num

  def initialize(size, level, row, spot_num)
    @vehicle = nil
    @spot_size = size
    @level = level
    @row = row
    @spot_num = spot_num
  end

  def is_free?
    !@vehicle
  end

  def can_fit_vehicle?(vehicle)
    # Check it will fit.
  end

  def park(vehicle)
    # Park in spot
  end

  def unpark
    # Remove vehicle from spot and notify level that a new spot is available.
  end
end

# cam Q4
For this problem assume there is a Node class. The node class will take in a value as part of its initialization. You will be monkeypatching the following method:

Write a method `bfs` that does a breadth-first search starting at a root node. It takes in a target, and a proc as an argument.

Example usage:

```ruby
n1 = Node.new(1) making a node with a value of 1

n1.bfs(1) #=> n1

class Node
    def initialize(val)
        @value
        @parent
        @children = []
    end

    def bfs(&prc)
    raise "block required" if prc.nil?
    queue = [self]
        until queue.empty?
            current = self.shift
            return current if prc.call(current)
            current.children.each {|child|queue << child}
        end
        nil
    end
end


# Sav

For this problem assume there is a Node class. The node class will take in a value as part of its initialization. You will be monkeypatching the following method:

Write a method `dfs` that does a depth-first search starting at a root node. It takes in a target, and a proc as an argument.

class Node
    def dfs(&prc)
        raise "must pass in proc" if prc.nil?
        
        queue = [self]

        until queue.empty?
            current = queue.pop
            return current if prc.call(current)
            queue += current.children
        end

        nil
    end
end

class Node

    def dfs(&prc)
    raise "must enter block" if !prc

        return self if prc.call(self)
        self.children.each do |child|
            searched = child.dfs(&prc)
            return searched if searched
        end
        nil
    end

end

class Node

  # -- Assume nodes have a value, and a attr_reader on value
  # -- Also, assume there are working parent/child-related methods for Node
  def dfs(, &prc)
    raise "Must give a proc or target" if prc.nil?

    return self if prc.call(self)

    self.children.each do |node|
      result = node.dfs(target, &prc)
      return result if result
    end

    nil
  end
end