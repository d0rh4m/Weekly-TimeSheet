# Weekly-TimeSheet
A script that automatically writes a weekly timesheet detailing the daily work hours for the past week. The timesheet is written in an email and is intended to be scheduled on crontab. 

# Usage
1. The default working hours is 9:30 AM to 6:30 PM. The script only allows hourly addition to the working hours. The start time cannot be changed. 
2. The script is intended to be scheduled on crontab every Wednesday at 9:30 AM. The timesheet therefore assumes the first working day to be the Wednesday of the previous week. The last and fifth day would be one day before the script is intended to run (Tuesday). 
3. The script assumes Sunday and Saturday to be non-working days. Currently, there's no way to add an extra day on the timesheet. 
4. The script prompts user to input overtime hours with a display dialog box. 
5. The script prompts user to input vacation/public holiday days with a display dialog box. 
6. The script prompts user to select the email which he would like to reply to with a display dialog box. 
7. The script launches a new window with the content of the timesheet once it's done. 
