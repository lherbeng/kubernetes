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

https://ranchermanager.docs.rancher.com/reference-guides/rancher-security/hardening-guides/rke2-hardening-guide/rke2-self-assessment-guide-with-cis-v1.23-k8s-v1.23

---

if [ ! -d "/d3/data01/cishardening" ]; then
    # If /d3/data01/ directory doesn't exist, check /d1/data01/ and create the directory
    if [ -d "/d1/data01/" ]; then
        mkdir -p /d1/data01/cishardening
        echo "Created /d1/data01/cishardening directory."
    else
        echo "Error: /d1/data01/ directory not found."
        exit 1
    fi
else
    echo "/d3/data01/cishardening directory already exists."
fi

# If /d3/data01/ directory exists, or if /d1/data01/ directory doesn't exist
# (because we've already checked /d3/data01/ above), create the directory in /d3/data01/
if [ ! -d "/d1/data01/cishardening" ]; then
    mkdir -p /d3/data01/cishardening
    echo "Created /d3/data01/cishardening directory."
else
    echo "/d1/data01/cishardening directory already exists."
fi

# Rest of your script...

# Copy assessment results to the correct directory
if [ -d "/d3/data01/cishardening/" ]; then
    # If /d3/data01/ directory exists, copy the results to /d3/data01/cishardening/
    cp "self-assessment_summary_$current_hostname.txt" /d3/data01/cishardening
    cp "self-assessment_failed_$current_hostname.txt" /d3/data01/cishardening
    echo "Copied assessment results to /d3/data01/cishardening/ directory."
elif [ -d "/d1/data01/cishardening/" ]; then
    # If /d1/data01/ directory exists, copy the results to /d1/data01/cishardening/
    cp "self-assessment_summary_$current_hostname.txt" /d1/data01/cishardening
    cp "self-assessment_failed_$current_hostname.txt" /d1/data01/cishardening
    echo "Copied assessment results to /d1/data01/cishardening/ directory."
else
    echo "Error: Neither /d3/data01/cishardening/ nor /d1/data01/cishardening/ directory found."
    exit 1
fi

---

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

    # List .txt files in both directories
    attachments=""
    
    # Check /d3/data01/cishardening/
    if [ -d "/d3/data01/cishardening/" ]; then
        cd /d3/data01/cishardening/ || exit
        for file in *.txt; do
            attachments+=" -a $file"
        done
    fi

    # Check /d1/data01/cishardening/
    if [ -d "/d1/data01/cishardening/" ]; then
        cd /d1/data01/cishardening/ || exit
        for file in *.txt; do
            attachments+=" -a $file"
        done
    fi

    # Send email with all attachments
    echo -e "$body" | mailx -s "$subject" $attachments $recipient
}

# Check if the current hostname matches the predefined hostname and send the email
if [ "$current_hostname" == "hostnameA" ] || [ "$current_hostname" == "hostnameB" ] || [ "$current_hostname" == "hostnameC" ] || [ "$current_hostname" == "hostnameD" ]; then
    send_email "$current_hostname"
else
    echo "Current hostname not found in the predefined hostnames."
fi

---

# Delete files in the directories
    if [ -d "/d3/data01/cishardening/" ]; then
        rm -f /d3/data01/cishardening/*.txt
        echo "Deleted files in /d3/data01/cishardening/ directory."
    fi

    if [ -d "/d1/data01/cishardening/" ]; then
        rm -f /d1/data01/cishardening/*.txt
        echo "Deleted files in /d1/data01/cishardening/ directory."
    fi
