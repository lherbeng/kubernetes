# Replace $value with the actual numerical value
value = 0.75  # Example numerical value

# Debugging statement to check the value of value
print("Debug: value =", value)

# Then format and display value
formatted_value = "%.2f" % value
print("Formatted value:", formatted_value)


I asked Arden of the UNIX team if there was a way to obtain the breakdown of the highest RAM usage per node, but he responded that he only used the TOP command and that there was no way to determine historically which processes consumed the most memory. He also used SAR to look at the RAM's utilization history, but he didn't find any instances of excessive memory usage. We need to email UNIX or make a request ticket with justification regarding the increasing memory. Additionally, he said that the server shouldn't have any performance issues as long as there is memory available, even though there isn't any free memory listed in the command free -hm. Additionally, he provided sar. 

I haven't reached out to Rishu Raj since I am not sure yet if the Lacework proccess is the culprit as I am still invetigating the issue.

The load average on the DEV server increased to 2.41 while I was monitoring it, but when I examined the memory, everything appeared to be in order. I didn't have any problems using Grafana. During the rise in load average, I also tried to use the ps command to display the top processes by memory consumption. Please refer to the sar file that is attached. 

While keeping an eye on the DEV server, I tried to evaluate various metrics and make some changes to the Metrics and Alert.

