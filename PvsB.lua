--// Check Game ID (Plants Vs Brainrot only)
if game.GameId ~= 127742093697776 then
    warn("❌ This script only works for Plants Vs Brainrot")
    return
end

--// Load Rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

--// Create Window
local Window = Rayfield:CreateWindow({
   Name = "Plants Vs Brainrot Hub",
   LoadingTitle = "Plants Vs Brainrot Script",
   LoadingSubtitle = "by You",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "PVZBrainrotHub",
      FileName = "Config"
   },
   Discord = {
      Enabled = false,
      Invite = "",
      RememberJoins = true
   },
   KeySystem = false -- 🔓 no key system
})

--// Main Tab
local MainTab = Window:CreateTab("Main", 4483362458)

--// Section
local Section = MainTab:CreateSection("Auto-Buy Seeds")

--// Function to Buy Item
local function BuyItem(itemName)
    local args = {
        [1] = {
            [1] = itemName;
            [2] = ""; -- fixed constant (as seen from your remote spy)
        };
    }
    game:GetService("ReplicatedStorage")
        :WaitForChild("BridgeNet2", 9e9)
        :WaitForChild("dataRemoteEvent", 9e9)
        :FireServer(unpack(args))
end

--// Seed List
local Seeds = {
    "Cactus",
    "Strawberry",
    "Pumpkin",
    "Sunflower",
    "Dragon Fruit",
    "Eggplant",
    "Watermelon",
    "Cocotank",
    "Carnivorous Plant",
    "Mr Carrot",
    "Tomatrio"
}

--// Selected Seed (default)
getgenv().SelectedSeed = Seeds[1]

--// Dropdown to select seed
MainTab:CreateDropdown({
   Name = "Choose Seed",
   Options = Seeds,
   CurrentOption = Seeds[1],
   Flag = "SeedDropdown",
   Callback = function(Option)
      getgenv().SelectedSeed = Option
      Rayfield:Notify({
         Title = "Seed Selected",
         Content = "You selected: " .. Option,
         Duration = 3
      })
   end,
})

--// Buy Button
MainTab:CreateButton({
   Name = "Buy Selected Seed",
   Callback = function()
      if getgenv().SelectedSeed then
         BuyItem(getgenv().SelectedSeed)
      end
   end,
})
