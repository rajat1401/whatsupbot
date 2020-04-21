# source('/home/rajat/nilakshi_app/wind_functions.R') 
#don't source the file!
library(plumber)
library(jpeg)
library(jsonlite)
library(httr)
library(RCurl)
library(png)
library(rjson)
library(tidyverse)
library(ggplot2)
library(dplyr)


#' @apiTitle Run predictions for Wind Speeds using Linear Models
#' @apiDescription This API takes as input height and returns a prediction 
#' for the wind speeds at that height. 


#' @post /reply
#' @serializer contentType list(type='image/jpeg')
#' @response 200 returns the wind speed prediction from the model
get_reply <- function(app, timestamp, version, type, payload, res){
  print ("Working")
  print (app)
  print (payload$source)
  # print (payload$payload)
  if(payload$type== "text"){
    res$body <- payload$payload$text
    return (res)
  }else if(payload$type== "image"){
    print("Working2")
    return (httr::content(GET(payload$payload$url)))
  }else if(payload$type== "audio"){
    print("Working3")
    return (httr::content(GET(payload$payload$url)))
  }
  # else if(payload$type== "audio"){
  #   res$body <- payload$payload$url
  # }else if(payload$type== "image"){
  #   # download.file(payload$payload$url,'y.jpg', mode = 'wb')
  #   get_image_reply(payload, res)
  # }else if(payload$type== "file"){
  #   res$body <- payload$url
  # }
}

