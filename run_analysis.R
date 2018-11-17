library(dplyr)

# read variables names
names <- read.table('data/features.txt',header = FALSE)
names <- names$V2

# remove () and replace - by _
names <- gsub(pattern = '\\(\\)', '', names)
names <- gsub(pattern = '-', '_', names)
names <- gsub(pattern = ',', '_', names)

# read test data set
test_data <- read.table('data/test/X_test.txt', col.names = names)

# read training data set
train_data <- read.table('data/train/X_train.txt', col.names = names)

# combine both in one data set
all_data <- rbind(test_data, train_data)

# select only the mean and std variables
mean_std_names <- names[grepl("(*_mean|*_std)", names) & !grepl("meanFreq", names)]
mean_std_data <- all_data[,mean_std_names]

# read labels
test_labels_num <- read.table("data/test/y_test.txt", col.names = c("label"))
train_labels_num <- read.table("data/train/y_train.txt", col.names = c("label"))
all_labels_num <- rbind(test_labels_num, train_labels_num)

# read label names
label_names <- read.table("data/activity_labels.txt", col.names = c("label", "label_name"))
all_label_names <- lapply(all_labels_num, 
                          function(x) label_names$label_name[match(x, label_names$label)])
names(all_label_names) <- "activity"

# read subjects
test_subjects <- read.table("data/test/subject_test.txt", col.names = c("subject"))
train_subjects <- read.table("data/train/subject_train.txt", col.names = c("subject"))
all_subjects <- rbind(test_subjects, train_subjects)

# add to data set
mean_std_data <- cbind(all_subjects, all_label_names, mean_std_data)

# create new data set with average for each variable
means_data <- mean_std_data %>% 
        group_by(subject, activity) %>%
        summarise_all(mean)


write.table(means_data, file = 'result.txt', row.names = FALSE)