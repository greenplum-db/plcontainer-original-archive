CREATE OR REPLACE FUNCTION pytestudt3(r test_type3[]) RETURNS varchar AS $$
# container: plc_python_shared
res = ''
for row in r:
    res += '#' + str(row['a']) + '|' + str(row['b']) + '|' + row['c']
return res
$$ LANGUAGE plcontainer;

CREATE OR REPLACE FUNCTION pytestudt4(r test_type4[]) RETURNS varchar AS $$
# container: plc_python_shared
res = ''
for row in r:
    res += '#' + str(row['a']) + '|' + str(sum(row['b'])) + '|' + ','.join(row['c'])
return res
$$ LANGUAGE plcontainer;

CREATE OR REPLACE FUNCTION pytestudt5(r test_type4[]) RETURNS int AS $$
# container: plc_python_shared
if r is None:
    return 1
for el in r:
    if el is None:
        return 2
return 3
$$ LANGUAGE plcontainer;

CREATE OR REPLACE FUNCTION pytestudt7() RETURNS test_type3[] AS $$
# container: plc_python_shared
return [{'a': 1, 'b': 2, 'c': 'foo'}, {'a': 3, 'b': 4, 'c': 'bar'}]
$$ LANGUAGE plcontainer;

CREATE OR REPLACE FUNCTION pytestudt9() RETURNS SETOF test_type3[] AS $$
# container: plc_python_shared
return [ [{'a': 1, 'b': 2, 'c': 'foo'}, {'a': 3, 'b': 4, 'c': 'bar'}],
         [{'a': 5, 'b': 6, 'c': 'buz'}, {'a': 7, 'b': 8, 'c': 'zzz'}] ]
$$ LANGUAGE plcontainer;

CREATE OR REPLACE FUNCTION pytestudt10() RETURNS test_type4[] AS $$
# container: plc_python_shared
return [{'a': 1, 'b': [2,22], 'c': ['foo','foo2']}, {'a': 3, 'b': [4,44], 'c': ['bar','bar2']}]
$$ LANGUAGE plcontainer;

CREATE OR REPLACE FUNCTION pytestudt12() RETURNS SETOF test_type4[] AS $$
# container: plc_python_shared
return [ [{'a': 1, 'b': [2,22], 'c': ['foo','foo2']}, {'a': 3, 'b': [4,44], 'c': ['bar','bar2']}],
         [{'a': 5, 'b': [6,66], 'c': ['buz','buz2']}, {'a': 7, 'b': [8,88], 'c': ['zzz','zzz2']}] ]
$$ LANGUAGE plcontainer;

CREATE OR REPLACE FUNCTION pytestudt14(r test_type3[]) RETURNS test_type3[] AS $$
# container: plc_python_shared
return r
$$ LANGUAGE plcontainer;

CREATE OR REPLACE FUNCTION pytestudt15(r test_type3[]) RETURNS SETOF test_type3 AS $$
# container: plc_python_shared
return r
$$ LANGUAGE plcontainer;

CREATE OR REPLACE FUNCTION pybadudtarr() RETURNS test_type3[] AS $$
# container: plc_python_shared
return [ {'a': 1, 'b': 2, 'c': 'foo'}, {'a': 1, 'b': 2} ]
$$ LANGUAGE plcontainer;

CREATE OR REPLACE FUNCTION pybadudtarr2() RETURNS test_type4[] AS $$
# container: plc_python_shared
return [ {'a': 1, 'b': [2, 3], 'c': ['foo', 'bar']},
         {'a': 4, 'b': [5, 'f'], 'c': ['a', 'b']} ]
$$ LANGUAGE plcontainer;
