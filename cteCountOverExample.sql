--use https://livesql.oracle.com/
-- shows common table expressions, over, functions, partition by, and order by

with cte1 as (select distinct country_name, region_name from av.geography_dim ) 
select country_name
    , region_name
    ,count(region_name) over(partition by region_name) as CountriesintheRegion 
  from cte1 
    order by region_name desc


/
--slightly more complicated example

with cte1 as (select distinct country_name, region_name from av.geography_dim )
, cte2 as (select "2012" as popIn2012, country from world.world_population) -- when the column name is a number, use double quotes for pl/sql

select country_name
    , region_name
    , popIn2012
    , count(region_name) over(partition by region_name) as CountriesintheRegion 
    ,avg(popIn2012) over (partition by region_name) as AverageRegionPopulation
    ,sum(popIn2012) over (partition by region_name) as TotalRegionPopulation
 from cte1 region
     join cte2 pop on region.country_name = pop.country
order by region_name desc
