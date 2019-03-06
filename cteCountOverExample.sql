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

/* 
results are

First Query:
COUNTRY_NAME	REGION_NAME	COUNTRIESINTHEREGION
Chile	South America	11
Ecuador	South America	11
Colombia	South America	11
Paraguay	South America	11
Honduras	South America	11
El Salvador	South America	11
Brazil	South America	11
Venezuela	South America	11
Peru	South America	11
Argentina	South America	11
Uruguay	South America	11
New Zealand	Oceania	1
Cuba	North America	4
Mexico	North America	4
United States	North America	4
Canada	North America	4
France	Europe	13
Poland	Europe	13
Netherlands	Europe	13
Germany	Europe	13
Portugal	Europe	13
Serbia	Europe	13
Hungary	Europe	13
Italy	Europe	13
United Kingdom	Europe	13
Finland	Europe	13
Austria	Europe	13
Greece	Europe	13
Romania	Europe	13
Turkey	Asia	21
Thailand	Asia	21
Saudi Arabia	Asia	21
India	Asia	21
Israel	Asia	21
Belarus	Asia	21
Uzbekistan	Asia	21
Japan	Asia	21
China	Asia	21
Bangladesh	Asia	21
Jordan	Asia	21
Afghanistan	Asia	21
Pakistan	Asia	21
Singapore	Asia	21
Ukraine	Asia	21
South Korea	Asia	21
Malaysia	Asia	21
Indonesia	Asia	21
Russian Federation	Asia	21
Kazakhstan	Asia	21
Armenia	Asia	21
Download CSV
Rows 1 - 50. More rows exist.
Result Set 209


Second Query:
COUNTRY_NAME	REGION_NAME	POPIN2012	COUNTRIESINTHEREGION	AVERAGEREGIONPOPULATION	TOTALREGIONPOPULATION
Argentina	South America	41086927	10	37470810.5	374708105
Brazil	South America	198656019	10	37470810.5	374708105
Chile	South America	17464814	10	37470810.5	374708105
Ecuador	South America	15492264	10	37470810.5	374708105
Uruguay	South America	3395253	10	37470810.5	374708105
El Salvador	South America	6297394	10	37470810.5	374708105
Colombia	South America	47704427	10	37470810.5	374708105
Honduras	South America	7935846	10	37470810.5	374708105
Paraguay	South America	6687361	10	37470810.5	374708105
Peru	South America	29987800	10	37470810.5	374708105
New Zealand	Oceania	4433100	1	4433100	4433100
Canada	North America	34754312	4	120196696.5	480786786
United States	North America	313914040	4	120196696.5	480786786
Cuba	North America	11270957	4	120196696.5	480786786
Mexico	North America	120847477	4	120196696.5	480786786
France	Europe	65696689	13	30556795.84615384615384615384615384615385	397238346
Germany	Europe	80425823	13	30556795.84615384615384615384615384615385	397238346
United Kingdom	Europe	63612729	13	30556795.84615384615384615384615384615385	397238346
Austria	Europe	8429991	13	30556795.84615384615384615384615384615385	397238346
Serbia	Europe	7223887	13	30556795.84615384615384615384615384615385	397238346
Hungary	Europe	9920362	13	30556795.84615384615384615384615384615385	397238346
Portugal	Europe	10514844	13	30556795.84615384615384615384615384615385	397238346
Italy	Europe	59539717	13	30556795.84615384615384615384615384615385	397238346
Netherlands	Europe	16754962	13	30556795.84615384615384615384615384615385	397238346
Romania	Europe	20076727	13	30556795.84615384615384615384615384615385	397238346
Finland	Europe	5413971	13	30556795.84615384615384615384615384615385	397238346
Poland	Europe	38535873	13	30556795.84615384615384615384615384615385	397238346
Greece	Europe	11092771	13	30556795.84615384615384615384615384615385	397238346
Thailand	Asia	66785001	20	189573177.2	3791463544
India	Asia	1236686732	20	189573177.2	3791463544
Pakistan	Asia	179160111	20	189573177.2	3791463544
Singapore	Asia	5312400	20	189573177.2	3791463544
Saudi Arabia	Asia	28287855	20	189573177.2	3791463544
China	Asia	1350695000	20	189573177.2	3791463544
Israel	Asia	7910500	20	189573177.2	3791463544
Afghanistan	Asia	29824536	20	189573177.2	3791463544
Japan	Asia	127561489	20	189573177.2	3791463544
Ukraine	Asia	45593300	20	189573177.2	3791463544
Bangladesh	Asia	154695368	20	189573177.2	3791463544
Uzbekistan	Asia	29774500	20	189573177.2	3791463544
Kazakhstan	Asia	16791425	20	189573177.2	3791463544
Jordan	Asia	6318000	20	189573177.2	3791463544
Malaysia	Asia	29239927	20	189573177.2	3791463544
Armenia	Asia	2969081	20	189573177.2	3791463544
Turkey	Asia	73997128	20	189573177.2	3791463544
Russian Federation	Asia	143533000	20	189573177.2	3791463544
Belarus	Asia	9464000	20	189573177.2	3791463544
Indonesia	Asia	246864191	20	189573177.2	3791463544
Mali	Africa	14853572	12	39331209.91666666666666666666666666666667	471974519
Madagascar	Africa	22293914	12	39331209.91666666666666666666666666666667	471974519
Download CSV
Rows 1 - 50. More rows exist.
*/
