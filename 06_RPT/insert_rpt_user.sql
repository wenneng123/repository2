--用户数量统计
insert into yp_rpt.rpt_user_count
select
    '2020-08-29',
    sum(if(login_date_last='2020-08-28',1,0)), --活跃会员数
    sum(if(login_date_first='2020-08-28',1,0)),--新增会员数
    sum(if(payment_date_first='2020-08-28',1,0)), --新增消费会员数
    sum(if(payment_count>0,1,0)), --总付费会员数
    count(*), --总会员数
    if(
        sum(if(login_date_last = '2020-08-28', 1, 0)) = 0,
        null,
        cast(sum(if(login_date_last = '2020-08-28', 1, 0)) as DECIMAL(38,4))
    )/count(*), --会员活跃率
    if(
        sum(if(payment_count>0,1,0)) = 0,
        null,
        cast(sum(if(payment_count>0,1,0)) as DECIMAL(38,4))
    )/count(*), --总会员付费率
    if(
        sum(if(login_date_first='2020-08-28',1,0)) = 0,
        null,
        cast(sum(if(login_date_first='2020-08-28',1,0)) as DECIMAL(38,4))
    )/sum(if(login_date_last='2020-08-28',1,0)) --会员新鲜度
from yp_dm.dm_user;