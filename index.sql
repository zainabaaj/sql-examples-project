--index that stores music genre values into 2 tables , the results is in the screenshot in the file
IF ( OBJECT_ID('dbo.index1') IS NOT NULL ) 
   DROP table dbo.index1
GO
IF ( OBJECT_ID('dbo.index2') IS NOT NULL ) 
   DROP table dbo.index2
GO
create table index1 (x int primary key ,y varchar(50))
create table index2 (x int primary key ,y varchar(50))
create nonclustered index idxindex2 on index2 (y)
with (PAD_INDEX= ON , FILLFACTOR = 90 , drop_existing =OFF)
DECLARE @vals TABLE( id int identity (1,1), vals varchar(20))
insert into @vals values 
('Rock'),('Jazz'),('Metal'),('Alternative'),('Disco'),
('Blues'),('Latin'),('Reggae'),('Pop')
,('Art Punk'),('Alternative Rock'),('College Rock'),
('Experimental Rock'),('Medieval'),('Early Music'),
('Choral'),('Chant'),('Chamber Music'),('Baroque'),
('Avant-Garde'),('Stories'),('Sing-Along'),('Lullabies'),
('Children Music'),('Electric Blues'),('Pop'),('Delta Blues'),
('Country Blues'),('Classic Blues'),('Chicago Blues')
,('Blues'),('Acoustic Blues'),('Anime'),('Shoegaze'),
('Steampunk '),('Punk'),('Progressive Rock'),('New Wave'),
('Indie Rock'),('Hardcore Punk'),('Grunge'),('Hard Rock'),
('Goth'),('Folk Punk'),('Hip-Hop/Rap'),('German Pop'),
('German Folk'),('French Pop'),('Enka'),('Industrial'),
('Novelty'),('Comedy'),('Wedding Music'),('Romantic'),
('Renaissance'),('Orchestral'),('Opera'),('Minimalism')

declare @x int =1,@y int 
declare @val varchar(20)
while @x<200000
begin
 if @x >150000
	set @val = 'classic'
 else 
 begin 
 set @y=(convert (int,round(rand()*58,0))%10) +1

 select @val = vals from @vals where id = @y
 end
  insert into index1 values(@x,@val)
  insert into index2 values(@x,@val)
  set @x+=1
  end
  set statistics io on 
  select * from index1 where x>150000
  select * from index1 where y='classic'
  select * from index2 where x>150000
  select * from index2 where y='classic'


