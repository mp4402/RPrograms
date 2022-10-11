library(plumber)
library(dplyr)
library(lubridate)
library(rjson)

data <- read.csv("s&p.csv")
data$Fecha <- dmy(data$Fecha)
users <- data.frame(
  uid=c(12,13),
  username=c("kim", "john")
)

fit <- readRDS("modelo_final.rds")

#* Log some information about the incoming request
#* @filter logger
function(req){
  if(length(req$args) > 0){
    date_time <- Sys.time()
    folder <- lubridate::year(date_time)
    path_original <- "C:/Users/mepg1/Documents/GitHub/RPrograms/DataProduct2022/DataProduct/plumber/laboratorioPlumber"
    path <- paste0(path_original,"/titanic")
    
    if (file.exists(paste0(path,"/year=",folder))) {
      path <- paste(path,"/year=",folder,sep = "")
    } else {
      dir.create(paste0(path,"/year=",folder))
      path <- paste(path,"/year=",folder,sep = "")
    }
    setwd(path)
    folder <- lubridate::month(date_time)
    
    if (file.exists(paste0(path,"/month=",folder))) {
      path <- paste(path,"/month=",folder,sep = "")
    } else {
      dir.create(paste0(path,"/month=",folder))
      path <- paste(path,"/month=",folder,sep = "")
    }
    setwd(path)
    folder <- lubridate::day(date_time)
    
    if (file.exists(paste0(path,"/day=",folder))) {
      path <- paste(path,"/day=",folder,sep = "")
    } else {
      dir.create(paste0(path,"/day=",folder))
      path <- paste(path,"/day=",folder,sep = "")
    }
    setwd(path)
    folder <- lubridate::hour(date_time)
    
    if (file.exists(paste0(path,"/hour=",folder))) {
      path <- paste(path,"/hour=",folder,sep = "")
    } else {
      dir.create(paste0(path,"/hour=",folder))
      path <- paste(path,"/hour=",folder,sep = "")
    }
    setwd(path)
    nombreArchivo <- paste0(year(date_time),month(date_time),day(date_time),hour(date_time),minute(date_time))
    
    ListJSON <- toJSON(list('req'=req$args, 'query'=req$QUERY_STRING, 'user_agent'=req$HTTP_USER_AGENT))
    write(ListJSON, paste0(nombreArchivo,".json"))
    setwd(path_original)
    plumber::forward()
    
  }else{
    path_original <- "C:/Users/mepg1/Documents/GitHub/RPrograms/DataProduct2022/DataProduct/plumber/laboratorioPlumber"
    setwd(path_original)
    plumber::forward()
  }
  
}


#* Prediccion de sorevivencia de un pasajero
#* @param Pclass clase en el que viajabe el pasajero
#* @param Sex Sexo del pasajero
#* @param Age edad del pasajero
#* @param SibSp numero de hermanos
#* @param Parch numero de parientes
#* @param Fare precio del boleto
#* @param Embarked puerto del que embarco
#* @post /titanic

function(Pclass, Sex, Age, SibSp, Parch, Fare, Embarked){
  features <- data_frame(Pclass = as.integer(Pclass),
                         Sex,
                         Age=as.integer(Age),
                         SibSp= as.integer(SibSp),
                         Parch = as.integer(Parch),
                         Fare = as.numeric(Fare),
                         Embarked)
  
  out <- predict(fit,features,type = "class")
  as.character(out)
}


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

#* @get /user/<numero:int>
function(numero){
  list(
    id = numero,
    type = typeof(numero)
  )
}

#* @get /user/<valor:double>
function(valor){
  list(
    id = valor,
    type = typeof(valor)
  )
}

#* @get /user/<respuesta:bool>
function(respuesta){
  list(
    id = respuesta,
    type = typeof(respuesta)
  )
}