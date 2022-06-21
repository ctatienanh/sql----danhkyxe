create database qlxe;
use qlxe;

create table nhacungcap(
IDnhacc int primary key,
Tennhacc varchar (250),
diachi varchar (250),
dt int,
masothue varchar(250)
);

create table loaidichvu(
Iddichvu int primary key,
tendv varchar(250)
);

create table mucphi(
Idmaphi int primary key,
dongia int ,
mota varchar(250)
);

create table dongxe(
dongxe varchar(250) primary key ,
hangxe varchar(250) ,
sochongoi int
);

create table dangkycungcap(
IDdkcc int primary key,
Idnhacc int,
iddichvu int,
idmaphi int,
dongxe varchar(250),
ngaybatdaucungcap date,
ngayketthuccungcap date,
soluongxedangky int,
foreign key (Idnhacc) references nhacungcap(Idnhacc),
foreign key (Iddichvu) references loaidichvu(Iddichvu),
foreign key (Idmaphi) references mucphi(Idmaphi),
foreign key (dongxe) references dongxe(dongxe)
);

-- cau3
select dongxe , sochongoi from dongxe
where sochongoi >5;

-- cau4
select tennhacc as "nha cung cap" from nhacungcap as ncc
join dangkycungcap as dk on ncc.idnhacc = dk.idnhacc
where dongxe = 'yamaha2'
group by tennhacc;

-- cau5
select * from nhacungcap 
order by masothue desc ;

-- cau6
select tennhacc , count(iddkcc) as "so lan dang ky" from nhacungcap as n
join dangkycungcap as dk on n.idnhacc = dk.idnhacc
where dk.ngaybatdaucungcap > '2015-11-20'
group by tennhacc

-- cau7
select DISTINCT dx.hangxe as "hang xe" from dongxe as dx;
-- cau10
select tennhacc from nhacungcap as ncc
where ncc.idnhacc not in (select idnhacc from dangkycungcap);