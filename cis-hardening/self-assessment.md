
## CIS 1.23 Self-Assessment Guide

**CIS Kubernetes Benchmark v1.23 - RKE2**

**Overview**

This document serves as a companion to the RKE2 security hardening guide, offering prescriptive recommendations for securing a production RKE2 installation. The benchmark guide is designed to assist RKE2 operators, security teams, auditors, and decision-makers in evaluating the security level of a hardened cluster against each control outlined in the CIS Kubernetes benchmark v1.23.

It is specifically tailored to the v1.25 release line of RKE2 and aligns with the v1.23 release of the CIS Kubernetes Benchmark.

For detailed information about each control, including comprehensive descriptions and remediation steps for failing tests, users can refer to the corresponding section of the CIS Kubernetes Benchmark v1.23, available for download on CISecurity.org.

Testing Controls Methodology
Each control in the CIS Kubernetes Benchmark has been assessed against an RKE2 cluster configured according to the provided hardening guide.

In cases where control audits differ from the original CIS benchmark, specific audit commands for RKE2 are provided for testing.

Possible results for each control include:

Pass: The RKE2 cluster successfully passed the audit outlined in the benchmark.

Not Applicable: The control is deemed not applicable to RKE2 due to its unique design and operational characteristics. The remediation section explains why this is the case.

Manual - Operator Dependent: This designation is applied to controls that are manual in the CIS benchmark, dependent on the cluster's use case or other factors determined by the operator. While RKE2 ensures these controls can be implemented, no further configuration or auditing of the cluster under test has been performed.

---

We created a self-assessment script and it is designed to perform a self-assessment of the security configurations related to the Kubernetes API server on a master node and workernode. It checks specific settings and permissions, and records the results in summary and failed assessment files. Additionally, it checks if the default namespace is used and lists resources in that namespace.

This script seems to complement the self-assessment script from the previous example. The other script is responsible for performing the self-assessment and creating summary and failed assessment files. This script takes those files, sends an email with the assessment summary, and deletes the files afterward. Together, they create a workflow for automated self-assessment and reporting.

This Bash script determines the current hostname and assigns a subject variable based on predefined hostnames. It then sends an email with a self-assessment summary, specific to the current or provided hostname. The script checks if the current hostname matches predefined ones, and if so, triggers an email with attached self-assessment summary files. After sending the email, it deletes the summary files from a specified directory. The script is designed to be part of a system for automated self-assessment and reporting, with a focus on different environments (SANDBOX, DEV, TST, PROD,).
