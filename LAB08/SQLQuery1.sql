CREATE DATABASE Lab10
--sao chep du lieu t? WORK sang LAB10--
USE AdventureWorks2016CTP3 
SELECT * INTO Lab10.dbo.WorkOrder FROM Production.WorkOrder
--sao chep du lieu tu bang WORKORDER cua LAB 10 sang WorkOrderIX 
USE Lab10
SELECT * INTO WorkOrderIX FROM WorkOrder
--xem du lieu 2 bang--
SELECT * FROM WorkOrder
SELECT * FROM WorkOrderIX
--tao chi muc cot WorkOrderID cua bang WorkOrderIX
CREATE INDEX IX_WorkOrderID ON WorkOrderIX(WorkOrderID)
--thuc hien cau lenh Select--
SELECT * FROM WorkOrder WHERE WorkOrderID = 72000
SELECT * FROM WorkOrderIX WHERE WorkOrderID = 72000