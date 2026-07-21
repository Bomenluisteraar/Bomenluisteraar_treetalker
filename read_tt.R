## Function to read data from TreeTalker
## Function from https://github.com/jpkabala96/ttprocessing/blob/main/R/readTTData.R results in an empty data.frame
## that function uses different columnt

read_tt <- function(data_id="", con_type="IoT", time_zone="Europe/Amsterdam") {
  if (con_type=="IoT") {
    data_location <- paste0("http://nature4cloud.org:5002/nbiot_ap/TTCyber/", data_id, "/ttcloud.txt")
  } else if(con_type=="Lora") {
    data_location <- paste0("http://nature4cloud.org:5001/downloads/TTCyber/", data_location, "/data.txt")
  }
  data_tt <- read.csv(data_location, sep = ";", header = FALSE)
  data_tt$V1 <- dmy_hms(data_tt$V1, tz=time_zone)
  data_tt
}
