library(rjson)
library(httr)

# CONFIG

DEVELOPER_ACCESS_TOKEN <- "YOUR DEVELOPER ACCESS TOKEN"
CLIENT_ACCESS_TOKEN <- "YOUR CLIENT ACCESS TOKEN"
BASE_URL <- "https://api.api.ai/v1/"
PREFIXES <- "?v=20150910"
SUFFIXES <- "&lang=en&sessionId=1234567890"

httpheader <- c(Accept="application/json; charset=UTF-8", "Content-Type"="application/json")

# Location of JSON DATA File

intents_json <- "YOUR JSON FILE"

# GET INTENTS


url1 <- paste(BASE_URL, "intents", sep="")
url2 <- paste(BASE_URL, "userEntities", sep="")
url <- paste(url1, PREFIXES, sep="")
dst_url <- paste(url2, PREFIXES, sep="")

developer_token <- paste("bearer", DEVELOPER_ACCESS_TOKEN, sep=" ")
client_token <- paste("bearer", CLIENT_ACCESS_TOKEN, sep=" ")

req <- httr::GET(url, httr::add_headers(Authorization = developer_token, httpheader))
json <- httr::content(req, as = "text")
result <- fromJSON(json)
result

# POST INTENT

json_data <- fromJSON(file=intents_json)

data <- POST(url=url, body=toJSON(json_data), multipart=FALSE, httr::add_headers(Authorization = developer_token, httpheader))

data
