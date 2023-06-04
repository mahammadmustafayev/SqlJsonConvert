select * from Students

-- for xml convert

Select Id,
       [Name] as 'name.FirtsName',
	   Surname as 'name.LastName',
	   Age  
from Students
For Json Path

--output xml file convert to json 

-- json to table 
DECLARE @json nvarchar(1000)
Select @json =

N'{
"Students":[
  {
    "Id": 1,
    "name": {
      "FirtsName": "Tural",
      "LastName": "Aydınlı"
    },
    "Age": 21
  },
  {
    "Id": 2,
    "name": {
      "FirtsName": "Elsever",
      "LastName": "Xanaliyev"
    },
    "Age": 22
  },
  {
    "Id": 3,
    "name": {
      "FirtsName": "Cefer",
      "LastName": "Cabbarli"
    },
    "Age": 130
  },
  {
    "Id": 5,
    "name": {
      "FirtsName": "Əlixan",
      "LastName": "Rəcəbov"
    },
    "Age": 34
  },
  {
    "Id": 6,
    "name": {
      "FirtsName": "Nizami",
      "LastName": "Gencevi"
    },
    "Age": 17
  },
  {
    "Id": 7,
    "name": {
      "FirtsName": "Imadeddin",
      "LastName": "Nesimi"
    },
    "Age": 23
  }
]
} '
select *
from openjson(@json,'$.Students')
with(
    Id int,
	FirstName nvarchar(50) '$.name.FirstName',
	LastName nvarchar(150) '$.name.LastName',
	Age int

) as Students

-- json table end