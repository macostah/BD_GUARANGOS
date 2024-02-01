--Mostrar cantidad de clientes
select count(*) cantidad_clientes from [dbo].[CLIENTE]

--Mostrar cantidad de productos
select count(*) cantidad_productos from [dbo].[PRODUCTO]

--Mostrar cantidad de ventas
select count(*) cantidad_ventas from [dbo].[FACTURA]

--Mostrar cantidad de productos vendidos agrupados por cada producto
select NOMBRE_PRODUCTO, count(*) Cantidad_ventas from [dbo].[DETALLE_FACTURA]
group by NOMBRE_PRODUCTO
order by 2 desc

--Mostrar las ventas totales agrupados por cada producto, acá se puede ver los productos más vendidos
select NOMBRE_PRODUCTO, sum(TOTAL) Total_ventas from [dbo].[DETALLE_FACTURA]
group by NOMBRE_PRODUCTO
order by 2 desc

--Mostrar los 5 productos que más se venden
select top(5) NOMBRE_PRODUCTO, sum(TOTAL) Total_ventas from [dbo].[DETALLE_FACTURA]
group by NOMBRE_PRODUCTO
order by 2 desc

--Mostrar las ventas totales agrupados por cliente, acá se puede ver los clientes que más compran
select NOMRE_CLIENTE, sum(TOTAL) Total_venta from [dbo].[DETALLE_FACTURA]
group by NOMRE_CLIENTE
order by 2 desc

--Mostrar los 5 clientes que más compran
select top(5) NOMRE_CLIENTE, sum(TOTAL) Total_venta from [dbo].[DETALLE_FACTURA]
group by NOMRE_CLIENTE
order by 2 desc

--Mostrar venta totales agrupadas por tipo de pago
select TIPO_PAGO, sum(total) Venta_Total from [dbo].[DETALLE_FACTURA]
group by TIPO_PAGO
order by 2 desc

------------------------------------------------------------------------------------------------------------
----------------------------------CONVERTIR DATOS-----------------------------------------------------------

--Se convierte la columan FECHA_VENTA a un formato DATE para que pueda trabajarse con las funciones de fecha
UPDATE [dbo].[DETALLE_FACTURA] SET FECHA_VENTA = CONVERT(DATE,FECHA_VENTA,103)

--Pruebas para mostrar el mes de venta
SELECT MONTH(FECHA_VENTA) MES_VENTA FROM [dbo].[DETALLE_FACTURA]

--Prueba para mostar la columna FECHA_VENTA con su nuevo formato
SELECT * FROM [dbo].[DETALLE_FACTURA]

--Pruebas para mostrar el nombre mes de venta y se puede cambiar el lenguaje
set language 'spanish'
SELECT DATENAME(MONTH,FECHA_VENTA) FROM [dbo].[DETALLE_FACTURA]

--------------------------------------------------------------------
--------------------MODIFICAR TABLA---------------------------------

--Agregación de una columna MES_VENTA en el tabla DETALLE_FACTURA
alter table [dbo].[DETALLE_FACTURA] add MES_VENTA NUMERIC(2)

--Ingreso de datos en la nueva columna MES_VENTA
UPDATE [dbo].[DETALLE_FACTURA] SET [MES_VENTA] = MONTH(FECHA_VENTA)

--Prueba para mostar la columna MES_VENTA con sus datos
SELECT * FROM [dbo].[DETALLE_FACTURA]
--------------------------------------------------------------------


--Mostrar ventas totales por mes, acá se puede ver los meses que más venta tuvo
select MES_VENTA, SUM(TOTAL) VENTA_TOTAL FROM [dbo].[DETALLE_FACTURA]
group by MES_VENTA
order by 2 desc

--Mostrar los meses donde ventas totales superaron S/1800000
select MES_VENTA, SUM(TOTAL) VENTA_TOTAL FROM [dbo].[DETALLE_FACTURA]
group by MES_VENTA
having SUM(TOTAL)>1800000
order by 2 desc

-----------------------------------------------------------------------
---------------------------VISTAS--------------------------------------

--Vista para Mostrar los 5 productos que más se venden
create view VW_ProductosTops as
select top(5) NOMBRE_PRODUCTO, sum(TOTAL) Total_ventas from [dbo].[DETALLE_FACTURA]
group by NOMBRE_PRODUCTO
order by 2 desc

--Para ver la Vista VW_ProductosTops 
select * from VW_ProductosTops

--Modificar vista para Mostrar los 4 productos que más se venden
alter view VW_ProductosTops as
select top(4) NOMBRE_PRODUCTO, sum(TOTAL) Total_ventas from [dbo].[DETALLE_FACTURA]
group by NOMBRE_PRODUCTO
order by 2 desc

--Vista para Mostrar los 5 clientes que más compran
create view VW_ClientesTops as
select top(5) NOMRE_CLIENTE, sum(TOTAL) Total_venta from [dbo].[DETALLE_FACTURA]
group by NOMRE_CLIENTE
order by 2 desc

--Para ver la Vista VW_ClientesTops
select * from VW_ClientesTops

--Modificar la Vista para Mostrar los 4 clientes que más compran
alter view VW_ClientesTops as
select top(4) NOMRE_CLIENTE, sum(TOTAL) Total_venta from [dbo].[DETALLE_FACTURA]
group by NOMRE_CLIENTE
order by 2 desc

--Vista para Mostrar los meses donde ventas totales superaron S/1800000
create view VW_VentasMayores1800000 as
select MES_VENTA, SUM(TOTAL) VENTA_TOTAL FROM [dbo].[DETALLE_FACTURA]
group by MES_VENTA
having SUM(TOTAL)>1800000

--Para ver la Vista VW_VentasMayores1800000
select * from VW_VentasMayores1800000

--------------------------------------------------------------------------
--------------------------FUNCIONES---------------------------------------

--Funcion para ver el detalle de las ventas por fecha
create function VentasxFecha(@FechaVenta nvarchar(255)) returns table as
return(
		select * from [dbo].[DETALLE_FACTURA]
		where FECHA_VENTA = @FechaVenta
)

--Probando funcion VentasxFecha
select * from VentasxFecha('2014-12-31')

--Funcion para ver el total de ventas por fecha
create function SumaVentasxFechaa(@FechaVenta nvarchar(255)) returns float as
begin
	declare @suma float
	set @suma = (select SUM(TOTAL) from [dbo].[DETALLE_FACTURA]
				where FECHA_VENTA = @FechaVenta)
	return @suma
end

--Probando funcion SumaVentasxFechaa
select [dbo].[SumaVentasxFechaa]('2014-12-31') VENTA_TOTAL

--Funcion para ver las ventas por Cliente
create function VentasxClientes(@Cliente nvarchar(255)) returns table as
return(
		select * from [dbo].[DETALLE_FACTURA]
		where NOMRE_CLIENTE = @Cliente
)

--Probando funcion VentasxClientes
select * from VentasxClientes('INVERSIONES PECUARIAS LURIN S.A')

--Funcion para ver el total de ventas por cliente
create function SumaVentasxClientee(@Cliente nvarchar(255)) returns float as
begin
	declare @suma float
	set @suma = (select sum(TOTAL) from [dbo].[DETALLE_FACTURA]
				where NOMRE_CLIENTE = @Cliente)
	return @suma
end

--Probando funcion SumaVentasxCliente
select [dbo].[SumaVentasxClientee]('INVERSIONES PECUARIAS LURIN S.A') VENTA_TOTAL

--Funcion para ver al venta a un cliente en una determinada fecha
create function VentasxClienteyFecha(@Cliente nvarchar(255), @Fecha nvarchar(255)) returns table as
return(
		select * from [dbo].[DETALLE_FACTURA]
		where FECHA_VENTA = @Fecha
		AND NOMRE_CLIENTE = @Cliente
)

--Probando funcion VentasxClienteyFecha
select * from VentasxClienteyFecha('INVERSIONES PECUARIAS LURIN S.A', '2014-12-31')

--Funcion para ver las ventas por mes
create function VentasxMes(@mes numeric(2,0)) returns table as
return(
		select * from [dbo].[DETALLE_FACTURA]
		where MES_VENTA = @mes
)

--Probando funcion VentasxMes
select * from VentasxMes(2)

--Funcion para ver las ventas totales por mes
create function SumaVentasxMess(@mes numeric(2,0)) returns float as
begin
	declare @suma float
	set @suma = (select sum(TOTAL) from [dbo].[DETALLE_FACTURA]
					where MES_VENTA = @mes)
	return @suma
end

--Probando funcion SumaVentasxMess
select [dbo].[SumaVentasxMess](2) VENTA_TOTAL

--Funcion para ver las ventas por cliente en un mes determinado
create function VentasxMesyCliente(@mes numeric(2,0), @Cliente nvarchar(255)) returns table as
return(
		select * from [dbo].[DETALLE_FACTURA]
		where	MES_VENTA = @mes
		AND NOMRE_CLIENTE = @Cliente 
)

--Probando funcion VentasxMesyCliente
select * from VentasxMesyCliente(2, 'SANTA VERENA S.A.C.')

--Pruebas para ver el total de venta de la funcion VentasxMesyCliente
select SUM(TOTAL) from VentasxMesyCliente(2, 'SANTA VERENA S.A.C.')

-----------------------------------------------------------------------------------
--------------QUITAR ESPACIOS EN BLANCO------------------------------------------

--Quitar espacios en blanco de datos de la tabla DETALLE_FACTURA
--Columna NOMRE_CLIENTE 'DODERO SOCIEDAD ANONIMA CERRADA       '
--Columna ID_PRODUCTO '000001     '
--Columna NOMBRE_PRODUCTO 'CERDO DE PRIMERA (GORRINOS)         '

UPDATE [dbo].[DETALLE_FACTURA] SET NOMRE_CLIENTE = RTRIM(LTRIM(NOMRE_CLIENTE))

UPDATE [dbo].[DETALLE_FACTURA] SET ID_PRODUCTO = RTRIM(LTRIM(ID_PRODUCTO))

UPDATE [dbo].[DETALLE_FACTURA] SET NOMBRE_PRODUCTO = RTRIM(LTRIM(NOMBRE_PRODUCTO))

--Quitar espacios en blanco de datos de la tabla CLIENTE
--Columna NOMRE_CLIENTE 'DODERO SOCIEDAD ANONIMA CERRADA       '

UPDATE [dbo].[CLIENTE] SET NOMRE_CLIENTE = RTRIM(LTRIM(NOMRE_CLIENTE))

--Quitar espacios en blanco de datos de la tabla PRODUCTO
--Columna ID_PRODUCTO '000001     '
--Columna NOMBRE_PRODUCTO 'CERDO DE PRIMERA (GORRINOS)         '

UPDATE [dbo].[PRODUCTO] SET ID_PRODUCTO = RTRIM(LTRIM(ID_PRODUCTO))

UPDATE [dbo].[PRODUCTO] SET NOMBRE_PRODUCTO = RTRIM(LTRIM(NOMBRE_PRODUCTO))

------------------------------------------------------------------------------
----------------------------STORE PROCEDURE-----------------------------------

--Procedimiento para mostrar los datos propios de un producto
create procedure DatosProducto(@codigo nvarchar (255)) as
begin
	select * from [dbo].[PRODUCTO]
	where ID_PRODUCTO = @codigo
end

--Probando procedimiento DatosProducto
EXEC DatosProducto @codigo='000469'

--Procedimiento para ver el precio de venta de un producto
create procedure PrecioProducto(@codigo nvarchar (255)) as
begin
	select ID_PRODUCTO,PRECIO from [dbo].[PRODUCTO]
	where ID_PRODUCTO = @codigo
end

--Probando procedimiento PrecioProducto
exec PrecioProducto @codigo = '000469'

--Procedimiento para mostrar detalle de ventas a un cliente
create procedure DetalleVente(@codigo nvarchar (255)) as
begin
	select * from [dbo].[DETALLE_FACTURA]
	where ID_CLIENTE = @codigo
end
--Probando procedimiento DetalleVente
exec DetalleVente @codigo = '20100654611'

--Procedimiento para mostrar detalle de ventas mayores a S/20000 de un cliente
create procedure DetalleVentaMayor20000(@codigo nvarchar (255)) as
begin
	select * from [dbo].[DETALLE_FACTURA]
	where ID_CLIENTE = @codigo
	and TOTAL > 20000
end

--Probando procedimiento DetalleVentaMayor20000
exec DetalleVentaMayor20000 @codigo = '20100654611'

--Procedimiento para ver detalle de ventas de un producto
create procedure DetalleVentaProducto(@codigo nvarchar (255)) as
begin
	select * from [dbo].[DETALLE_FACTURA]
	where ID_PRODUCTO = @codigo
end

--Probando procedimiento DetalleVentaProducto
exec DetalleVentaProducto @codigo = '000001'

--Procedimiento para ver detalle de ventas mayores a S/3000 de un producto
create procedure DetalleVentaProductoMayor3000(@codigo nvarchar (255)) as
begin
	select * from [dbo].[DETALLE_FACTURA]
	where ID_PRODUCTO = @codigo
	and TOTAL > 3000
end

--Probado procedimiento DetalleVentaProductoMayor3000
exec DetalleVentaProductoMayor3000 @codigo = '000001'

--Procedimiento para ver detalle de ventas mayores a S/50000 de un producto
create procedure DetalleVentaProductoMayor50000(@codigo nvarchar (255)) as
begin
	select * from [dbo].[DETALLE_FACTURA]
	where ID_PRODUCTO = @codigo
	and TOTAL > 50000
end

--Probado procedimiento DetalleVentaProductoMayor50000
exec DetalleVentaProductoMayor50000 @codigo = '000001'

--Procedimiento para ver detalle de ventas mayores a S/70000 de un producto
create procedure DetalleVentaProductoMayor70000(@codigo nvarchar (255)) as
begin
	select * from [dbo].[DETALLE_FACTURA]
	where ID_PRODUCTO = @codigo
	and TOTAL > 70000
end

--Probado procedimiento DetalleVentaProductoMayor70000
exec DetalleVentaProductoMayor70000 @codigo = '000001'

--Procedimiento para ver detalle de ventas de un determinado mes
create procedure DetalleVentaMes(@mes numeric(2,0)) as
begin
	select * from [dbo].[DETALLE_FACTURA]
	where MES_VENTA = @mes
end

--Probando procedimiento DetalleVentaMes
exec DetalleVentaMes @mes = 10

--Procedimiento para ver detalle de ventas que superen los S/50000 de un determinado mes
create procedure DetalleVentaMesMayores50000(@mes numeric(2,0)) as
begin
	select * from [dbo].[DETALLE_FACTURA]
	where MES_VENTA = @mes
	and TOTAL > 50000
end

--Probando procedimiento DetalleVentaMesMayores50000
exec DetalleVentaMesMayores50000 @mes = 10

---------------------------------------------------------------------
------------------------------TRIGGER--------------------------------

--Creacion de trigger para INSERT en la tabla CLIENTE
create trigger CLIENTE_ALERTA
	on [dbo].[CLIENTE]
	after insert as
	begin
		print('Se insertaron los datos')
	end

--Probando trigger CLIENTE_ALERTA
insert into [dbo].[CLIENTE](ID_CLIENTE,NOMRE_CLIENTE)
values ('12345678901','Prueba insert')

insert into [dbo].[CLIENTE](ID_CLIENTE,NOMRE_CLIENTE)
values ('10987654321','Prueba insert2')

--Verificando datos insertados
select * from [dbo].[CLIENTE]
where NOMRE_CLIENTE like 'Prueba%'

--Creacion de trigger para DELETE en la tabla CLIENTE
create trigger CLIENTE_ALERTA2
	on [dbo].[CLIENTE]
	after delete as
	begin
		print('Se eliminaron los datos')
	end

--Probando trigger CLIENTE_ALERTA2
delete from [dbo].[CLIENTE] where ID_CLIENTE='12345678901'

delete from [dbo].[CLIENTE] where ID_CLIENTE='10987654321'

--Verificando datos eliminados
select * from [dbo].[CLIENTE]
where NOMRE_CLIENTE like 'Prueba%'

--Creacion de trigger para INSERT en la tabla PRODUCTO
create trigger PRODUCTO_ALERTA
	on [dbo].[PRODUCTO]
	after insert as
	begin
		print('Se insertaron los datos')
	end

--Probando trigger PRODUCTO_ALERTA
insert into [dbo].[PRODUCTO](ID_PRODUCTO,NOMBRE_PRODUCTO)
values('111111','Prueba insert')

insert into [dbo].[PRODUCTO](ID_PRODUCTO,NOMBRE_PRODUCTO)
values('111222','Prueba insert2')

--Verificando datos insertados
select * from [dbo].[PRODUCTO]
where ID_PRODUCTO like '111%'

--Creacion de trigger para DELETE en la tabla PRODUCTO
create trigger PRODUCTO_ALERTA2
	on [dbo].[PRODUCTO]
	after delete as
	begin
		print('Se eliminaron los datos')
	end

--Probando trigger PRODUCTO_ALERTA2
delete from [dbo].[PRODUCTO] where NOMBRE_PRODUCTO='Prueba insert'

delete from [dbo].[PRODUCTO] where NOMBRE_PRODUCTO='Prueba insert2'

--Verificando datos eliminados
select * from [dbo].[PRODUCTO]
where ID_PRODUCTO like '111%'

--Creacion de trigger para INSERT en la tabla DETALLE_FACTURA
create trigger DETALLE_FACTURA_ALERTA
	on [dbo].[DETALLE_FACTURA]
	after insert as
	begin
		print('Se insertaron los datos')
	end

--Probando trigger DETALLE_FACTURA_ALERTA
insert into [dbo].[DETALLE_FACTURA](ID_VENTA,FECHA_VENTA,TIPO_PAGO,ID_CLIENTE,NOMRE_CLIENTE,
			ID_PRODUCTO,NOMBRE_PRODUCTO,CANTIDAD,KILOS,PRECIO,TOTAL,MES_VENTA)
values('3333-33333333','2014-01-02','CRE','33333333333','MAGALLY DEL PILAR ACOSTA HERNANDEZ','3333333','CERDITOS GORDITOS',
		6,400,7.434,2973.6,1)

insert into [dbo].[DETALLE_FACTURA](ID_VENTA,FECHA_VENTA,TIPO_PAGO,ID_CLIENTE,NOMRE_CLIENTE,
			ID_PRODUCTO,NOMBRE_PRODUCTO,CANTIDAD,KILOS,PRECIO,TOTAL,MES_VENTA)
values('3333-44444444','2014-01-02','CRE','44444444444','MAGALLY DEL PILAR ACOSTA HERNANDEZ2','4444444','CERDITOS GORDITOS2',
		6,400,7.434,2973.6,1)

--Verificando datos insertados
select * from [dbo].[DETALLE_FACTURA]
where ID_VENTA like '3333%'

--Creacion de trigger para DELETE en la tabla DETALLE_FACTURA
create trigger DETALLE_FACTURA_ALERTA2
	on [dbo].[DETALLE_FACTURA]
	after delete as
	begin
		print('Se eliminaron los datos')
	end

--Probando trigger DETALLE_FACTURA_ALERTA2
delete from [dbo].[DETALLE_FACTURA] where ID_PRODUCTO ='3333333'

delete from [dbo].[DETALLE_FACTURA] where ID_PRODUCTO ='4444444'

--Verificando datos eliminados
select * from [dbo].[DETALLE_FACTURA]
where ID_VENTA like '3333%'