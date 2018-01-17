#Windows 10 Default App Removal Script

#--------------------------------------------------------------------------------------
$apps=@(
    #"9E2F88E3.Twitter" #Twitter
    "ClearChannelRadioDigital.iHeartRadio" #iHeartRadio
    #"Flipboard.Flipboard" #Flipboard
    "king.com.CandyCrushSodaSaga" #CandyCrushSodaSaga
    "Microsoft.3DBuilder" #3D Printing Software
    #"Microsoft.Appconnector" #Always required, not sure what it does -- DO NOT REMOVE
    "Microsoft.BingFinance" #Bing Finance
    "Microsoft.BingNews" #Bing News
    "Microsoft.BingSports" #Bing Sports
    #"Microsoft.BingWeather" #Bing Weather
    "Microsoft.CommsPhone" #Communications - Phone App
    "Microsoft.Getstarted" #Get Started Hub
    "Microsoft.Messaging" #Windows Messenger
    "Microsoft.MicrosoftOfficeHub" #Office 2016 Hub
    "Microsoft.MicrosoftSolitaireCollection" #Solitaire
    #"Microsoft.Office.OneNote" #OneNote
    "Microsoft.Office.Sway" #Sway Presentation/Collab Software
    "Microsoft.People" #People Hub
    #"Microsoft.SkypeApp" #Skype
    "Microsoft.Windows.Phone" #Windows Phone Connector
    #"Microsoft.Windows.Photos" #Photos Hub
    #"Microsoft.WindowsAlarms" #Alarms and Clock
    #"Microsoft.WindowsCalculator" #Calculator
    #"Microsoft.WindowsCamera" #Camera
    #"Microsoft.WindowsMaps" #Maps
    "Microsoft.WindowsPhone" #More Windows Phone
    "Microsoft.WindowsSoundRecorder" #Recorder
    #"Microsoft.WindowsStore" #App Store -- DO NOT REMOVE
    #"Microsoft.XboxApp" #Xbox
    "Microsoft.ZuneMusic" #Zune or Groove Music
    "Microsoft.ZuneVideo" #Zune Video or Groove Video
    "Microsoft.windowscommunicationsapps" #Default Mail and Calendar Apps
    "Microsoft.MinecraftUWP" #Minecraft
    "ShazamEntertainmentLtd.Shazam" #Shazam
	#"Microsoft.FreshPaint" #FreshPaint
	"Microsoft.SurfaceHub" #Surface Hub
	"TheNewYorkTimes.NYTCrossword" #New York Times Crossword
	"Microsoft.ConnectivityStore" #Microsoft WiFi App
)

foreach ($app in $apps) {
	Write-Output $app
    Get-AppxPackage -Name $app -AllUsers | Remove-AppxPackage
    Get-AppXProvisionedPackage -Online | where DisplayName -EQ $app | Remove-AppxProvisionedPackage -Online

    $appPath="$Env:LOCALAPPDATA\Packages\$app*"
    Remove-Item $appPath -Recurse -Force -ErrorAction 0
}

#Get-AppxPackage -Name "Microsoft.WindowsStore" -AllUsers | Remove-AppxPackage #This is the benign way to remove App Store without unprovisioning... so you can get it back.
