def prob1(str,n)
    puts str*n
end 

def prob2(str)
    if str.start_with?("if") 
        puts "true"
    else 
        puts "false"
    end
end

def prob3(str)
    print str[-1] << str[1...-1]  << str [0]
end 

def prob4(str)
    last_ch= str.length() -1 
    print  str.split('')[last_ch] + str + str.split('')[last_ch];
end     

def prob6(nums)
   print rotated = nums[1], nums[2], nums[0];
end

def bouns1(nums,target)
    for i in 0..nums.length() -1
        j=i+1
        for j in j..nums.length() -1 
            if nums[j]==target - nums[i] 
                puts i,j 
            end
        end
    end
end


def prob7(nums)
    sum = 0
    i = 0
    while i < nums.length
            if(nums[i] == 17)
             i= i + 1
         else
                sum = sum + nums[i]
         end
         i += 1
     end
        return sum
 end

