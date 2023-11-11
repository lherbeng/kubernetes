#!/bin/bash

# Define the current hostname
current_hostname=$(hostname)

# Define the subject variable based on the current hostname
if [ "$current_hostname" == "hostnameA" ]; then
    subject_variable="SANDBOX"
elif [ "$current_hostname" == "hostnameB" ]; then
    subject_variable="DEV"
elif [ "$current_hostname" == "hostnameC" ]; then
    subject_variable="TST"
elif [ "$current_hostname" == "hostnameD" ]; then
    subject_variable="PROD"
else
    # Default subject variable if the current hostname doesn't match predefined ones
    subject_variable="UNKNOWN"
fi

# Function to send email for a specific hostname
send_email() {
    hostname=$1
    recipient="recipient@example.com"  # Replace with the actual recipient email address
    if [ "$hostname" == "$current_hostname" ]; then
        subject="Self-Assessment Summary for $subject_variable"
        body="See attached files for the self-assessment summary of $subject_variable."
    else
        subject="Self-Assessment Summary for $hostname"
        body="See attached files for the self-assessment summary of $hostname."
    fi

    # Create a list of all .txt files
    cd /d3/data01/cishardening/ || exit
    attachments=""

    for file in *.txt; do
        attachments+=" -a $file"
    done

    # Send email with all attachments
    echo -e "$body" | mailx -s "$subject" $attachments $recipient

    # Delete files in the directory
    rm -f /d3/data01/cishardening/*.txt
}

# Check if the current hostname matches the predefined hostname and send the email
if [ "$current_hostname" == "hostnameA" ] || [ "$current_hostname" == "hostnameB" ] || [ "$current_hostname" == "hostnameC" ] || [ "$current_hostname" == "hostnameD" ]; then
    send_email "$current_hostname"
else
    echo "Current hostname not found in the predefined hostnames."
fi
