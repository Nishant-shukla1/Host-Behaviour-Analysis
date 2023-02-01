create database Housing_Analysis;

use housing_analysis;

select * from df_athens_availability

select count (id) from df_athens_availability

select * from host_athens_df

select distinct * from host_athens_df
select * from listing_athens_df;
select * from df_athens_availability

select count(distinct listing_id) from df_athens_availability 

select distinct listing_id from df_athens_availability order by listing_id

SELECT 
TABLE_CATALOG,
TABLE_SCHEMA,
TABLE_NAME, 
COLUMN_NAME, 
DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS

select * from 
host_athens_df as a left join listing_athens_df as b on a.host_id = b.host_id left join df_athens_availability as c on b.id =c.id

select * into Insight_1 from
(select host_is_superhost,
avg(host_response_rate) as Avg_response_rate,
avg(host_acceptance_rate) as Avg_acceptance_rate,
avg(cast(host_has_profile_pic as float))as Avg_has_profile_pic,
avg(cast(host_identity_verified as float))as Avg_identity_verified,
avg(accommodates)as Avg_accommodates,
avg(bedrooms)as Avg_bedrooms,
avg(beds)as Avg_beds,
avg(b.price) as Avg_price,
avg(b.minimum_nights)as Avg_minimum_nights,
avg(b.maximum_nights)as Avg_maximum_nights,
avg(review_scores_rating)as Avg_review_scores_rating,
avg(review_scores_accuracy)as Avg_review_scores_accuracy,
avg(review_scores_cleanliness)as Avg_scores_cleanliness,
avg(review_scores_checkin)as Avg_scores_checkin,
avg(review_scores_communication)as Avg_scores_communication,
avg(review_scores_location)as Avg_scores_location,
avg(review_scores_value)as Avg_scores_value,
avg(cast(instant_bookable as float))as Avg_instant_bookable,
avg(cast(available as float))as Avg_available

from
host_athens_df as a left join listing_athens_df as b on a.host_id = b.host_id left join df_athens_availability as c on b.id =c.id
where host_is_superhost is not null
group by host_is_superhost) as a;


select * into Insight_2 from(
select host_is_superhost,
((avg(host_response_rate)/max(host_response_rate))*100) as Avg_response_rate,
avg(host_acceptance_rate) as Avg_acceptance_rate,
((avg(cast(host_has_profile_pic as float)))/(max(cast(host_has_profile_pic as float)))*100)as Avg_has_profile_pic,
avg(cast(host_identity_verified as float))*100 as Avg_identity_verified,
cast(((avg(accommodates)/max(accommodates))*100) as float) as Avg_accommodates,
((avg(bedrooms)/max(bedrooms))*100)as Avg_bedrooms,
((avg(beds)/max(beds))*100)as Avg_beds,
((avg(b.price)/max(b.price))*100) as Avg_price,
((avg(b.minimum_nights)/max(b.minimum_nights))*100)as Avg_minimum_nights,
((avg(b.maximum_nights)/max(b.maximum_nights))*100)as Avg_maximum_nights,
((avg(review_scores_rating)/max(review_scores_rating))*100)as Avg_review_scores_rating,
((avg(review_scores_accuracy)/max(review_scores_accuracy))*100)as Avg_review_scores_accuracy,
((avg(review_scores_cleanliness)/max(review_scores_cleanliness))*100)as Avg_scores_cleanliness,
((avg(review_scores_checkin)/max(review_scores_checkin))*100)as Avg_scores_checkin,
((avg(review_scores_communication)/max(review_scores_communication))*100)as Avg_scores_communication,
((avg(review_scores_location)/max(review_scores_location))*100)as Avg_scores_location,
((avg(review_scores_value)/max(review_scores_value))*100)as Avg_scores_value,
avg(cast(instant_bookable as float))*100 as Avg_instant_bookable,
avg(cast(available as float))*100 as Avg_available

from
host_athens_df as a left join listing_athens_df as b on a.host_id = b.host_id left join df_athens_availability as c on b.id =c.id
where host_is_superhost is not null
group by host_is_superhost) as a;


select
host_is_superhost,
avg(accommodates),
cast((((avg(accommodates)/max(accommodates)))*100) as float )as Avg_accommodates,
max(accommodates)
from
host_athens_df as a left join listing_athens_df as b on a.host_id = b.host_id left join df_athens_availability as c on b.id =c.id
where host_is_superhost is not null
group by host_is_superhost;


select * from Insight_2




select host_is_superhost, count(case when comments like '%amazing%','% nice%', '%good%', '%satisfied%', '%happy%', '%cozy%', '%excellent%', '%fantastic%' then comments else Null end) as Possitive_count
from
review_athens_df as a left join listing_athens_df as b on a.listing_id =b.id left join host_athens_df as c on b.host_id = c.host_id
group by host_is_superhost;

select host_is_superhost, count(comments) as Possitive_count
from
review_athens_df as a left join listing_athens_df as b on a.listing_id =b.id left join host_athens_df as c on b.host_id = c.host_id
group by host_is_superhost;

select host_is_superhost, count(case when comments like '%good%' then comments else Null end) as possitive_count,count(case when comments like '%bad%' then comments else Null end) as negative_count
from
review_athens_df as a left join listing_athens_df as b on a.listing_id =b.id left join host_athens_df as c on b.host_id = c.host_id
where host_is_superhost is not null
group by host_is_superhost;


----- property type

select distinct property_type from Listing_athens_df;

select host_is_superhost, count(case when property_type like '%entire%' then property_type else null end) as Big_Property from
host_athens_df as a left join listing_athens_df as b on a.host_id = b.host_id
where host_is_superhost is not null
group by host_is_superhost;


----- avg price and availability of listing
select * from 
host_athens_df as a left join listing_athens_df as b on a.host_id = b.host_id left join df_athens_availability as c on b.id =c.id


select host_is_superhost, avg(c.price) as Avg_Price, avg(cast(available as float)) as Avg_availability from 
host_athens_df as a left join listing_athens_df as b on a.host_id = b.host_id left join df_athens_availability as c on b.id =c.id
where host_is_superhost is not null and year (c.date) = '2022'
group by Host_is_superhost;


select d.host_is_superhost,Avg_Price_Greece,Avg_availability_greece,Avg_Price_outside,Avg_availability_outside from (
(select host_is_superhost, avg(c.price) as Avg_Price_Greece, avg(cast(available as float)) as Avg_availability_greece from 
host_athens_df as a left join listing_athens_df as b on a.host_id = b.host_id left join df_athens_availability as c on b.id =c.id
where host_is_superhost is not null and  year (c.date) = '2022' and Host_location like '%greece%'
group by Host_is_superhost ) as d
inner join
(select host_is_superhost, avg(c.price) as Avg_Price_outside, avg(cast(available as float)) as Avg_availability_outside from 
host_athens_df as a left join listing_athens_df as b on a.host_id = b.host_id left join df_athens_availability as c on b.id =c.id
where host_is_superhost is not null and  year (c.date) = '2022' and Host_location  not like '%greece%'
group by Host_is_superhost) as e

on 
d.host_is_superhost = e.host_is_superhost);