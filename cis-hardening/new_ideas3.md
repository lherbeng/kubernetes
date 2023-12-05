#!/bin/bash

# Define the current hostname
current_hostname=$(hostname)

# Function to send email for a specific hostname
send_email() {
    recipient="recipient@example.com"  # Replace with the actual recipient email address
    subject="Self-Assessment Summary for $subject_variable"
    body="See attached files for the self-assessment summary of $subject_variable."

    # Check for .txt files in both directories
    for directory in "/d3/data01/cishardening/" "/d1/data01/cishardening/"; do
        if [ -d "$directory" ]; then
            cd "$directory" || exit
            attachments=(*.txt)

            if [ ${#attachments[@]} -gt 0 ]; then
                # Send email with all attachments
                echo -e "$body" | mailx -s "$subject" -a "${attachments[@]}" $recipient

                # Delete files in the directory
                rm -f *.txt
                echo "Deleted files in $directory directory."
            else
                echo "Error: No .txt files found in $directory."
            fi
        fi
    done
}

# Function to check if the current hostname matches a pattern
match_pattern() {
    pattern=$1
    [[ "$current_hostname" =~ $pattern ]]
}

# Check if the current hostname matches the predefined hostname patterns and send the email
if match_pattern "^hostnameA$"; then
    subject_variable="SANDBOX"
    send_email
elif match_pattern "^hostname[BEF]$"; then
    subject_variable="DEV"
    send_email
elif match_pattern "^hostnameC$"; then
    subject_variable="TST"
    send_email
elif match_pattern "^hostname[DG]$"; then
    subject_variable="PROD"
    send_email
else
    echo "Current hostname not found in the predefined hostnames."
fi
