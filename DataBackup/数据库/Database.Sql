use GDS
go
/*==============================================================*/
/* Table: UserAuthority    用户权限表                           */
/*==============================================================*/
create table Authority (
   AuthorityID          int identity(1,1)    not null,			--权限编号
   UserType             char(6)              null,		--用户类型(管理员0,学生1,教师2)
   AuthorityName        varchar(30)          null,			--权限名称
   AuthorityLink        varchar(100)         null,			--权限链接路径
   AuthorityIcon        varchar(100)          null,			--权限图标链接路径
   constraint PK_USERAUTHORITY primary key (AuthorityID)
)
/**管理员的权限**/
/**管理员的权限**/
insert into Authority values(0,'教师申报课题','~/Admin/ManageSub.aspx',null)
insert into Authority values(0,'学生管理','~/Admin/ManageStu.aspx',null)
insert into Authority values(0,'选题管理','~/Admin/SubAndStu.aspx',null)
insert into Authority values(0,'教师管理','~/Admin/ManageTe.aspx',null)
insert into Authority values(0,'通知公告','~/Public/Message.aspx',null)
insert into Authority values(0,'归档材料','~/Admin/DataFile.aspx',null)

insert into Authority values(0,'下载专区','~/Public/DownloadZone/ZoneManage.aspx',null)
insert into Authority values(0,'学生账户维护','~/Admin/ResetPWD.aspx',null)

insert into Authority values(0,'教师信息导入','~/Admin/ImportTe.aspx',null)
insert into Authority values(0,'学生信息导入','~/Admin/ImportStu.aspx',null)
insert into Authority values(0,'基础数据维护','~/Admin/SetCollege.aspx',null)
insert into Authority values(0,'个人信息管理','~/Admin/MInfor.aspx',null)
insert into Authority values(0,'数据库维护','~/Admin/DataBackup.aspx',null)
/****教师的权限**/
insert into Authority values(1,'申报课题','~/Teacher/PublicSub.aspx',null)
insert into Authority values(1,'课题管理','~/Teacher/ManageSub.aspx',null)
insert into Authority values(1,'网上答疑','~/Student/MailManage.aspx',null)
insert into Authority values(1,'下载专区','~/Public/DownLoadZone/UserZoneDownload.aspx',null)
insert into Authority values(1,'通知公告','~/Public/Message.aspx',null)
insert into Authority values(1,'归档材料','~/Teacher/SendFinalData.aspx',null)
insert into Authority values(1,'个人信息管理','~/Teacher/TInfor.aspx',null)

/**学生的权限**/
insert into Authority values(2,'课题列表','~/Student/SubList.aspx',null)
insert into Authority values(2,'查看任务书','~/Student/TaskManage.aspx',null)
insert into Authority values(2,'开题报告提交','~/Student/ReportSend.aspx',null)
insert into Authority values(2,'论文提交','~/Student/PaperSend.aspx',null)
insert into Authority values(2,'通知公告','~/Public/Message.aspx',null)
insert into Authority values(2,'网上答疑','~/Teacher/MailManage.aspx',null)
insert into Authority values(2,'下载专区','~/Public/DownLoadZone/UserZoneDownload.aspx',null)
insert into Authority values(2,'个人信息管理','~/Student/SInfor.aspx',null)
go
/*==============================================================*/
/* Table: BaseSystemData   基础系统数据表                       */
/*==============================================================*/
create table BaseSystemData (
   AcademyName          varchar(20)          null,		--学院名称
   SubjectTime          char(4)	  			 null,			--毕业设计年份
   SubjectBegin         datetime             null,			--课题上报开始时间
   SubjectEnd           datetime             null,			--课题上报结束时间
   ChooseBegin          datetime             null,			--学生选题开始时间
   ChooseEnd            datetime             null,			--学生选题结束时间
  -- constraint PK_BASESYSTEMDATA primary key (AcademyName)
)
go
/*==============================================================*/
/* Table: Student        学生信息表                             */
/*==============================================================*/
create table Student (
   StudentID            char(13)             not null,			--学生编号
   StudentPWD           varchar(20)          null,				--密码
   StudentName          varchar(15)          null,				--学生姓名
   Sex                  char(2)              null,				--性别
   StudentLevel         char(6)              null,				--培养层次（专科,本科）
   ProfessionName       Varchar(30)			 null,				--专业名称
   Class                varchar(30)			 null,				--班级名称
   SubjectTime          char(4)	  			 null,				--毕业设计时间
   Phone				char(15)			 null,				--固定电话
   Telephone			char(15)			 null,				--手机号码
   Email                varchar(50)          null,				--电子邮件
   IsAccept             bit                  null,				--是否有毕业设计资格
   constraint PK_STUDENT primary key nonclustered (StudentID)
)

insert into Student values('200840410101','200840410101','王雪慧','男','本科','计算机科学与技术','(1)班','2012','1234567890','11111','111111@qq.com',1)

go
/*==============================================================*/
/* Table: Teacher               教师信息表                      */
/*==============================================================*/
create table Teacher (
   TeacherID            char(7)              not null,			--教师编号
   TeacherPWD           varchar(20)          null,				--密码
   TeacherName          varchar(15)          null,				--教师姓名
   Sex                  char(2)              null,				--性别
   Post                 varchar(50)          null,				--职称
   Phone				char(15)			 null,				--固定电话
   Telephone			char(15)			 null,				--手机号码
   Email                varchar(50)          null,				--电子邮箱
   constraint PK_TEACHER primary key nonclustered (TeacherID)
)
insert into Teacher values('100008','100008','张国军','男','教授','13881461234',null,null)
insert into Teacher values('100009','100009','余刚','男','教授','1234567890',null,null)
go
/*==============================================================*/
/* Table: Admins         管理员信息表                   */
/*==============================================================*/
create table Admins (
   AdminID              varchar(15)          not null,			--管理员编号
   AdminPWD             varchar(20)          null,				--密码
   AdminName            varchar(15)          null,				--管理员姓名
   Sex                  char(2)              null,				--性别
   Phone				char(15)			 null,				--固定电话
   Telephone			char(15)			 null,				--手机号码
   Email                varchar(50)          null,				--电子邮箱
   constraint PK_ADMINS primary key nonclustered (AdminID)
)
insert into Admins values('10000','10000','范梦','女','13235442364','','')
insert into ChosenSubject values('200840410106',2)
go
/*==============================================================*/
/* Table: Subjects               课题信息表                     */
/*==============================================================*/
create table Subjects (
   SubjectID            int identity(1,1)    not null,			--课题编号
   SubjectName          varchar(100)         null,				--课题名称
   SuitProfession       varchar(100)          null,				--适用专业(本科各专业,专科各专业,本专科各专业)
   SuitLevel            char(6)              null,				--适用层次(本,专,本专科)
   SubjectType          varchar(20)          null,				--课题类型
   SubjectOrigin        varchar(30)          null,				--课题来源
   SubjectNewOld        varchar(30)          null,				--课题新旧
   SubjectWorkload      bit					 null,				--课题工作量
   SubjectRequire       bit					 null,				--是否达到课题要求
   TeacherID1           char(7)				 null,				--指导老师编号1
   TeacherID2           char(7)				 null,				--指导老师编号2
   Memo                 text                 null,				--简介
   MaxPeople            int                  null,				--最大选题人数
   NowPeople            int                  null,				--已经选题人数
   SuitYear             char(4)	  			 null,				--课题适用年份
   IsCheck              bit                  null,				--是否通过审核
   constraint PK_SUBJECTS primary key nonclustered (SubjectID)
)
insert into Subjects values('学生成绩管理系统','计算机科学与技术','本科','','','',1,1,'100008','100009','简介',4,0,'2012',0)
exec ModifyChecked '1',0

select MaxPeople, NowPeople from Subjects where SubjectID=2
go
/*==============================================================*/
/* Table: Profession         专业信息表                         */
/*==============================================================*/
create table Profession (
   ProfessionID        int identity(1,1)     not null,
   ProfessionName       varchar(30)          null				--专业名称
   constraint PK_PROFESSION primary key (ProfessionID)
)
go
/*==============================================================*/
/* Table: ChosenSubject     学生课题表                          */
/*==============================================================*/
create table ChosenSubject (
   StudentID            char(13)             not null,				--学生编号
   SubjectID            int                  not null,				--课题编号
   constraint PK_CHOSENSUBJECT primary key (StudentID,SubjectID)
)

create procedure GetSendToTeacher
@id char(13)
as
declare @suid int
begin
  select @suid=SubjectID from ChosenSubject where StudentID=@id
  select TeacherID,TeacherName from Teacher 
  where TeacherID in (select TeacherID1 from Subjects where SubjectID=@suid) or 
  TeacherID in (select TeacherID2 from Subjects where SubjectID=@suid)
end

exec GetSendToTeacher '200840410101'
create procedure SubStuList 
 @id int
as
begin
   select SubjectName,Student.StudentID,StudentName,StudentLevel,ProfessionName,Class from Student,ChosenSubject,Subjects
 where ChosenSubject.SubjectID=@id and Student.StudentID=ChosenSubject.StudentID and Subjects.SubjectID=ChosenSubject.SubjectID 
end

create procedure AllStuSub--所有学生的选课情况
as
begin
  select SubjectName,Student.StudentID,StudentName,StudentLevel,ProfessionName,Class from Student,ChosenSubject,Subjects
 where Student.StudentID=ChosenSubject.StudentID and Subjects.SubjectID=ChosenSubject.SubjectID 
end

create procedure GetStuSubByMajor--所有学生的选课情况
 @major varchar(30)
as
begin
  select SubjectName,Student.StudentID,StudentName,StudentLevel,ProfessionName,Class from Student,ChosenSubject,Subjects
 where Student.StudentID=ChosenSubject.StudentID and Subjects.SubjectID=ChosenSubject.SubjectID and ProfessionName=@major
end

create procedure GetStuNoChoose--没有选题的学生信息
as
begin
  select * from Student where StudentID not in(select StudentID from ChosenSubject)
end

alter procedure GetStuNoChooseByMajor--没有选题的学生信息
@major varchar(30)
as
begin
  select * from Student where ProfessionName=@major and StudentID not in(select StudentID from ChosenSubject)
end

exec GetStuNoChooseByMajor '计算机科学与技术'
go
/*==============================================================*/
/* Table: MailInfo           邮件信息表                         */
/*==============================================================*/
create table MailInfo (
   MailNo               int identity(1,1)    not null,			--邮件编号
   SenderNo             varchar(15)          null,				--发送者编号
   ReceiverNo           varchar(15)          null,				--接收者编号
   SenderTime           datetime             null,				--发送时间
   Theme                varchar(50)          null,				--主题
   Contents             text                 null,				--内容
   IsRead               bit                  null,				--是否已读
   MailType             char(15)             null,				--邮件类型(任务书,外文翻译,开题报告,答疑,论文初稿,正式论文,归档材料)
   AccessoryPath        varchar(100)         null,				--附件路径(编号+附件名)
   constraint PK_MAILINFO primary key (MailNo)
)
go

/*==============================================================*/
/* Table: DownloadZone       下载专区                           */
/*==============================================================*/
create table DownloadZone (
   DataNo               int identity(1,1)    not null,			--材料编号
   Title                varchar(50)          null,				--标题
   Describe             text                 null,				--描述
   UploadTime           datetime             null,				--上传时间
   FilePath             varchar(100)         null,				--文件路径(编号+标题)
   constraint PK_DOWNLOADZONE primary key (DataNo)
)
go

/*==============================================================*/
/* Table: PublicNotice     通知公告                             */
/*==============================================================*/
create table PublicNotice (
   NoticeNo             int identity(1,1)    not null,			--公告编号
   Title                varchar(100)         null,               --标题
   SenderName           varchar(15)          null,				--发送者姓名(管理员)
   Contents             text                 null,				--内容
   SenderTime           datetime             null,				--发送时间
   SubjectTime          char(4)	  			 null,				--毕业设计年份
   constraint PK_PUBLICNOTICE primary key (NoticeNo)
)

/**************************************************************************
  外键约束

alter table Users
   add constraint FK_USERS_REFERENCE_USERTYPE foreign key (UserTypeID)
      references UserType (UserTypeID)
go


alter table UserAuthority
   add constraint FK_USERAUTH_REFERENCE_USERTYPE foreign key (User_TypeID)
      references UserType (UserTypeID)
go

alter table UserAuthority
   add constraint FK_USERAUTH_REFERENCE_AUTHORIT foreign key (AuthorityId)
      references authority (AuthorityId)
go
**************************************************************************/