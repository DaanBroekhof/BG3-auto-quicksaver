#MaxThreadsPerHotkey 2

InputBox, MinutesRepeat, Baldurs Gate III - Auto-Quick-Saver Pro Deluxe, Press CTRL-SHIFT-F5 to start or stop this auto-quick-saver. You should do this from in-game. We'll give a chime and do a quicksave when you start; and a chime when you stop.`n`nHow often (in minutes) would you like to trigger quick-save in game? Note: BG3 has a maximum of 15 quick-saves!, , 375, 230

if (ErrorLevel)
{
	ExitApp
	Return
}

if (MinutesRepeat <= 0)
{
	MsgBox, Number of minutes needs to be larger than 0.
	ExitApp
	Return
}


^+F5::
	IsActive := !IsActive
	if (IsActive)
	{
		SoundPlay, *-1
	}
	else
	{
		SoundPlay, *16
	}
	While (IsActive)
	{
		; Only send F5 when Baldurs Gate 3 is active
		if WinActive("ahk_exe bg3.exe" )
		{
			Send, {F5}
		}

		; Check for cancel every second
		CurrentMinutesRepeat := 0
		While (IsActive && CurrentMinutesRepeat < MinutesRepeat * 60000)
		{
			CurrentMinutesRepeat := CurrentMinutesRepeat + 1000
			Sleep, 1000
		}
	}
Return
