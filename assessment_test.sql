-- Câu 1: 
-- Tính dòng 1: Total
select 'Total' as Segmentation
	, count(distinct `Member Account Code`) as 'Total no.of clients'
	, round(sum(`Sales Amt`)*0.00003858,0) as 'Total Sales'
	, count(distinct Invoice) as'Total No.of Transactions'
	, sum(`Sales Qty`) as 'Total Items Sold'
-- Tính transactions with > 2 items 
	, (
		select count(Invoice) 
		from (
			select Invoice
				, sum(`Sales Qty`) as 'Items'
			from test_assesment
			group by Invoice 
			having sum(`Sales Qty`) >= 2
			) as trans_2_items
	) as 'Transactions with 2 items'
	, round(sum(`Sales Amt`*0.00003858)/count(distinct Invoice),0) as 'ATV'
	, round(sum(`Sales Qty`)/count(distinct Invoice),1) as 'UPT'
from test_assesment
union
-- Tính dòng 2: PLANTIUM
select 'PLANTIUM' as Segmentation
	, count(distinct `Member Account Code`) as 'Total no.of clients'
	, round(sum(`Sales Amt`)*0.00003858,0) as 'Total Sales'
	, count(distinct Invoice) as'Total No.of Transactions'
	, sum(`Sales Qty`) as 'Total Items Sold'
	, (
		select count(Invoice) as 'Transactions with 2 items'
		from (
			select Invoice
			from test_assesment
			where `Member Account Code` in (
				select `Member Account Code` 
				from test_assesment
				group by `Member Account Code` 
				having sum(`Sales Amt`)*0.00003858 > 50000
			)
			group by Invoice  
			having sum(`Sales Qty`) >= 2
		) as trans_2_items
	) as 'Transactions with 2 items'
	, round(sum(`Sales Amt`)*0.00003858/count(distinct Invoice),0) as 'ATV'
	, round(sum(`Sales Qty`)/count(distinct Invoice),1) as 'UPT'
from test_assesment
where `Member Account Code` in (
	select `Member Account Code` 
	from test_assesment
	group by `Member Account Code` 
	having sum(`Sales Amt`)*0.00003858 > 50000
)
union
-- Tính dòng 3: GOLD
select 'GOLD' as Segmentation
	, count(distinct `Member Account Code`) as 'Total no.of clients'
	, round(sum(`Sales Amt`)*0.00003858,0) as 'Total Sales'
	, count(distinct Invoice) as'Total No.of Transactions'
	, sum(`Sales Qty`) as 'Total Items Sold'
	, (
		select count(Invoice) as 'Transactions with 2 items'
		from (
			select Invoice
			from test_assesment
			where `Member Account Code` in (
				select `Member Account Code` 
				from test_assesment
				group by `Member Account Code` 
				having sum(`Sales Amt`)*0.00003858 <= 50000 and sum(`Sales Amt`)*0.00003858 > 25000
			)
			group by Invoice  
			having sum(`Sales Qty`) >= 2
		) as trans_2_items
	) as 'Transactions with 2 items'
	, round(sum(`Sales Amt`)*0.00003858/count(distinct Invoice),0) as 'ATV'
	, round(sum(`Sales Qty`)/count(distinct Invoice),1) as 'UPT'
from test_assesment
where `Member Account Code` in (
	select `Member Account Code` 
	from test_assesment
	group by `Member Account Code` 
	having sum(`Sales Amt`)*0.00003858 <= 50000 and sum(`Sales Amt`)*0.00003858 > 25000
)
union
-- Tính dòng 4: SILVER
select 'SILVER' as Segmentation
	, count(distinct `Member Account Code`) as 'Total no.of clients'
	, round(sum(`Sales Amt`)*0.00003858,0) as 'Total Sales'
	, count(distinct Invoice) as'Total No.of Transactions'
	, sum(`Sales Qty`) as 'Total Items Sold'
	, (
		select count(Invoice) as 'Transactions with 2 items'
		from (
			select Invoice
			from test_assesment
			where `Member Account Code` in (
				select `Member Account Code` 
				from test_assesment
				group by `Member Account Code` 
				having sum(`Sales Amt`)*0.00003858 <= 25000 and sum(`Sales Amt`)*0.00003858 > 10000
			)
			group by Invoice  
			having sum(`Sales Qty`) >= 2
		) as trans_2_items
	) as 'Transactions with 2 items'
	, round(sum(`Sales Amt`)*0.00003858/count(distinct Invoice),0) as 'ATV'
	, round(sum(`Sales Qty`)/count(distinct Invoice),1) as 'UPT'
from test_assesment
where `Member Account Code` in (
	select `Member Account Code` 
	from test_assesment
	group by `Member Account Code` 
	having sum(`Sales Amt`)*0.00003858 <= 25000 and sum(`Sales Amt`)*0.00003858 > 10000
)
union
-- Tính dòng 5: CT
select 'CT' as Segmentation
	, count(distinct `Member Account Code`) as 'Total no.of clients'
	, round(sum(`Sales Amt`)*0.00003858,0) as 'Total Sales'
	, count(distinct Invoice) as'Total No.of Transactions'
	, sum(`Sales Qty`) as 'Total Items Sold'
	, (
		select count(Invoice) as 'Transactions with 2 items'
		from (
			select Invoice
			from test_assesment
			where `Member Account Code` in (
				select `Member Account Code` 
				from test_assesment
				group by `Member Account Code` 
				having sum(`Sales Amt`)*0.00003858 <= 10000 and sum(`Sales Amt`)*0.00003858 > 3000
			)
			group by Invoice  
			having sum(`Sales Qty`) >= 2
		) as trans_2_items
	) as 'Transactions with 2 items'
	, round(sum(`Sales Amt`)*0.00003858/count(distinct Invoice),0) as 'ATV'
	, round(sum(`Sales Qty`)/count(distinct Invoice),1) as 'UPT'
from test_assesment
where `Member Account Code` in (
	select `Member Account Code` 
	from test_assesment
	group by `Member Account Code` 
	having sum(`Sales Amt`)*0.00003858 <= 10000 and sum(`Sales Amt`)*0.00003858 > 3000
)
union 
-- Tính dòng 6: OTHERS
select 'OTHERS' as Segmentation
	, count(distinct `Member Account Code`) as 'Total no.of clients'
	, round(sum(`Sales Amt`)*0.00003858,0) as 'Total Sales'
	, count(distinct Invoice) as'Total No.of Transactions'
	, sum(`Sales Qty`) as 'Total Items Sold'
	, (
		select count(Invoice) as 'Transactions with 2 items'
		from (
			select Invoice
			from test_assesment
			where `Member Account Code` in (
				select `Member Account Code` 
				from test_assesment
				group by `Member Account Code` 
				having sum(`Sales Amt`)*0.00003858 <= 3000
			)
			group by Invoice  
			having sum(`Sales Qty`) >= 2
		) as trans_2_items
	) as 'Transactions with 2 items'
	, round(sum(`Sales Amt`)*0.00003858/count(distinct Invoice),0) as 'ATV'
	, round(sum(`Sales Qty`)/count(distinct Invoice),1) as 'UPT'
from test_assesment
where `Member Account Code` in (
	select `Member Account Code` 
	from test_assesment
	group by `Member Account Code` 
	having sum(`Sales Amt`)*0.00003858 <= 3000
)
; 

-- Câu 2: 
-- 2.1. Liệt kê Top 10 Member Account 
-- Theo Sales Quantity
select `Member Account Code` as 'Member Account'
	, sum(`Sales Qty`) as 'Sales Quantity'
	, round(sum(`Sales Amt`)*0.00003858,0) as 'Sales Amt'
from test_assesment
group by `Member Account Code` 
order by sum(`Sales Qty`) desc
limit 10;

-- Theo Sales Amount
select `Member Account Code` as 'Member Account'
	, round(sum(`Sales Amt`)*0.00003858,0) as 'Sales Amt'
	, sum(`Sales Qty`) as 'Sales Quantity'
from test_assesment
group by `Member Account Code` 
order by sum(`Sales Amt`) desc
limit 10;

-- 2.2. Liệt kê Top 10 Items sold theo Sales Quantity & Sales Amount
-- Theo Sales Quantity
select `Item Name` as 'Item Name'
	, sum(`Sales Qty`) as 'Sales Quantity'
	, round(sum(`Sales Amt`)*0.00003858,0) as 'Sales Amt'
from test_assesment
group by `Item Name` 
order by sum(`Sales Qty`) desc
limit 10;

-- Theo Sales Amount
select `Item Name` as 'Item Name'
	, round(sum(`Sales Amt`)*0.00003858,0) as 'Sales Amt'
	, sum(`Sales Qty`) as 'Sales Quantity'
from test_assesment
group by `Item Name` 
order by sum(`Sales Amt`) desc
limit 10;



-- 2.3. Phân tích Scheme Name theo Sales Quantity & Sales Amount






