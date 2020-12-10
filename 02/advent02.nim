import algorithm, parseutils, sequtils, strutils

const input = block:
  var result : seq[string]
  for line in staticRead("input").splitLines:
    if line != "": result.add line
  result

proc validStrategyOne(s: string): bool =
  var parts = s.split(' ')
  var counts = parts[0].split('-')
  var lower = parseInt(counts[0])
  var upper = parseInt(counts[1])
  var count = parts[2].count(parts[1][0])

  return lower <= count and count <= upper

proc validStrategyTwo(s: string): bool =
  var parts = s.split(' ')
  var indices = parts[0].split('-')
  var first = parseInt(indices[0]) - 1
  var second = parseInt(indices[1]) - 1
  var c = parts[1][0]
  var password = parts[2]

  return (password[first] == c or password[second] == c) and password[first] != password[second]

echo input.filter(validStrategyOne).len
echo input.filter(validStrategyTwo).len

