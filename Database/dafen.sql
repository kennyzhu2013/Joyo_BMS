
---yaoqingma��ȥ��������...
---yaoqingma=�����룬Ĭ��д����
---yid�������ֶ���id
--jici,�����뱻��ίʹ�ô���..
create table yaoqingma(
   uid INT NOT NULL AUTO_INCREMENT,
   yaoqingma VARCHAR(100) NOT NULL,
   jici INT NOT NULL,
   yid INT NOT NULL,
   PRIMARY KEY ( uid )
);

---pingfen��
---"select uid,Round(convert(float,sum(zongfen)-max(zongfen)-min(zongfen))/(count(*)-2),2) as mark,max(zongfen) as zuida from pingfen group by uid having count(*)>2");
---yid����ίid..
---uid, ������Աid...
---yeji-->fanganΪ���������ˡ�..
---sum = yeji+...+fangan
create table pingfen(
   uid INT NOT NULL,
   yeji INT NOT NULL default 0,
   fenxiang INT NOT NULL default 0,
   dabian INT NOT NULL default 0,
   teamwork INT NOT NULL default 0,
   fangan INT NOT NULL default 0,
   zongfen INT NOT NULL default 0,
   yid INT NOT NULL,
   PRIMARY KEY ( uid )
);


---control��,��ǰ�������ֻ��ͬʱ����һ��
---��ǰ���uid���������,���û�����
---open��Ƿ���
create table control(
   uid INT NOT NULL,
   open tinyint(1) NOT NULL default 1,
   PRIMARY KEY ( uid )
);


-------�û��б�...
create table pingwei(
   uid INT NOT NULL AUTO_INCREMENT,
   name VARCHAR(100) NOT NULL,
   password VARCHAR(100) NOT NULL,
   PRIMARY KEY ( uid )
);

----------���ݿ��ʼ��....
--���������룬Ĭ������
---insert into yaoqingma([yaoqingma],jici) values ( CHAR(CONVERT(INT,rand()*26)+(CASE   WHEN   RAND()*2   >    1   THEN   97   ELSE   65   END))+ 

--�Ƿ��Ѿ�����
--select * from pingfen where uid=1 and yid = (select yid from yaoqingma where [yaoqingma]='WaSNOe')
--ȥ���ߵ�ȡƽ��
--select uid,Round(convert(float,sum(zongfen)-max(zongfen)-min(zongfen))/(count(*)-2),2) as mark,max(zongfen) as zuida from pingfen group by uid having count(*)>2
--�����û�
