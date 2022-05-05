use university;
#select distinct Lifecyclestageinquiries from lifecycle


select
	contacts.ContactID,
    case when contacts.lifecyclerole like 'Student%' then 1 else 0 end as enrolled,
    case when gender like 'F%' then 'F'
		when gender like 'M%' then 'M'
        else 'Other'
        end as Gender,
	case when State = 'Arizona' then 1 else 0 end Instate,
    avg(education.GPA) as avgGPA
from
	contacts inner join
    education on contacts.contactid = education.contactid
group by
	contacts.contactid
    