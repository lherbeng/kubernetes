#!/bin/bash

# Get the current hostname
current_hostname=$(hostname)

# Function to send email for a specific hostname
send_email() {
hostname=$1
recipient="recipient@example.com"  # Replace with the actual recipient email address
subject="Self-Assessment Summary for $hostname"
body="See attached files for the self-assessment summary of $hostname."

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
if [ "$current_hostname" == "brn0vlappdv098a" ] || [ "$current_hostname" == "brn0vlappdv079a" ] || [ "$current_hostname" == "brn0vlappua079a" ] || [ "$current_hostname" == "gen0vlapp079a" ]; then
    send_email "$current_hostname"
else
    echo "Current hostname not found in the predefined hostnames."
fi
