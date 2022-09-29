library(plumber)
library(dplyr)
library(lubridate)

data <- read.csv("s&p.csv")
data$Fecha <- dmy(data$Fecha)
susers <- data.frame(
  uid=c(12,13),
  username=c("kim", "john")
)

#* Lookup a user
#* @get /users/<id>
function(id){
  subset(users, uid %in% id)
}

#* @get /user/<from>/connect/<to>
function(from, to){
  from <- ymd(as.character(from))
  to <- ymd(as.character(to))
  print(data %>%
          filter(Fecha >= from & Fecha <= to))
}


#* @get /type/<id>
function(id){
  list(
    id = id,
    type = typeof(id)
  )
}

#* @get /user/<id:int>
function(id){
  list(
    id = id,
    type = typeof(id)
  )
}

#* @post /user/activated/<active:bool>
function(active){
  if (!active){
    
  }
}