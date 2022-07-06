class CustomMath

    def self.validate(num1,num2)
        if num1.class==Integer && num2.class==Integer
            return true
        else
            return false
        end
    end
    def calc(num1=num2,num2=num1,operator)
        if(CustomMath.validate(num1,num2))
                case operator
                    when '-'
                        return num1-num2
                    when '+'
                        return num1+num2
                    when '*'
                        return num1*num2
                    when '/'
                        begin
                            num1/num2
                        rescue Exception => e
                            return e.message
                        end

                    else 
                        return 'not supported operator'
                end
        else
            return ' not valid number'
        end 

    end
 
end
m1=CustomMath.new()

