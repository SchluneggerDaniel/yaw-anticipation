library(dplyr)
library(readr)

yaw <- read_csv(file = "data/dataDaniel.csv", col_types = cols(X1 = col_skip()))

names(yaw) <- c("trialno", "rt", "response", "intensity", "accuracy", "id")

yaw <- within(yaw, {
    # recode so that left responses are coded as 1, right responses are 0
    response <- ifelse(response == 1, 0, 1)
    id <- as.factor(id)
    logrt <- log(rt)
})

# write_csv(x = yaw, path = "data/yaw-anticipation.csv")

