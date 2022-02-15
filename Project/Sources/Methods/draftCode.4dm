//%attributes = {}


//$students:=ds.Students.query("hobbies is not null")

var $webServerSettings; $headers : Object
var $webServer : Object

$webServerSettings:=New object:C1471()

$webServerSettings.httpHeaders:=New collection:C1472()

$headers:=New object:C1471()
$headers.urlPattern:="/studio/*.png"
$headers.responseHeaders:=New object:C1471("maxAge"; 28800; "contentType"; "image/png")
$webServerSettings.httpHeaders.push($headers)

$headers:=New object:C1471()
$headers.urlPattern:="/studio/*.WebForm"
$headers.responseHeaders:=New object:C1471("maxAge"; 3600; "contentType"; "JSON")
$webServerSettings.httpHeaders.push($headers)

$webServer:=WEB Server:C1674()
$webServer.stop()
$webServer.start($webServerSettings)
