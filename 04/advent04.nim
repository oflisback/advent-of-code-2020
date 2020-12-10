import algorithm, parseutils, sequtils, strutils, tables

const rows = block:
  var result : seq[string]
  for line in staticRead("input").splitLines:
    result.add line
  result

const required = ["byr", "iyr","eyr","hgt","hcl","ecl","pid"]

var nbrValid = 0
var props = initTable[string, string]()
for i in 0 ..< rows.len:
  var kvs = rows[i].split(' ')
  for k in 0..<kvs.len:
    var kv = kvs[k].split(':')
    if kv.len == 2:
      props[kv[0]] = kv[1]
  if rows[i].len == 0:
    if required.len == filter(required, proc(p: string): bool = props.hasKey(p)).len:
      inc(nbrValid)
    props = initTable[string, string]()
echo nbrValid
