def xor?(arg1, arg2)
   arg1 && !arg2 || arg2 && !arg1 ? true : false
end

# def xor?(arg1, arg2)
#   if arg1 == false && arg2 == false
#     false
#   elsif arg1 == true && arg2 == true
#     false
#   else
#     arg1 == true && arg2 == false || arg1 == false && arg2 == true
#     true
#   end
# end



p xor?(5.odd?, 4.odd?) # == true
p xor?(5.odd?, 4.even?) # == false
p xor?(5.even?, 4.odd?) # == false
