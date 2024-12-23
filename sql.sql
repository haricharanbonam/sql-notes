--REGEXP :: 
SELECT city
FROM station
WHERE city REGEXP '^A';




---it selects all the words ends with [aeiou]

SELECT distinct city
FROM station
WHERE city REGEXP '[aeiou]$';

--starting with

 SELECT DISTINCT city
FROM station
WHERE LOWER(city) REGEXP '^[aeiou]';

--containing 


SELECT DISTINCT city
FROM station
WHERE LOWER(city) REGEXP '[aeiou]';


---not containing
SELECT DISTINCT city
FROM station
WHERE LOWER(city) NOT REGEXP '^[aeiou]';




--both start and end
SELECT DISTINCT city
FROM station
WHERE LOWER(city) REGEXP '^[aeiou].*[aeiou]$';


------------substring---------------------------
--starts with index 1
--T H I S   I S    S Q L
--1 2 3 4 5 6 7 8  9 10 11()
---9-8-7-6-5-4-3-2-1(NEGATIVE INDEXING)
select substring(string,start_index,length(from_that_index)) from dual;
select substring("hari charan",2,5) from dual;
--ari c   starting from that index it goes to that length

select substring("hari charan",-4,3) from dual;
--ara

--it will start from negative index (index is from the back) and then it goes forward to that length of chars

--Example: select name from students where marks>75 order by substring(name,-3,3) asc,id asc;









