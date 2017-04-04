class Employee
  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end
end

class Manager < Employee
  attr_accessor :direct_reports

  def initialize(name, title, salary, boss)
    super(name, title, salary, boss)
    @direct_reports = []
  end

  def add_employee(employee)
    @direct_reports << employee
    # @boss.direct_reports << employee unless self.boss.nil?
  end

  def subordinates
    @subs = @direct_reports.dup
    @subs.each do |subordinate|
      if subordinate.is_a?(Manager)
        subordinate.direct_reports.each do |bro|
          @subs << bro
        end
      else
        next
      end
    end
    @subs
  end

  def bonus(multiplier)
    sum = 0
    subordinates.each do |employee|
      sum += employee.salary
    end
    sum * multiplier
  end
end

ned = Manager.new("Ned", "Founder", 1_000_000, nil)
darren = Manager.new("Darren", "TA Manager", 78_000, ned)
ned.add_employee(darren)
shawna = Employee.new("Shawna", "TA", 12_000, darren)
david = Employee.new("David", "TA", 10_000, darren)
darren.add_employee(shawna)
darren.add_employee(david)

# ned.direct_reports.each {|direct| p direct.name }


# ned.subordinates.each { |employee| p employee.name}

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000

ned.subordinates.each do |el| puts "#{el.name} : #{el.salary}" end
