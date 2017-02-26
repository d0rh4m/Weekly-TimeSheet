-- Default end time component, assuming ending at 6:30 PM

set defaultEndTimeHour to "18"
set defaultEndTimeMinute1 to "30"
set defaultEndTimeMinute2 to "30"
set defaultEndTimeMinute3 to "30"
set defaultEndTimeMinute4 to "30"
set defaultEndTimeMinute5 to "30"
set defaultEndTimeDelimiter1 to ":"
set defaultEndTimeDelimiter2 to ":"
set defaultEndTimeDelimiter3 to ":"
set defaultEndTimeDelimiter4 to ":"
set defaultEndTimeDelimiter5 to ":"

-- Delimeter between start time and end time 

set timeDelimiter1 to "~"
set timeDelimiter2 to "~"
set timeDelimiter3 to "~"
set timeDelimiter4 to "~"
set timeDelimiter5 to "~"

-- Default start time, assuming starting at 9:30 AM

set defaultStartTime1 to "9:30"
set defaultStartTime2 to "9:30"
set defaultStartTime3 to "9:30"
set defaultStartTime4 to "9:30"
set defaultStartTime5 to "9:30"

-- How many hours of overtime for each day, default to 0 hr

set howManyHoursInt1 to 0
set howManyHoursInt2 to 0
set howManyHoursInt3 to 0
set howManyHoursInt4 to 0
set howManyHoursInt5 to 0

-- Getting the date for the first day (Wednesday of last week) until the fifth day (Tuesday of the following week). 
-- Does not take into account Saturday and Sunday and assume time sheet is to be sent on Wednesday of each week 

set day1 to (current date) - 7 * (24 * 60 * 60)
set shortDay1 to short date string of day1

set day2 to (current date) - 6 * (24 * 60 * 60)
set shortDay2 to short date string of day2

set day3 to (current date) - 5 * (24 * 60 * 60)
set shortDay3 to short date string of day3

set day4 to (current date) - 2 * (24 * 60 * 60)
set shortDay4 to short date string of day4

set day5 to (current date) - (24 * 60 * 60)
set shortDay5 to short date string of day5

-- Prompt user for any overtime hours during the week

set didYouDoOVertime to choose from list {"Yes", "No"} with prompt "Did you do overtime this week?" default items "No"

if didYouDoOVertime as string is equal to "Yes" then
	try
		repeat
			set didOvertime to choose from list {"" & shortDay1 & "", "" & shortDay2 & "", "" & shortDay3 & "", "" & shortDay4 & "", "" & shortDay5 & "", "No more"} with prompt "What day did you do overtime on?" default items "& shortDay1 &"
			
			if didOvertime as string is equal to "" & shortDay1 & "" then
				set howManyHours1 to display dialog "How many hours?" default answer 1
				set howManyHoursString1 to text returned of howManyHours1
				set howManyHoursInt1 to howManyHoursString1 as number
			end if
			
			if didOvertime as string is equal to "" & shortDay2 & "" then
				set howManyHours2 to display dialog "How many hours?" default answer 1
				set howManyHoursString2 to text returned of howManyHours2
				set howManyHoursInt2 to howManyHoursString2 as number
			end if
			
			if didOvertime as string is equal to "" & shortDay3 & "" then
				set howManyHours3 to display dialog "How many hours?" default answer 1
				set howManyHoursString3 to text returned of howManyHours3
				set howManyHoursInt3 to howManyHoursString3 as number
			end if
			
			if didOvertime as string is equal to "" & shortDay4 & "" then
				set howManyHours4 to display dialog "How many hours?" default answer 1
				set howManyHoursString4 to text returned of howManyHours4
				set howManyHoursInt4 to howManyHoursString4 as number
			end if
			
			if didOvertime as string is equal to "" & shortDay5 & "" then
				set howManyHours5 to display dialog "How many hours?" default answer 1
				set howManyHoursString5 to text returned of howManyHours5
				set howManyHoursInt5 to howManyHoursString5 as number
			end if
			
			if didOvertime as string is equal to "No more" then exit repeat
		end repeat
	end try
end if

-- setting the final end time after adding up overtime hours 

set finalEndTimeHour1 to defaultEndTimeHour + howManyHoursInt1
set finalEndTimeHour2 to defaultEndTimeHour + howManyHoursInt2
set finalEndTimeHour3 to defaultEndTimeHour + howManyHoursInt3
set finalEndTimeHour4 to defaultEndTimeHour + howManyHoursInt4
set finalEndTimeHour5 to defaultEndTimeHour + howManyHoursInt5

-- Prompt user for any holiday or vacation during the week
-- User input will ovveride the time string with reasoForHoliday 

set wasHolidayOrVacation to choose from list {"Yes", "No"} with prompt "Were you on a holiday this week?" default items "No"

if wasHolidayOrVacation as string is equal to "Yes" then
	try
		repeat
			set HolidayDate to choose from list {"" & shortDay1 & "", "" & shortDay2 & "", "" & shortDay3 & "", "" & shortDay4 & "", "" & shortDay5 & "", "No more"} with prompt "What day was the holiday?" default items "& shortDay1 &"
			
			if HolidayDate as string is equal to "" & shortDay1 & "" then
				set reasonForHoliday to display dialog "Why did you take a day off?" default answer "Vacation"
				set finalEndTimeHour1 to " "
				set defaultEndTimeMinute1 to " "
				set defaultEndTimeDelimiter1 to " "
				set timeDelimiter1 to " "
				set defaultStartTime1 to text returned of reasonForHoliday
			end if
			
			if HolidayDate as string is equal to "" & shortDay2 & "" then
				set reasonForHoliday to display dialog "Why did you take a day off?" default answer "Vacation"
				set finalEndTimeHour2 to " "
				set defaultEndTimeMinute2 to " "
				set defaultEndTimeDelimiter2 to " "
				set timeDelimiter2 to " "
				set defaultStartTime2 to text returned of reasonForHoliday
			end if
			
			if HolidayDate as string is equal to "" & shortDay3 & "" then
				set reasonForHoliday to display dialog "Why did you take a day off?" default answer "Vacation"
				set finalEndTimeHour3 to " "
				set defaultEndTimeMinute3 to " "
				set defaultEndTimeDelimiter3 to " "
				set timeDelimiter3 to " "
				set defaultStartTime3 to text returned of reasonForHoliday
			end if
			
			if HolidayDate as string is equal to "" & shortDay4 & "" then
				set reasonForHoliday to display dialog "Why did you take a day off?" default answer "Vacation"
				set finalEndTimeHour4 to " "
				set defaultEndTimeMinute4 to " "
				set defaultEndTimeDelimiter4 to " "
				set timeDelimiter4 to " "
				set defaultStartTime4 to text returned of reasonForHoliday
			end if
			
			if HolidayDate as string is equal to "" & shortDay5 & "" then
				set reasonForHoliday to display dialog "Why did you take a day off?" default answer "Vacation"
				set finalEndTimeHour5 to " "
				set defaultEndTimeMinute5 to " "
				set defaultEndTimeDelimiter5 to " "
				set timeDelimiter5 to " "
				set defaultStartTime5 to text returned of reasonForHoliday
			end if
			
			if HolidayDate as string is equal to "No more" then exit repeat
			
		end repeat
	end try
end if

-- The body of the email 

set myReply to "Hi Moofasa,  " & return & "
 " & return & "
Here's my timesheet for " & shortDay1 & "-" & shortDay5 & ":  " & return & "
 " & return & "
" & shortDay1 & ": " & defaultStartTime1 & " " & timeDelimiter1 & " " & finalEndTimeHour1 & "" & defaultEndTimeDelimiter1 & "" & defaultEndTimeMinute1 & "  " & return & "
" & shortDay2 & ": " & defaultStartTime2 & " " & timeDelimiter2 & " " & finalEndTimeHour2 & "" & defaultEndTimeDelimiter2 & "" & defaultEndTimeMinute2 & "  " & return & "
" & shortDay3 & ": " & defaultStartTime3 & " " & timeDelimiter3 & " " & finalEndTimeHour3 & "" & defaultEndTimeDelimiter3 & "" & defaultEndTimeMinute3 & "  " & return & "
" & shortDay4 & ": " & defaultStartTime4 & " " & timeDelimiter4 & " " & finalEndTimeHour4 & "" & defaultEndTimeDelimiter4 & "" & defaultEndTimeMinute4 & "  " & return & "
" & shortDay5 & ": " & defaultStartTime5 & " " & timeDelimiter5 & " " & finalEndTimeHour5 & "" & defaultEndTimeDelimiter5 & "" & defaultEndTimeMinute5 & "  " & return & "
 " & return & "
Regards,  " & return & "
Nala"

-- The subject of the email 

set emailSubject to "Time Sheet " & shortDay1 & "- " & shortDay5 & ""


-- Prompt user to select and highlight the email to reply to 
-- Once selected, prompt user to press the "OK" button

set selectMail to display alert "Please select an email. Type OK when done." buttons {"Wait!", "OK"} default button "OK"
if button returned of selectMail is "OK" then
	display dialog "Writing your email..."
	set readyToBegin to true
else
	return
end if

-- Open a new Mail window and write in the new content and email subject 

if readyToBegin then
	tell application "Mail"
		set theSelection to selection
		set theMessage to item 1 of theSelection
		set theOutgoingMessage to reply theMessage with opening window and reply to all
		set subject of theOutgoingMessage to emailSubject
		tell application "System Events"
			tell application "Mail" to activate
			tell window 1
				keystroke "a" using {command down} -- ⌘A to select all
				delay 0.1
				repeat with i from 1 to count characters of myReply
					keystroke (character i of myReply)
					delay 0.005
				end repeat
			end tell
		end tell
	end tell
else
	return
end if


