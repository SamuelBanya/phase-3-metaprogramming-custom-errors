# NOTE: This is the chart of inheritance for the 'Exception' class that was provided in the lesson:
# Exception
# NoMemoryError
# ScriptError
#   LoadError
#   NotImplementedError
#   SyntaxError
# SignalException
#   Interrupt
# StandardError
#   ArgumentError
#   IOError
#     EOFError
#   IndexError
#   LocalJumpError
#   NameError
#     NoMethodError
#   RangeError
#     FloatDomainError
#   RegexpError
#   RuntimeError
#   SecurityError
#   SystemCallError
#   SystemStackError
#   ThreadError
#   TypeError
#   ZeroDivisionError
# SystemExit
# fatal

class Person
  attr_accessor :partner, :name

  def initialize(name)
    @name = name
  end

  def get_married(person)
    if person.is_a?(Person)
      self.partner = person
      person.partner = self
    else
      # NOTE: This is the 'error rescuing' pattern:
      begin
        raise PartnerError
      rescue PartnerError => error
        puts error.message
      end
    end
  end

  # NOTE: This 'PartnerError' class that we are creating will inherit from the 'StandardError' class:
  class PartnerError < StandardError
    # NOTE: 'Rescuing' includes the idea of using a custom message in an error like this:
    def message()
      "you must give the get_married method an argument of an instance of the person class!"
    end
  end

end

beyonce = Person.new("Beyonce")
beyonce.get_married("Jay-Z")
puts "beyonce.name: ", beyonce.name

# puts "beyonce.partner: ", beyonce.partner
