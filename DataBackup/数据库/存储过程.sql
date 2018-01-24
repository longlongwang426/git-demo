/***************************************************************************/
/*  �洢����*/
/***************************************************************************/
create procedure IsUserExist---����û����Ƿ���ڣ��������򷵻�1�����򷵻�0
   @id varchar(15),
   @type int,
   @is int output
as
begin
  if(@type=0)
	begin 
      if(EXISTS(select * from Admins where AdminID=@id))  set @is=1
       else set @is=0
	end
  else if(@type=1)
	begin 
      if(EXISTS(select * from Teacher where TeacherID=@id))  set @is=1
       else set @is=0
	end
 else if(@type=2)
	begin 
      if(EXISTS(select * from Student where StudentID=@id))  set @is=1
       else set @is=0
	end
end

create procedure IsPwdRight  --�����û���ź������ѯ�û�����������
   @id varchar(15),
   @pwd varchar(20),
   @type int
as
begin
  if(@type=0) 
      select AdminPWD from Admins where AdminID=@id and AdminPWD=@pwd
  else if(@type=1)
      select TeacherPWD from Teacher where TeacherID=@id and TeacherPWD=@pwd
 else if(@type=2)
      select StudentPWD from Student where StudentID=@id and StudentPWD=@pwd
end

create procedure ModifyPwd  --�����û���ź������ѯ�û�����������
   @id varchar(15),
   @pwd varchar(20),
   @type int
as
begin
  if(@type=0) 
      update Admins set AdminPWD=@pwd where AdminID=@id
  else if(@type=1)
      update Teacher set TeacherPWD=@pwd where TeacherID=@id
 else if(@type=2)
      update Student set StudentPWD=@pwd where StudentID=@id
end

exec IsPwdRight '200840410101','200840410107',1

create procedure GetUserName --�����û���ź��û�����Ż�ȡ�û�����
    @id varchar(15),
    @type int
as
begin
  if @type=2
  begin select StudentName from Student where StudentID=@id end
  if @type=1
  begin select TeacherName from Teacher where TeacherID=@id end
  if @type=0
  begin select AdminName from Admins where AdminID=@id end
end

create procedure GetSysSet--��ȡϵͳ����
as
begin
  select SubjectTime,SubjectBegin,SubjectEnd,ChooseBegin,ChooseEnd from BaseSystemData
end

create procedure SetYear--�������
   @year char(4)
as
begin
  if(exists(select SubjectTime from BaseSystemData))
        update BaseSystemData set SubjectTime=@year
        else insert into BaseSystemData(SubjectTime) values(@year)
end

create procedure SetSubTime --���ÿ����걨ʱ���ѡ��ʱ��
    @id int,
    @time datetime
as
begin
  if @id=1
	begin if(exists(select SubjectBegin from BaseSystemData))
        update BaseSystemData set SubjectBegin=@time
        else insert into BaseSystemData(SubjectBegin) values(@time)
	end
  else  if @id=2
	begin if(exists(select SubjectEnd from BaseSystemData))
        update BaseSystemData set SubjectEnd=@time
        else insert into BaseSystemData(SubjectEnd) values(@time)
	end
  else  if @id=3
	begin if(exists(select ChooseBegin from BaseSystemData))
        update BaseSystemData set ChooseBegin=@time
        else insert into BaseSystemData(ChooseBegin) values(@time)
  end
  else  if @id=4
	begin if(exists(select ChooseEnd from BaseSystemData))
        update BaseSystemData set ChooseEnd=@time
        else insert into BaseSystemData(ChooseEnd) values(@time)
  end
end

create procedure DeleteOneSub--���ݱ��ɾ������
@id int
as
begin
  delete from Subjects where SubjectID=@id
end

alter procedure GetAcademy--��ȡѧԺ����
@name varchar(30) output
as 
begin
  if(exists(select AcademyName from BaseSystemData))
   select @name=AcademyName from BaseSystemData 
end 

declare @name varchar(30)
exec GetAcademy @name
select @name
--��ʼ��ѧԺ
alter procedure InitCollege
    @name varchar(30)
as
begin
   if(exists(select AcademyName from BaseSystemData))
    begin update BaseSystemData set AcademyName=@name end
   else
    begin insert into BaseSystemData(AcademyName) values(@name) end
end


create procedure ModifyCollege  --�޸�ѧԺ����
    @name varchar(30)
as
 begin 
   update BaseSystemData set AcademyName=@name
 end

create procedure ModifyMajor--�޸�רҵ����
   @id int,
   @name varchar(30)
as
begin 
  update Profession set ProfessionName=@name where ProfessionID=@id
end

create procedure DeleteProf--ɾ��רҵ
   @id int
as
begin
   delete from Profession where ProfessionID=@id
end

create procedure InsertStu--����ѧ��
    @id char(12),--���
    @name varchar(15),--����
    @sex char(5),--�Ա�
    @type char(4),--���ͣ�ר�ƻ��Ǳ���
    @aid int,
    @ProName varchar(30),--רҵ����
    @class  varchar(30),--�༶
    @enter  datetime,--��ѧʱ��
    @leave  datetime,--��Уʱ��
    @subtime datetime,--����ʱ��
    @tel1  varchar(15),
    @tel2  varchar(15),
    @email varchar(50)--�ʼ�
as
declare @pid int
begin
   select @pid=ProfessionID from Profession where ProfessionName=@Proname
   insert into Student values(@id,@name,@sex,@type,@aid,@pid,@class,@enter,@leave,@subtime,@tel1,@tel2,@email)
end

create procedure InsertTea--�����ʦ��Ϣ
    @id char(7),
    @name varchar(15),
    @sex char(5),
    @post varchar(50),
    @t1 varchar(15),
    @t2 varchar(15),
    @email varchar(50)
as
  begin
    insert into Teacher values(@id,@name,@sex,@post,@t1,@t2,@email)
end

create procedure InsertTea--����һ����ʦ��Ϣ
    @id char(7),
    @name varchar(15),
    @sex char(5),
    @post varchar(50),
    @t1 varchar(15),
    @t2 varchar(15),
    @email varchar(50)
as
  begin
    insert into Teacher values(@id,@id,@name,@sex,@post,@t1,@t2,@email)
end

create procedure InsertStu  --����ѧ����Ϣ
    @id char(13),
    @name varchar(15),
    @sex char(2),
    @level char(6),
    @pname Varchar(30),
    @class varchar(30),
    @time char(4),
    @phone char(15),
    @tel char(15),
    @email varchar(50)
as
begin
insert into 
Student(StudentID,StudentPWD,StudentName,Sex,StudentLevel,ProfessionName,Class,SubjectTime,Phone,Telephone,Email) 
values(@id,@id,@name,@sex,@level,@pname,@class,@time,@phone,@tel,@email)
end


create procedure ModifyOneStu--�޸�ѧ����Ϣ
    @id char(13),
    @name varchar(15),
    @sex char(2),
    @level char(6),
    @pname Varchar(30),
    @class varchar(30),
    @time char(4),
    @phone char(15),
    @tel char(15),
    @email varchar(50),
    @is bit
as
begin
   update Student set StudentName=@name,Sex=@sex,StudentLevel=@level,ProfessionName=@pname,Class=@class,
                  SubjectTime=@time,Phone=@phone,Telephone=@tel,Email=@email,IsAccept= @is
   where StudentID=@id
end

alter procedure DeleteOneStu--ɾ��һ��ѧ����Ϣ
  @id char(12)
as
begin
  delete from Student where StudentID=@id
end

alter procedure GetAllStu--��ȡ����ѧ����Ϣ
as
declare @year char(4)
begin
select @year=SubjectTime from BaseSystemData
   select StudentID,StudentName,Sex,StudentLevel,ProfessionName,Class,SubjectTime,Phone,Telephone,Email,IsAccept 
from Student where SubjectTime=@year
end

create procedure GetOneStu--��ȡһ��ѧ����Ϣ
   @id char(13)
as
declare @year char(4)
begin
select @year=SubjectTime from BaseSystemData
   select StudentID,StudentName,Sex,StudentLevel,ProfessionName,Class,SubjectTime,Phone,Telephone,Email,IsAccept 
from Student where SubjectTime=@year and StudentID=@id
end

create procedure ModifyAccept  --�޸�ѧ��ѡ����ʸ�
  @id  char(13),
  @is bit
as
begin
  update Student set IsAccept=@is where StudentID=@id
end

create procedure GetOneMajorStu --����רҵ��ѯѧ��
   @name varchar(30)
as
declare @year char(4)
begin
select @year=SubjectTime from BaseSystemData
   select StudentID,StudentName,Sex,StudentLevel,ProfessionName,Class,SubjectTime,Phone,Telephone,Email,IsAccept 
where ProfessionName=@name and SubjectTime=@year
end


create procedure DeleteOneSub--���ݱ��ɾ��һ������
    @id int
as
begin delete from Subjects where SubjectID=@id
end
create procedure ModifyChecked --�޸����״̬
   @id int,
   @c  bit
as
begin
  update Subjects set IsChecked=@c where SubjectID=@id
end

alter procedure GetOneSub --��ȡһ��������Ϣ
  @id int
as
declare @year char(4)
begin
select @year=SubjectTime from BaseSystemData
select T1.SubjectID,T1.SubjectName,T1.SuitProfession,T1.SuitLevel,T1.SubjectType,T1.SubjectOrigin,T1.SubjectNewOld,
      T1.SubjectWorkload,T1.SubjectRequire,T1.TeacherName as n1,T1.Post as p1,T2.TeacherName as n2,T2.Post as p2,Memo,MaxPeople,NowPeople,SuitYear,IsCheck from
(select  SubjectID,SubjectName,SuitProfession,SuitLevel,SubjectType,SubjectOrigin,SubjectNewOld,
      SubjectWorkload,SubjectRequire,TeacherName,Post,Memo,MaxPeople,NowPeople,SuitYear,IsCheck from Subjects,Teacher where TeacherID1=TeacherID) as T1
left join
(select  SubjectID,TeacherName,Post from Subjects,Teacher  where TeacherID2=null or TeacherID2=TeacherID) as T2
on T1.SubjectID=T2.SubjectID where T1.SubjectID=@id and SuitYear=@year
end

exec GetOneSub '1'
exec GetAllSub

alter procedure GetAllSub --��ȡ���п�����Ϣ
as
declare @year char(4)
begin
select @year=SubjectTime from BaseSystemData
   select T1.SubjectID,T1.SubjectName,T1.SuitProfession,T1.SuitLevel,T1.SubjectType,T1.SubjectOrigin,T1.SubjectNewOld,
      T1.SubjectWorkload,T1.SubjectRequire,T1.TeacherName as n1,T1.Post as p1,T2.TeacherName as n2,T2.Post as p2,Memo,MaxPeople,NowPeople,SuitYear,IsCheck from
(select  SubjectID,SubjectName,SuitProfession,SuitLevel,SubjectType,SubjectOrigin,SubjectNewOld,
      SubjectWorkload,SubjectRequire,TeacherName,Post,Memo,MaxPeople,NowPeople,SuitYear,IsCheck from Subjects,Teacher where TeacherID1=TeacherID) as T1
left join
(select  SubjectID,TeacherName,Post from Subjects,Teacher  where TeacherID2=null or TeacherID2=TeacherID) as T2
on T1.SubjectID=T2.SubjectID where SuitYear=@year
end

create procedure ModifyChecked --�޸Ŀ������״̬
   @id int,
   @c  bit
as
begin
  update Subjects set IsCheck=@c where SubjectID=@id
end

create procedure GetAllTea--��ȡ���н�ʦ��Ϣ
as
begin select * from Teacher
end

create procedure GetOneTea--��ȡһ����ʦ��Ϣ
   @id char(7)
as
begin select * from Teacher where TeacherID=@id
end

create procedure DeleteOneTea--ɾ��һ����ʦ��Ϣ
   @id char(7)
as
begin 
   delete from Teacher where TeacherID=@id
end

alter procedure UpdateOneTea--�޸�һ����ʦ��Ϣ
    @id char(7),
    @name varchar(15),
    @sex char(2),
    @post varchar(50),
    @t1 varchar(15),
    @t2 varchar(15),
    @email varchar(50)
as
  begin
    update Teacher set TeacherName=@name,Sex=@sex,
               Post=@post,Phone=@t1,Telephone=@t2,Email=@email where TeacherID=@id
end

create procedure GetOneManager
   @id varchar(15)
as
begin
  select * from Admins where AdminID=@id
end

alter procedure ModifyManager
   @id varchar(15),
   @name varchar(15),
   @sex char(2),
   @phone char(15),
   @tel char(15),
   @email varchar(50) 
as
begin
  update Admins set AdminName=@name,Sex=@sex,Phone=@phone,Telephone=@tel,Email=@email
  where AdminID=@id
end

create procedure DeleteNotice  --ɾ��һ������
  @id int
as
begin
  delete from PublicNotice where NoticeNo=@id
end

create procedure InsertNotice--��������
  @title varchar(100),
  @name varchar(15),
  @content text,
  @year char(4)
as
begin
  insert into PublicNotice(Title,SenderName,Contents,SubjectTime) values(@title,@name,@content,@year)
end

create procedure ModifyNotice --�޸Ĺ���
  @id int,
  @title varchar(100),
  @name varchar(15),
  @content text,
  @year char(4)
as
begin
  update PublicNotice set Title=@title,SenderName=@name,Contents=@content,SubjectTime=@year 
  where NoticeNo=@id
end

alter procedure GetAllNotice  --��ȡ���й���
as
declare @year char(4)
begin
select @year=SubjectTime from BaseSystemData
select * from PublicNotice where SubjectTime=@year order by SenderTime desc
end
exec GetAllNotice
select * from PublicNotice where SubjectTime='2012' order by SenderTime desc

create procedure GetOneNotice  --��ȡһ������
 @id int
as
declare @year char(4)
begin
select @year=SubjectTime from BaseSystemData
select * from PublicNotice where SubjectTime=@year and NoticeNo=@id
end

go

alter procedure GetSendToStu --ָ����ʦ����ѧ��
@cid int,
@id char(13)
as
begin
 if @cid=1
begin
  select Student.StudentID,StudentName from Student,ChosenSubject
  where Student.StudentID=ChosenSubject.StudentID and ChosenSubject.SubjectID
  in (select SubjectID from Subjects where TeacherID1=@id or TeacherID2=@id)
end
else if @cid=2
       select Student.StudentID,StudentName from Student,ChosenSubject
  where Student.StudentID=ChosenSubject.StudentID and ChosenSubject.SubjectID
  in (select SubjectID from Subjects where TeacherID1=@id)
end

alter procedure GetAdmin--��ȡ����Ա���
as
begin
select AdminID from Admins 
end

CREATE  PROCEDURE sp_KillThread  
  @dbname  varchar(20)
as
begin
declare  @sql  nvarchar(500),@temp varchar(1000)
declare  @spid  int
set  @sql='declare  getspid  cursor  for
select  spid  from  master..sysprocesses  where  dbid=db_id('''+@dbname+''')'  
exec  (@sql)  
open  getspid  
fetch  next  from  getspid  into  @spid
while  @@fetch_status <> -1
begin
  set @temp='kill  '+rtrim(@spid)
  exec(@temp)
fetch  next  from  getspid  into  @spid
end
close  getspid
deallocate  getspid
end

exec dbo.DataRestore 'GDS','E:\\123'

create procedure DataBackup--���ݿⱸ��
 @name varchar(50),
  @path varchar(100)
as
begin
  backup database @name to disk=@path
end

create procedure DataRestore--���ݿ⻹ԭ
 @name varchar(50),
  @path varchar(100)
as
begin
  restore database @name from disk=@path with replace
end