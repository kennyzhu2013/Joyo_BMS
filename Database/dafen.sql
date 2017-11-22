
---yaoqingma表，去掉次数，...
---yaoqingma=邀请码，默认写人名
---yid邀请评分对象
--jici,邀请码被评委使用次数..
create table `yaoqingma`(
   `id` INT NOT NULL AUTO_INCREMENT,
   `yaoqingma` VARCHAR(100) NOT NULL,
   `jici` INT NOT NULL,
   `yusername` varchar(60) NOT NULL,
   PRIMARY KEY ( `yaoqingma` )
);

---pingfen表
---"select uid,Round(convert(float,sum(zongfen)-max(zongfen)-min(zongfen))/(count(*)-2),2) as mark,max(zongfen) as zuida from pingfen group by uid having count(*)>2");
---yid，评委id..
---uid, 被评人员id...
---yeji-->fangan为具体打分事宜。..
---sum = yeji+...+fangan
create table `pingfen`(
   `username` varchar(60) NOT NULL,
   `yeji` INT NOT NULL default 0,
   `fenxiang` INT NOT NULL default 0,
   `dabian` INT NOT NULL default 0,
   `teamwork` INT NOT NULL default 0,
   `fangan` INT NOT NULL default 0,
   `zongfen` INT NOT NULL default 0,
   `yusername` varchar(60) NOT NULL,
   PRIMARY KEY (`username`, `yusername`)
);


---control表,当前打分评论只能同时接受一个
---当前活动的uid被评审对象,和用户关联
---open活动是否开启
create table `control`(
   `uid` INT NOT NULL,
   `open` tinyint(1) NOT NULL default 1,
   PRIMARY KEY ( `uid` )
);


-------用户列表...
CREATE TABLE `user` (
  `uid` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  PRIMARY KEY (`uid`)
);

---------总分,逻辑计算?..----------
---SQLHelper.GetTable("select uid,Round(convert(float,sum(zongfen)-max(zongfen)-min(zongfen))/(count(*)-2),2) as mark,max(zongfen) as zuida from pingfen group by uid having count(*)>2");

----------数据库初始化....
--生成邀请码，默认人名
---insert into yaoqingma([yaoqingma],jici) values ( CHAR(CONVERT(INT,rand()*26)+(CASE   WHEN   RAND()*2   >    1   THEN   97   ELSE   65   END))+ 

--是否已经评分
--select * from pingfen where uid=1 and yid = (select yid from yaoqingma where [yaoqingma]='WaSNOe')
--去除高低取平均
--select uid,Round(convert(float,sum(zongfen)-max(zongfen)-min(zongfen))/(count(*)-2),2) as mark,max(zongfen) as zuida from pingfen group by uid having count(*)>2
--插入用户
insert into user(username, password) values('zhuwei', 'zhuwei');
