UPDATE tv_profiles
set Race ='unspecified'
where race in ('other','None') or race = '' ;

select distinct race,gender,
  count(v.userid) as customer 
  from tv_viewership as v
  left join tv_profiles as p
  on v.userid= p.userid
  group by race, gender
  order by race;

SELECT 
  COUNT(DISTINCT CHANNEL2) AS Number_of_channels,
  COUNT(DISTINCT v.userid) AS total_customers,
  date_format(recorddate2_new, 'MMM') AS Month_name,
  date_format(recorddate2_new, 'MM-yyyy') AS Month_id,
  date_format(recorddate2_new, 'E') AS Weekday,
  date_format(recorddate2_new, 'HH:mm') AS TIME,
  date_format(`DURATION 2`, 'HH:mm:ss') AS hours_of_Duration,
  CASE 
    WHEN date_format(recorddate2_new, 'HH:mm') BETWEEN '06:00' AND '11:59' THEN 'Morning_06:00-11:59'
    WHEN date_format(recorddate2_new, 'HH:mm') BETWEEN '12:00' AND '16:59' THEN 'Afternoon_12:00-16:59'
    WHEN date_format(recorddate2_new, 'HH:mm') BETWEEN '17:00' AND '21:59' THEN 'Evening_17:00-21:59'
    ELSE 'Night_22:00-05:59'
  END AS Time_Bucket,
  CASE 
    WHEN date_format(`DURATION 2`, 'HH:mm:ss') BETWEEN '00:00' AND '00:14' THEN 'Short_View_00:00-00:14'
    WHEN date_format(`DURATION 2`, 'HH:mm:ss') BETWEEN '00:15' AND '00:59' THEN 'Standard_View_00:15-00:59'
    WHEN date_format(`DURATION 2`, 'HH:mm:ss') BETWEEN '01:00' AND '02:59' THEN 'Engaged_View_01:00-02:59'
    ELSE 'Marathon_view_03:00-11:59'
  END AS Viewership_Duration,
  date_format(
    try_to_timestamp(
      recorddate2_new,
      'M/d/yyyy H:mm'
    ),
    'MM-yyyy'
  ) AS MONTH_ID,
  COUNT(DISTINCT v.UserID) AS customer,
  IFNULL(
    LAG(COUNT(DISTINCT v.UserID)) OVER (
      ORDER BY date_format(
        try_to_timestamp(
          recorddate2_new,
          'M/d/yyyy H:mm'
        ),
        'MM-yyyy'
      )
    ),
    0
  ) AS previous_month,
  ROUND(
    COALESCE(
      (
        COUNT(DISTINCT v.UserID) - LAG(COUNT(DISTINCT v.UserID)) OVER (
          ORDER BY date_format(
            try_to_timestamp(
              recorddate2_new,
              'M/d/yyyy H:mm'
            ),
            'MM-yyyy'
          )
        )
      ) / NULLIF(
        LAG(COUNT(DISTINCT v.UserID)) OVER (
          ORDER BY date_format(
            try_to_timestamp(
              recorddate2_new,
              'M/d/yyyy H:mm'
            ),
            'MM-yyyy'
          )
        ),
        0
      ) * 100,
      0
    )
  ) AS MOM_percentage,
  any_value(p.Gender) AS Gender,
  any_value(p.Race) AS Race,
  any_value(p.Province) AS Province,
  ROUND(AVG(p.AGE), 0) AS `Average Age`,
   CASE 
    WHEN p.age BETWEEN 0 AND 12 THEN 'Children:0 - 12'
    WHEN p.age BETWEEN 13 AND 19 THEN 'Teen:13 - 19'
    WHEN p.age BETWEEN 20 AND 39 THEN 'Young_Adults:20 - 39'
    WHEN p.age BETWEEN 40 AND 59 THEN 'Middle_Aged_Adults:40 - 59 '
    ELSE 'Seniors: >59 '
  END AS Age_basket
FROM tv_viewership AS v
LEFT JOIN tv_profiles AS p
  ON v.userid = p.userid
GROUP BY 
  date_format(recorddate2_new, 'yyyy-MM-dd'),
  date_format(recorddate2_new, 'MMM'),
  date_format(recorddate2_new, 'MM-yyyy'),
  date_format(recorddate2_new, 'E'),
  date_format(`DURATION 2`, 'HH:mm:ss'),
  date_format(recorddate2_new, 'HH:mm'),
  date_format(
    try_to_timestamp(
      recorddate2_new,
      'M/d/yyyy H:mm'
    ),
    'MM-yyyy'
  ),
   CASE 
    WHEN p.age BETWEEN 0 AND 12 THEN 'Children:0 - 12'
    WHEN p.age BETWEEN 13 AND 19 THEN 'Teen:13 - 19'
    WHEN p.age BETWEEN 20 AND 39 THEN 'Young_Adults:20 - 39'
    WHEN p.age BETWEEN 40 AND 59 THEN 'Middle_Aged_Adults:40 - 59 '
    ELSE 'Seniors: >59 '
  END
;