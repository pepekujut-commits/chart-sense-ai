$apiKey = Read-Host "Paste your Gemini API Key here"
$model = "gemini-1.5-flash"
$url = "https://generativelanguage.googleapis.com/v1beta/models/$($model):generateContent?key=$apiKey"

$body = @{
    contents = @(
        @{
            parts = @(
                @{ text = "Respond with 'Success'" }
            )
        }
    )
} | ConvertTo-Json

Write-Host "Testing model $model..." -ForegroundColor Cyan

try {
    $response = Invoke-RestMethod -Uri $url -Method Post -Body $body -ContentType "application/json"
    Write-Host "✅ SUCCESS!" -ForegroundColor Green
    Write-Host "Response: $($response.candidates[0].content.parts[0].text)"
} catch {
    Write-Host "❌ FAILED!" -ForegroundColor Red
    Write-Host $_.Exception.Message
    $streamReader = New-Object System.IO.StreamReader($_.Exception.Response.GetResponseStream())
    $errorBody = $streamReader.ReadToEnd()
    Write-Host "Error Details: $errorBody"
}

Pause
