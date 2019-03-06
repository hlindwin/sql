--use https://livesql.oracle.com/


with cte1 as (select distinct country_name, region_name from av.geography_dim ) 
select country_name
    , region_name
    ,count(region_name) over(partition by region_name) as CountriesintheRegion 
  from cte1 
    order by region_name desc
