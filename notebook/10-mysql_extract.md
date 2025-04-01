select 
  recdate, extract(hour from createtime) as hour, channelid, channel, 
  count(1) as regcount
from slv2_users_channel 
where recdate = '{$intdate}' 
group by hour,recdate,channelid,channel