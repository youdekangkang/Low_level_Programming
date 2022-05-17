%macro test 3
db %1%+,
db %2%+,
db %3
%endmacro

test "Hello","the","World"
