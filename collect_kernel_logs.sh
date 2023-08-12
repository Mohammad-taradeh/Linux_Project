#!/bin/bash

# Define the directory where logs will be stored
log_dir="/home/mohammad/Desktop/project"

# Get the current date and time
current_datetime=$(date +"%Y-%m-%dT%H-%M")

# Define the log file name
log_file_name="kernel-logs-${current_datetime}.txt"
log_file_path="${log_dir}/${log_file_name}"

# Get kernel logs for the last hour and save to the log file
journalctl -k --since="1 hour ago" > "${log_file_path}"

# Compress the log file
compressed_file_name="kernel-logs-${current_datetime}.tar.bz2"
compressed_file_path="${log_dir}/${compressed_file_name}"
tar -cvjf "${compressed_file_path}" "${log_file_path}"

# Upload the compressed file to Dropbox using dbxcli
dbxcli upload "${compressed_file_path}" "/home/mohammad/Dropbox/Linux project"

# Clean up - remove the original log file
# rm "${log_file_path}"

