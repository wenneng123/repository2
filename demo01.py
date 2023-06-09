select *
from (select s.sid, s.sname, b.sscore, b.cname, dense_rank() over (partition by cname order by sscore desc) as rk
      from student s
               join (select sid, sscore, cname
                     from score
                              join course c on score.cid = c.cid) b on s.sid = b.sid) as k
where rk <= 3;

select *
from (select s.sid, s.sname, b.sscore, dense_rank() over (partition by department order by sscore desc) as rk
      from student s
               join (select sid, sscore, cname
                     from score
                              join course c on score.cid = c.cid
                     where c.cid = 2 ) b on s.sid = b.sid where department='cs') as k
where rk = 1;


print('python bigdate')
print('hello world')
