## LogTrack-Analyzer

A Linux-based automated log analysis &amp; alerting system built for AWS EC2

---
### Overview

**LogTrack** is a Bash-based automation system that analyzes system logs on Amazon Linux EC2 instances. It detects SSH login failures, sudo misuse, disk warnings & system errors, then generates daily reports & alerts.

---
### Features

- SSH failed login detection  
- Sudo usage logs  
- System error monitoring  
- Disk space overview  
- Daily automation via `cron`  
- Alert log file generation

---
### Directory Structure
```
/opt/logtrack/
│
├── log_analysis.sh           # Main Script
└── /var/log/logtrack/        # Output
    ├── daily_report_YYYY-MM-DD.txt
    └── critical_YYYY-MM-DD.log
```
---
### Developed By
Ananya Nimbalkar
Final Year BCA Student
