
#Firs thing we have to do is get the most recent comic so we know our ceiling.
$totalURL="http://xkcd.com/info.0.json"

#do a web request to download the JSON, and get the value of num
$xHTTP = new-object -com msxml2.xmlhttp;
$xHTTP.open("GET",$totalURL,$false);
$xHTTP.send();
$x = $xHTTP.ResponseText.Trim() | ConvertFrom-Json
$max = $x.num

#get a random number between 1 and the most recent comoc
$random = Get-Random -minimum 1 -maximum $max

#URL to get a random image
$randomURL="http://xkcd.com/$random/info.0.json"

#get the random image URL
$xHTTP = new-object -com msxml2.xmlhttp;
$xHTTP.open("GET",$randomURL,$false);
$xHTTP.send();
$x = $xHTTP.ResponseText.Trim() | ConvertFrom-Json

#download comic to same directory
Invoke-WebRequest $x.img -OutFile xkcdComic.jpg
