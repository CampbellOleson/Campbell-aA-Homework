require_relative 'employee'

class Manager < Employee
   def initialize(name, title, salary, boss, employees)
    super(name, title, salary, boss)
    @employees = employees
   end

   def bonus(multiplier)
        sum = 0
        @employees.each {|employee|sum += employee.salary}
        sum *= multiplier.to_f
   end
end