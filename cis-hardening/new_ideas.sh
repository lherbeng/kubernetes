To achieve the desired functionality, you can modify the Jenkinsfile script to include conditional logic and ensure that the `cis1.23_self_assessment_email.sh` script only runs on `hostnameA` after the `cis1.23_self_assessment.sh` script has finished running on the three nodes. Here is an example of how you can modify the script:

```groovy
def runAssessmentScript = {
    sh """
        sed -i 's/HostameParam/${params.Hostname}/' `pwd`/infra/scripts/cis1.23_self_assessment.sh
    """
}

def runEmailScript = {
    sh """
        sed -i 's/HostameParam/${params.Hostname}/' `pwd`/infra/scripts/cis1.23_self_assessment_email.sh
    """
}

// Function to wait for a job to finish on all nodes
def waitForJobToFinish() {
    // Implementation to check if the job has finished on three nodes
    // Replace the following line with the implementation for checking job completion
    def isJobFinishedOnThreeNodes = false

    while (!isJobFinishedOnThreeNodes) {
        // Add a sleep to avoid continuous polling and reduce load
        sleep 60 // Adjust the time interval as needed
        // Check if the job is finished on three nodes
        isJobFinishedOnThreeNodes = checkIfJobFinishedOnThreeNodes() // Function to be implemented
    }
}

if (params.Hostname != "") {
    runAssessmentScript()

    // Wait for the assessment script to finish on three nodes
    waitForJobToFinish()

    if (params.Hostname == "hostnameA") {
        runEmailScript()
    }
}
```

In this modified script, `runAssessmentScript` and `runEmailScript` are defined as separate functions. The `waitForJobToFinish` function is used to ensure that the `cis1.23_self_assessment.sh` script finishes running on all nodes before executing the `cis1.23_self_assessment_email.sh` script on `hostnameA` only. You will need to implement the `checkIfJobFinishedOnThreeNodes` function to check if the job has finished running on three nodes. Adjust the time interval in the `sleep` statement as needed.
