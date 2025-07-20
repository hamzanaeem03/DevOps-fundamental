Assignment
Question 1: Log File Analyzer
Create a bash script that analyzes a log file for errors and warnings. The script should:

Take a log file path as an argument Count the number of ERROR, WARNING, and INFO messages Display the 5 most common error messages with their occurrence count Generate a summary report with timestamps of the first and last errors

Example Output
$ ./log_analyzer.sh /var/log/application.log

===== LOG FILE ANALYSIS REPORT =====
File: /var/log/application.log
Analyzed on: Fri Jul 12 14:32:15 EDT 2025
Size: 15.4MB (16,128,547 bytes)

MESSAGE COUNTS:
ERROR: 328 messages
WARNING: 1,253 messages
INFO: 8,792 messages

TOP 5 ERROR MESSAGES:
 182 - Database connection failed: timeout
  56 - Invalid authentication token provided
  43 - Failed to write to disk: Permission denied
  29 - API rate limit exceeded
  18 - Uncaught exception: Null pointer reference

ERROR TIMELINE:
First error: [2025-07-10 02:14:32] Database connection failed: timeout
Last error:  [2025-07-12 14:03:27] Failed to write to disk: Permission denied

Error frequency by hour:
00-04: ███████ (72)
04-08: ██ (23)
08-12: ████████████ (120)
12-16: ██████ (63)
16-20: ███ (34)
20-24: ████ (16)

Report saved to: log_analysis_20250712_143215.txt
Question 2 : System Health Monitor Dashboard
Create an interactive bash script that provides a real-time system health monitoring dashboard in the terminal. The script should:

Display system metrics (CPU, memory, disk, network) that refresh every 3 seconds
Use ASCII/ANSI characters to create visual graphs or bars representing usage percentages
Include color coding (green/yellow/red) to indicate normal/warning/critical status levels
Log any detected anomalies (spike in CPU, memory pressure, disk filling up) to a separate file
Provide keyboard shortcuts to perform basic actions (change refresh rate, filter information, exit)
╔════════════ SYSTEM HEALTH MONITOR v1.0 ════════════╗  [R]efresh rate: 3s
║ Hostname: webserver-prod1          Date: 2025-07-12 ║  [F]ilter: All
║ Uptime: 43 days, 7 hours, 13 minutes               ║  [Q]uit
╚═══════════════════════════════════════════════════════════════════════╝

CPU USAGE: 67% ██████████████████████████████░░░░░░░░░░░░░ [WARNING]
  Process: mongod (22%), nginx (18%), node (15%)

MEMORY: 5.8GB/8GB (73%) █████████████████████████████░░░░░ [WARNING]
  Free: 2.2GB | Cache: 2.7GB | Buffers: 0.5GB

DISK USAGE:
  /        : 76% ███████████████████████████████░░░░ [WARNING]
  /var/log : 42% █████████████████░░░░░░░░░░░░░░░░░░ [OK]
  /home    : 28% ███████████░░░░░░░░░░░░░░░░░░░░░░░░ [OK]

NETWORK:
  eth0 (in) : 18.2 MB/s ███████░░░░░░░░░░░░░░░░░░░░░ [OK]
  eth0 (out): 4.5 MB/s  ██░░░░░░░░░░░░░░░░░░░░░░░░░░ [OK]

LOAD AVERAGE: 2.34, 2.15, 1.98

RECENT ALERTS:
[14:25:12] CPU usage exceeded 80% (83%)
[14:02:37] Memory usage exceeded 75% (78%)
[13:46:15] Disk usage on / exceeded 75% (76%)

Press 'h' for help, 'q' to quit