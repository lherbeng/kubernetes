if [ ! -d "/d3/data01/cishardening" ]; then
    mkdir -p /d3/data01/cishardening
fi

- if [ ! -d "/d3/data01/cishardening" ]; then:
- if starts the conditional statement.
- [ is a command that evaluates the conditional expression inside.
- ! is a logical operator that negates the following expression.
- -d is a flag used to check if the following directory exists.
- "/d3/data01/cishardening" is the path of the directory being checked.
- ] closes the conditional expression.
- ; then indicates the start of the code to execute if the condition is true.
- mkdir -p /d3/data01/cishardening:

- mkdir is a command used to create a new directory.
- -p is a flag that enables the command to create parent directories if they do not already exist.
- /d3/data01/cishardening is the path of the directory to be created.

- In summary, this code snippet checks if the directory /d3/data01/cishardening does not exist. If it does not exist, it creates the directory using the mkdir -p command. The -p flag ensures that any necessary parent directories are also created if they do not exist.

---

# Send all files in a single email
recipient="recipient@example.com"
subject="Self-Assessment Summary"
body=""

for file in self-assessment_summary_*.txt self-assessment_failed_*.txt; do
    body+="Content of $file:\n"
    body+="$(cat $file)\n\n"
done

echo -e "$body" | mail -s "$subject" "$recipient"


for file in self-assessment_summary_*.txt self-assessment_failed_*.txt; do: This initiates a loop that iterates over all the matched files with names starting with self-assessment_summary_ and self-assessment_failed_ and ending with .txt.

body+="Content of $file:\n": This line appends a string to the body variable, specifying the content label for the current file.

body+="$(cat $file)\n\n": This line appends the actual content of the file to the body variable using the cat command, which reads the file and outputs its content. The \n\n at the end of the line adds an extra line break for better readability between file contents.

The loop essentially collects the content of each matched file and concatenates it to the body variable, creating a single string that contains all the file contents to be sent in the email.


