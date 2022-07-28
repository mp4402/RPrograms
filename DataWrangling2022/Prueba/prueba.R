string <- "una cadena de texto"
class(string)
length(string)
nchar(string)
#En R la cuenta empieza en 1, no en 0

num <- 1
integ <- 2L
class(num)
class(integ)

logical <- FALSE
class(logical)

x<- c(1,2,3)
class(x)

sample(x=1:5,size=8, replace = TRUE)

factor_1 <- c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun", "Wed", "Thu", "Fri", "Sat", "Sun", "Wed", "Thu", "Wed", "Thu")
factor(factor_1)

factor_2 <- ordered(factor_1, levels = c("Mon", "Tue", "Wed","Thu","Fri","Sat","Sun"))
factor(factor_2)

as.numeric(factor_2)


vector1 <- c(1,2,3,4,5)
vector2 <- c(FALSE,TRUE,FALSE)
vector3 <- c("a","b","c")
vector4 <- c("a",1,"v")
class(vector1)
class(vector2)
class(vector3)
class(vector4)
list_1 <- list(vector1, vector2, vector3)
list_1
list_1[[2]]
list_1[[3]]  
names(list_1)
names(list_1) <- c("Numeric","Logical","Character")
list_1$Numeric

df <- data.frame(
  col1 = c("This","is","a","vector","of","strings"),
  col2 = 1:6,
  col3 = letters[1:6],
  stringsAsFactors = FALSE
)
str(df)
rbind(df, c("new_string",19,"z"))
