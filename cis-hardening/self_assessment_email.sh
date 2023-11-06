#!/bin/bash

{

# 1.1 Master Node Configuration Files

echo "1.1.1 Ensure that the API server pod specification file permissions are set to 644 or more restrictive (Automated)" >> "self-assessment_failed_$(hostname).txt"

permission=$(stat -c %a /var/lib/rancher/rke2/agent/pod-manifests/kube-apiserver.yaml)
if [ "$permission" != "644" ]; then
    echo "Current permission: $permission. Result: Fail" >> "self-assessment_failed_$(hostname).txt"
elif [ "$permission" = "644" ]; then
    echo "Current permission: $permission. Result: Pass"
fi

echo

echo "1.1.2 Ensure that the API server pod specification file ownership is set to root:root (Automated)" >> "self-assessment_failed_$(hostname).txt"
ownership=$(stat -c %U:%G /var/lib/rancher/rke2/agent/pod-manifests/kube-apiserver.yaml)
if [ "$ownership" != "root:root" ]; then
    echo "Current ownership: $ownership. Result: Fail" >> "self-assessment_failed_$(hostname).txt"
elif [ "$ownership" = "root:root" ]; then
    echo "Current ownership: $ownership. Result: Pass"
fi

} >> "self-assessment_summary_$(hostname).txt" 2>&1

grep "Fail" "self-assessment_summary_$(hostname).txt" >> "self-assessment_failed_$(hostname).txt"

if [ ! -d "/d3/data01/cishardening" ]; then
    mkdir -p "/d3/data01/cishardening"
fi

mv "self-assessment_summary_$(hostname).txt" "/d3/data01/cishardening/"
mv "self-assessment_failed_$(hostname).txt" "/d3/data01/cishardening/"



---

#!/bin/bash

# Create a list of all .txt files
cd /d3/data01/cishardening/
attachments=""

for file in *txt; do
    attachments+=" -a $file"
done

# Send email with all attachments
recipient="recipient@example.com"
subject="Self-Assessment Summary"
body="See attached files."

echo -e "$body" | mailx -s "$subject" $attachments $recipient

# Delete files in the directory
rm -f /d3/data01/cishardening/*.txt
