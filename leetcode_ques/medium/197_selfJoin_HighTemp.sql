--https://leetcode.com/problems/rising-temperature/
select original_weather.id from
weather original_weather,weather duplicate_weather
where
original_weather.recordDate=duplicate_weather.recordDate+1
and original_weather.temperature > duplicate_weather.temperature;
