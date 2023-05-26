-- Show all databases or schemas avalable in your connection
show databases;

# Select database name to use......
use project;

show tables;

# SQL SELECT – selecting all (*) column from a table
SELECt * FROM actions2load;

# count the number of rows
SELECT count(*) FROM actions2load;

# selecting data from specific columns
select event_time, event_type from actions2load;
# Select all rows from actions2load
SELECT * FROM actions2load;

# describe table structure
desc actions2load;

-- what events are most common?
select MAX(event_time) AS 'higest time'
FROM actions2load;



# least events 
select MIN(event_time) AS 'lowest time'
FROM actions2load;

-- higest account id 
select MAX(account_id)
From actions2load;

-- least account id 
select MIN(account_id)
From actions2load;

-- times events occurred based on different times of the day
select date_format(event_time, '%H:%i') As time_of_the_day, count(*) As event_count
From actions2load
group by time_of_the_day
order by time_of_the_day;

select distinct(account_id) from actions2load;
select count(distinct(account_id)) from actions2load;

# Number of events available
select distinct(event_type) from actions2load;
select count(distinct(event_type)) from actions2load;

# event type and frequency of event.
select
event_type, count(account_id) AS frequency_of_event
from
actions2load
group by event_type
order by frequency_of_event desc;

# account id and number of events.
select 
account_id, count(event_type) AS number_of_event
from
actions2load
group by account_id
order by number_of_event desc;

-- day of the week
select event_type, dayname(event_time) from actions2load;
select dayname(event_time) AS day_of_the_week,
count(event_type) AS event_count
from actions2load
group by day_of_the_week
order by event_count desc;

-- time of the day
select event_type, time_format(event_time, "%H:%i") AS time_of_the_day
from actions2load;

select time_format(event_time, '%H:%i') AS time_of_the_day, count(event_type) AS event_count
from actions2load
group by time_of_the_day
order by time_of_the_day;

