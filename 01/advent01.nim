import algorithm, sequtils, strutils

let f = open("input")

var numbers = newSeq[int](200)
var index: int = 0
while not endOfFile(f):
  numbers[index] = parseInt(readLine(f))
  inc(index)
f.close()

sort(numbers)

for i1 in 0..< (numbers.len - 1):
  var a = numbers[i1]
  var i2 = i1 + 1
  var b = numbers[i2]
  while (a + b != 2020 and i2 < 199):
    inc(i2)
    b = numbers[i2]
  if (a + b == 2020):
    echo a, " + ", b, " = ", a + b
    echo a, " * ", b, " = ", a * b

for i1 in 0..< (numbers.len - 2):
  var a = numbers[i1]
  for i2 in (i1 + 1)..< (numbers.len - 1):
    var b = numbers[i2]
    var i3 = i2 + 1
    var c = numbers[i3]
    while (a + b + c != 2020 and i3 < 199):
      inc(i3)
      c = numbers[i3]
    if (a + b + c == 2020):
      echo a, " + ", b, " + ", c, " = ", a + b + c
      echo a, " * ", b, " * ", c, " = ", a * b * c
