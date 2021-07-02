class Employee
def initialize(first, last,  ssn)
 @first=first 
 @last=last
 @ssn=ssn 
end 
attr_accessor:first,:last,:ssn

 def earnings()
  raise NotImplementedError.new("Wrong")
 end 
end

puts"------------------------"

 class SalariedEmployee <Employee
  def initialize(first, last,  ssn,salary)
     super(first, last,  ssn)
      setsalary(salary)
  end 
  def   setsalary(salary)
       if  salary>0
            @salary=salary
       else
            raise ArgumentError.new ("To poso prepei na einai megalitero apo 0.0" )
       end 
  end 
     def earnings()
        @salary
     end
 end 

puts"------------------------"






 class HourlyEmployee<Employee
 def initialize(first, last,  ssn ,hourlywage,hoursworked)
     super( first, last,  ssn)
      sethourlywage(hourlywage)
      sethoursworked(hoursworked)
 end 
    def   sethourlywage(hourlywage)
       if    hourlywage>0
             @hourlywage=hourlywage 
       else
            raise ArgumentError.new ("To poso prepei na einai megalitero apo 0.0" )
       end 
    end 
    def gethourlywage
        @hourlywage
    end 
    def   sethourlywage(hourlywage)
       if    hourlywage>0
             @hourlywage=hourlywage 
       else
            raise ArgumentError.new ("To poso prepei na einai megalitero apo 0.0" )
       end 
    end 
    def   sethoursworked(hoursworked)
       if      ((hoursworked >= 0.0 ) && ( hoursworked <= 168.0 ) )
              @hoursworked=hoursworked
       else
            raise ArgumentError.new ("To poso prepei na einai megalitero apo 0.0" )
       end 
    end 
    
    def gethoursworked
         @hoursworked
    end
    
    def earnings
       if (gethoursworked()<=40) 
           return gethourlywage() * gethoursworked()
       else
           return 40 * gethourlywage() + ( gethoursworked() - 40 ) * gethourlywage() * 1.5

       end 
    
    
    end 

 end 





puts"----------------------------"

class CommissionEmployee<Employee
  def initialize(first, last, ssn,grossales,commissionrate )
      super(first, last, ssn)
      setgrossales(grossales)
      setcommissionrate(commissionrate)
  end 
      def setcommissionrate(commissionrate)
             if (commissionrate > 0.0 && commissionrate < 1.0)
                    @commissionrate = commissionrate
             else
                  raise ArgumentError.new ("To poso prepei na einai megalitero apo 0.0" )
             end 
      end 
       def getcommissionrate()
 
             return  @commissionrate 
       end 

    
    def  setgrossales(grossales)
       if ( grossales >= 0.0 )
             @grossales = grossales
       else
           raise ArgumentError.new ("To poso prepei na einai megalitero apo 0.0" )
       end
    end  
   def getgrossales()
     return   @grossales  
   end    
   def earnings()
    return getgrossales()*getcommissionrate()
   end 


end 





puts"----------------------------------------------------------"

class BasePlusCommissionEmployee<CommissionEmployee
  def initialize(first, last, ssn,grossales,commissionrate,basesalary)
       super(first, last, ssn,grossales,commissionrate)
       setbasesalary(basesalary)
  end 
     def setbasesalary(basesalary)
        if   basesalary>=0.0 
            @basesalary =basesalary;
        else
        raise ArgumentError.new ("To poso prepei na einai megalitero apo 0.0" )
        end 
     end 
     
      def getbasesalary()
         return @basesalary
      end 
       
     def earnings()
       return getbasesalary()+(super)
     end   
      
end 
puts"----------------------------------------------------------"
 e=SalariedEmployee.new( "John", "Smith", "111-11-1111", 800.00 )
 puts e.class
 c=CommissionEmployee.new("Sue", "Jones", "333-33-3333", 10000, 0.6 )

 puts c.class

b=BasePlusCommissionEmployee.new("Bob", "Lewis", "444-44-4444", 5000, 0.4, 300 )

puts b.class
h=HourlyEmployee.new( "Karen", "Price", "222-22-2222", 16.75, 40 )
puts h.class 


 puts "Salaried Employee"
 
 puts "Salaried Employee earned",e.earnings()

  puts "Hourly Employee"
  
 puts "Hourly Employee earned",h.earnings()
 
 puts "Commission Employee"

 puts "Commission Employee earned",c.earnings()

 puts "Base Plus Commission Employee"

 puts "Base Plus Commission Employee earned",b.earnings()



 table=e,c,b,h
puts "Table elements"
 for i in table 
  puts i.earnings()
 end 
