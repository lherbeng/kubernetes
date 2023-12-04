#!/bin/bash

# Define the current hostname
current_hostname=$(hostname)

# Define the subject variable based on the current hostname
if [ "$current_hostname" == "hostnameA" ]; then
    subject_variable="SANDBOX"
elif [ "$current_hostname" == "hostnameB" ] || [ "$current_hostname" == "hostnameE" ] || [ "$current_hostname" == "hostnameF" ]; then
    subject_variable="DEV"
elif [ "$current_hostname" == "hostnameC" ]; then
    subject_variable="TST"
elif [ "$current_hostname" == "hostnameD" ] || [ "$current_hostname" == "hostnameG" ]; then
    subject_variable="PROD"
else
    # Default subject variable if the current hostname doesn't match predefined ones
    subject_variable="UNKNOWN"
fi

# Function to send email for a specific hostname
send_email() {
    recipient="recipient@example.com"  # Replace with the actual recipient email address
    subject="Self-Assessment Summary for $subject_variable"
    body="See attached files for the self-assessment summary of $subject_variable."

    # Check for .txt files in both directories
    attachments=""

    for directory in "/d3/data01/cishardening/" "/d1/data01/cishardening/"; do
        if [ -d "$directory" ]; then
            cd "$directory" || exit
            for file in *.txt; do
                attachments+=" -a $file"
            done
            break  # Stop checking directories once we find the first one with .txt files
        fi
    done

    if [ -n "$attachments" ]; then
        # Send email with all attachments
        echo -e "$body" | mailx -s "$subject" $attachments $recipient

        # Delete files in the directory
        rm -f "$directory"/*.txt
        echo "Deleted files in $directory directory."
    else
        echo "Error: No .txt files found in the specified directories."
        exit 1
    fi
}

# Check if the current hostname matches the predefined hostname and send the email
if [ "$current_hostname" == "hostnameA" ] || [ "$current_hostname" == "hostnameB" ] || [ "$current_hostname" == "hostnameC" ] || [ "$current_hostname" == "hostnameD" ] || [ "$current_hostname" == "hostnameE" ] || [ "$current_hostname" == "hostnameF" ] || [ "$current_hostname" == "hostnameG" ]; then
    send_email
else
    echo "Current hostname not found in the predefined hostnames."
fi
