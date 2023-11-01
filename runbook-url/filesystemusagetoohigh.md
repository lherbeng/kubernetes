## FileSystemUsageTooHigh

**Meaning:**

The metric checks if the percentage of free space available on the /dev/mapper/vg_data-rke2 filesystem is less than 15%.

**Impact:**

If the filesystem usage is above 85%, it indicates that the disk space is almost full, which can lead to performance degradation or application failure.

**Diagnosis**

- Check the current disk usage on the specified filesystem.

df -h /dev/mapper/vg_data-rke2

- Identify large files or directories consuming significant disk space.

du -sh /path/to/directory/*

- Identify any rapidly growing log files or unexpected file creations.

find /var/log -type f -size +100M

**Other things to check:**

- Verify if there are any unnecessary or temporary files that can be removed.

To find large files that can be removed:

find /path/to/directory -type f -size +100M

To find and remove temporary files:

find /path/to/directory -type f -name "*.tmp" -exec rm -f {} \;


- Check if there are any old or unused data that can be archived or deleted.

To identify old files and directories:

find /path/to/directory -type f -mtime +30

To archive old data:

tar -cvzf archive_name.tar.gz /path/to/directory

- Investigate any processes that might be generating excessive log output or data.

To check the processes generating the most disk writes:

sudo iotop

To monitor log file changes in real-time:

tail -f /var/log/syslog

To identify the top processes consuming CPU and memory:

top

Make sure to replace /path/to/directory with the actual path where you want to perform the file operations and investigate log files and processes. Adjust the parameters according to your system's needs and configurations.

**Mitigation:**

- Remove any unnecessary files or directories that are consuming a significant amount of disk space.
- Archive or delete old data that is no longer required for immediate access.
- Implement log rotation to prevent log files from growing indefinitely.
- Increase the disk size if the system frequently reaches high disk usage levels.



