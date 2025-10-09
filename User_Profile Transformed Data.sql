select *
from tv_profiles
limit 10;
---------------------------------------------------------------------------------------------
Select count(*) as row_count,
      count(distinct userid) subs
      from tv_profiles;

---checking  unqiue users identification
---------------------------------------------------------------------------------------------
Select distinct gender
from tv_profiles;

---We have Male , Female and none as a gender
---------------------------------------------------------------------------------------------
Select distinct race
from tv_profiles;

---We have 6 rows and 5 unique values, the aim is to merge the blank column and unpsecified
-----------------------------------------------------------------------------------------------
Select distinct province
from tv_profiles;

---We have 10 rows(of provinces) and 9 unique values
----------------------------------------------------------------------------------------------
Select distinct age
from tv_profiles
where age is null;

----------------------------------------------------------------------------------------------
---To change the above 'None' to unspecified, and combine the blank space with the unspecified
SELECT DISTINCT
CASE
    WHEN gender = 'None' then 'unspecified'
    WHEN gender = ' ' then 'unspecified'
    ELSE gender
END AS gender
FROM tv_profiles;

--We have Male , Female and unspecified as a gender
--------------------------------------------------------------------------------
SELECT DISTINCT 
CASE
    WHEN race IN (' ', 'Other') THEN 'unspecified'
    ELSE race
END AS race
FROM tv_profiles;

--Checking how many provinces we have
-------------------------------------------------------------------------------
SELECT DISTINCT
CASE
    WHEN province = 'None' then 'unspecified'
    WHEN province = ' ' then 'unspecified'
    ELSE province
END AS province
FROM tv_profiles;

-------------------------------------------------------------------------------
Select distinct race
from tv_profiles;

---We have White, Black, Asian, Native American, Pacific Islander
-------------------------------------------------------------------------------
select count(*) as row_count
from tv_profiles
group by userid
having count(*) > 1;
---We have 100000
-----------------------------------------------------------------------------
%sql
create or replace temporary view users as
select
    userid,
    age,
    case
        when gender = 'None' then 'unspecified'
        when gender = ' ' then 'unspecified'
        else gender
    end as gender,
    case
        when race IN (' ', 'Other') then 'unspecified'
        else race
    end as race,
    case
        when province = 'None' then 'unspecified'
        when province = ' ' then 'unspecified'
        else province
    end as province
from tv_profiles;

---Creating a new user table


----------------------------------------------------------------------------
select*from users;                                               
