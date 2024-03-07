SELECT * FROM `customer lifetime value`.customer_acquisition_data;

# Total Revenue per Customer

select `customer_id` , sum(`revenue`) as totl_rev
FROM `customer lifetime value`.customer_acquisition_data
group by `customer_id`;

# Purchase Frequency

select `customer_id` , count(*) as purchase_freq
from `customer lifetime value`.customer_acquisition_data
group by `customer_id`;

# Average Purchase Value:

select `customer_id` , round(avg(`revenue`)) as transaction_sum
from `customer lifetime value`.customer_acquisition_data
group by `customer_id`;

# Find the total revenue generated from each channel.

select sum(`revenue`) as total_rev, `channel` 
from `customer lifetime value`.customer_acquisition_data
group by `channel`;

# Calculate the average conversion rate for each channel.

select avg(`conversion_rate`) as avg_rate , `channel`
from `customer lifetime value`.customer_acquisition_data
group by `channel`;

# Identify the channel with the highest cost and the lowest cost.

select `channel` , sum(`cost`) as totl_cost
from `customer lifetime value`.customer_acquisition_data
group by `channel`
order by totl_cost desc;

# Determine the total revenue generated from paid advertising where the conversion rate is above 0.05.

select `channel`, count(`revenue`) as tot_r , `conversion_rate`
from `customer lifetime value`.customer_acquisition_data
where `conversion_rate` > 0.05
group by `conversion_rate` , `channel`
order by tot_r;

# Calculate the total cost and revenue for each channel, sorted by revenue in descending order.

select round(sum(`cost`)) as total_cost , sum(`revenue`) as total_rev , `channel`
from `customer lifetime value`.customer_acquisition_data
group by `channel`
order by total_cost desc;

# Find the channel with the highest return on investment (ROI), where ROI is defined as (revenue - cost) / cost.

select `channel` , round(sum(`revenue`)) as tot_rev , round(sum(`cost`)) as tot_sales , 
round((sum(`revenue`) - sum(`cost`)) / sum(`cost`)) as roi 
from `customer lifetime value`.customer_acquisition_data
group by `channel`
order by roi;

# Identify the top 3 channels with the highest revenue per conversion rate.

select `channel` , round(sum(`cost`) / sum(`conversion_rate`)) as rev_per_cov
from `customer lifetime value`.customer_acquisition_data
group by `channel`
order by rev_per_cov;

# Calculate the total cost and revenue for each channel, considering only conversions where revenue is above 2000.

select round(sum(`cost`)) as tot_sales , sum(`revenue`) as tot_rev , `conversion_rate`
from `customer lifetime value`.customer_acquisition_data
where `revenue` > 2000
group by `conversion_rate`;

# Find the channel with the highest total revenue and the lowest total cost, considering only conversions with a conversion rate above 0.1.

select sum(`revenue`) as tot_rev , round(sum(`cost`)) as tot_sales , `channel` , avg(`conversion_rate`) as avg_conv
from `customer lifetime value`.customer_acquisition_data
where `conversion_rate` > 0.1
group by `channel`
order by tot_rev desc , tot_sales asc;

# Identify the channel with the highest cost per conversion, where cost per conversion is defined as cost / conversion rate.

select `channel` , round(sum(`cost`)) as tot_sales , (sum(`cost`) / sum(`conversion_rate`)) as cost_per_convo
from `customer lifetime value`.customer_acquisition_data
group by `channel`
order by cost_per_convo;

# Identify the channel with the highest cost efficiency, where cost efficiency is defined as revenue / cost.

select `channel` , sum(`revenue`) as tot_rev , sum(`cost`) as tot_cost , (sum(`revenue`)/sum(`cost`)) as highest_cost_efficiency
from `customer lifetime value`.customer_acquisition_data
group by `channel`
order by highest_cost_efficiency;






