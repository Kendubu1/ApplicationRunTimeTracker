# DungeonCrawler Time Tracker 🕰️

### Description
Since Dark & Darker eventually added playtime tracking, I figured why not extend this script to track specific applications.
This script keeps a log of when it starts and stops, because who has time to manually keep track of these things, right?

I run this script as a background task with Task Scheduler to track the the application is opened & then closed.
Example output of the logs & csv is included in the repo as well.

### How to Use
1. Ensure you have PowerShell installed on your system.
2. Open the script and customize the following variable for the application you're looking to track:
   - `$processName`: The name of the process to monitor (e.g., "DungeonCrawler").
3. Run the script as a test.
4. Start the application
5. You're expected to see the csv & logs populate within your documents folder.

### Setting up Automatic Execution
To ensure seamless tracking of your DungeonCrawler playtime, follow these steps to set up the script to run at logon using Windows Task Scheduler:

1. **Open Task Scheduler**: Press `Win + R`, type `taskschd.msc`, and hit Enter.
2. **Create a New Task**: In the Task Scheduler window, navigate to `Action > Create Task...`.
3. **General Tab**:
   - Enter a name for the task (e.g., "DungeonCrawler Time Tracker").
   - Optionally, provide a description.
   - Ensure "Run whether user is logged on" is selected.
   - Check "Hidden" to run the task in the background.
4. **Triggers Tab**:
   - Click "New" to create a new trigger.
   - Select "At log on" from the dropdown menu.
   - Choose the appropriate user account.
5. **Actions Tab**:
   - Click "New" to create a new action.
   - Action: `Start a program`.
   - Program/script: `powershell.exe`.
   - Add arguments: `-WindowStyle Hidden -ExecutionPolicy Bypass -File "C:\Code\dd_timetracker\DDTimeTracker.ps1"`.
   - Step above would be the path for where your script is saved.
6. **Conditions Tab** (Optional):
   - Adjust conditions as needed based on your preferences.
7. **Settings Tab** (Optional):
   - Adjust settings as needed based on your preferences.
8. **Save and Close**: Click `OK` to save the task.

Now, every time you log on to your system, the script will automatically start running in the background, ensuring accurate tracking of your Application playtime.


### Features
- Automatically starts tracking when DungeonCrawler begins running.
- Logs the start time, end time, and duration of each session.
- Keeps your productivity in check by ensuring you know exactly how much time you spend battling monsters and looting dungeons.

### Requirements
- PowerShell

