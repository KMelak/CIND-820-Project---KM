#Creating variables for the Loss of time and No loss of time file

ind_sec <- c("Agriculture","Automotive", "Chemicals/Process","Construction", "Education",
             "Electrical",
             "Food",
             "Forestry",
             "Health Care",
             "Manufacturing",
             "Mining",
             "Municipal",
             "Primary Metals",
             "Pulp & Paper",
             "Schedule 2",
             "Services",
             "Transportation",
             "Unknown"
)
claim_loc<-c("Algoma",
             "Brant",
             "Bruce",
             "Chatham-Kent",
             "Cochrane",
             "Dufferin",
             "Durham",
             "Elgin",
             "Essex",
             "Frontenac",
             "Greater Sudbury / Grand Sudbury",
             "Grey",
             "Haldimand-Norfolk",
             "Haliburton",
             "Halton",
             "Hamilton",
             "Hastings",
             "Huron",
             "Kawartha Lakes",
             "Kenora",
             "Lambton",
             "Lanark",
             "Leeds and Grenville",
             "Lennox and Addington",
             "Manitoulin",
             "Middlesex",
             "Muskoka",
             "Niagara",
             "Nipissing",
             "Northumberland",
             "Not Available",
             "Ottawa",
             "Outside Ontario",
             "Oxford",
             "Parry Sound",
             "Peel",
             "Perth",
             "Peterborough",
             "Prescott and Russell",
             "Prince Edward",
             "Rainy River",
             "Renfrew",
             "Simcoe",
             "Stormont, Dundas and Glengarry",
             "Sudbury",
             "Thunder Bay",
             "Timiskaming",
             "Toronto",
             "Waterloo",
             "Wellington",
             "York",
             "Ontario Navigation Waters"
)
year <- c(2015,2016,20017,2018,2019)
age_range<-c("15-19",
             "20-24",
             "25-29",
             "30-34",
             "35-39",
             "40-44",
             "45-49",
             "55-59",
             "50-54",
             "60-64",
             "65+",
            "Not Available"
)
as.factor(year)
as.factor(age_range)
as.factor(claim_loc)
as.factor(ind_sec)

length(year)*length(claim_loc)*length(ind_sec)

ages<- rep(age_range,4680)

head(ages,20)
