local dropdown = CreateFrame("Frame", "MySingleOptionDropdown", UIParent, "UIDropDownMenuTemplate")
dropdown:SetPoint("TOP", UIParent, "TOP", 0, -20)

local box = CreateFrame("Frame", nil, UIParent)
box:SetSize(25, 25)
box:SetPoint("CENTER")
box.texture = box:CreateTexture(nil, "BACKGROUND")
box.texture:SetAllPoints(true)
box.texture:SetColorTexture(0, 0, 0, 1)

local followTarget = nil
local selectedValue = 90
local canFollow = true
local canAttack = true
local playerincombat = "party1"
local holylightpercent = "50"
local canholylight = true
local function InitializeDropdown(self, level)
	local info = UIDropDownMenu_CreateInfo()
	info.text = "90"
	info.value = 90
	info.minWidth = 120
	info.func = function(self)
		selectedValue = self.value
		UIDropDownMenu_SetSelectedValue(dropdown, selectedValue)
		print("Selected:", selectedValue)
	end
	UIDropDownMenu_AddButton(info, level)

	local info2 = UIDropDownMenu_CreateInfo()
	info2.text = "80"
	info2.value = 80
	info2.minWidth = 120
	info2.func = function(self)
		selectedValue = self.value
		UIDropDownMenu_SetSelectedValue(dropdown, selectedValue)
		print("Selected:", selectedValue)
	end
	UIDropDownMenu_AddButton(info2, level)

	local info3 = UIDropDownMenu_CreateInfo()
	info3.text = "80"
	info3.value = 80
	info3.minWidth = 120
	info3.func = function(self)
		selectedValue = self.value
		UIDropDownMenu_SetSelectedValue(dropdown, selectedValue)
		print("Selected:", selectedValue)
	end
	UIDropDownMenu_AddButton(info3, level)

	local info4 = UIDropDownMenu_CreateInfo()
	info4.text = "70"
	info4.value = 70
	info4.minWidth = 120
	info4.func = function(self)
		selectedValue = self.value
		UIDropDownMenu_SetSelectedValue(dropdown, selectedValue)
		print("Selected:", selectedValue)
	end
	UIDropDownMenu_AddButton(info4, level)
end

UIDropDownMenu_Initialize(dropdown, InitializeDropdown)
UIDropDownMenu_SetWidth(dropdown, 120)
UIDropDownMenu_SetButtonWidth(dropdown, 180)
UIDropDownMenu_SetSelectedValue(dropdown, selectedValue)
UIDropDownMenu_SetText(dropdown, "Pick begin percentage")
UIDropDownMenu_JustifyText(dropdown, "LEFT")

local checkbox = CreateFrame("CheckButton", "MyCheckbox", UIParent, "ChatConfigCheckButtonTemplate")
checkbox:SetPoint("TOP", UIParent, "TOP", -50, -45) -- Position it below your dropdown
checkbox:SetSize(24, 24)

MyCheckboxText:SetText("Check Follow")

checkbox:SetChecked(canFollow)

checkbox:SetScript("OnClick", function(self)
	if self:GetChecked() then
		print("Checkbox enabled!")
		canFollow = true
	else
		print("Checkbox disabled!")
		canFollow = false
	end
end)

local checkbox2 = CreateFrame("CheckButton", "MyCheckbox2", UIParent, "ChatConfigCheckButtonTemplate")
checkbox2:SetPoint("TOP", UIParent, "TOP", -50, -60) -- Position it below your dropdown
checkbox2:SetSize(24, 24)

MyCheckbox2Text:SetText("Check Attack")

checkbox2:SetChecked(canAttack)

checkbox2:SetScript("OnClick", function(self)
	if self:GetChecked() then
		print("Checkbox enabled!")
		canAttack = true
	else
		print("Checkbox disabled!")
		canAttack = false
	end
end)

local dropdown2 = CreateFrame("Frame", "MySingleOptionDropdown2", UIParent, "UIDropDownMenuTemplate")
dropdown2:SetPoint("TOP", UIParent, "TOP", 0, -75)
local function InitializeDropdown2(self, level)
	local info = UIDropDownMenu_CreateInfo()
	info.text = "party1"
	info.value = "party1"
	info.minWidth = 120
	info.func = function(self)
		playerincombat = self.value
		UIDropDownMenu_SetSelectedValue(dropdown2, playerincombat)
		print("Selected:", playerincombat)
	end
	UIDropDownMenu_AddButton(info, level)

	local info2 = UIDropDownMenu_CreateInfo()
	info2.text = "party2"
	info2.value = "party2"
	info2.minWidth = 120
	info2.func = function(self)
		playerincombat = self.value
		UIDropDownMenu_SetSelectedValue(dropdown2, playerincombat)
		print("Selected:", playerincombat)
	end
	UIDropDownMenu_AddButton(info2, level)

	local info3 = UIDropDownMenu_CreateInfo()
	info3.text = "party3"
	info3.value = "party3"
	info3.minWidth = 120
	info3.func = function(self)
		playerincombat = self.value
		UIDropDownMenu_SetSelectedValue(dropdown2, playerincombat)
		print("Selected:", playerincombat)
	end
	UIDropDownMenu_AddButton(info3, level)

	local info4 = UIDropDownMenu_CreateInfo()
	info4.text = "party4"
	info4.value = "party4"
	info4.minWidth = 120
	info4.func = function(self)
		playerincombat = self.value
		UIDropDownMenu_SetSelectedValue(dropdown2, playerincombat)
		print("Selected:", playerincombat)
	end
	UIDropDownMenu_AddButton(info4, level)
end

UIDropDownMenu_Initialize(dropdown2, InitializeDropdown2)
UIDropDownMenu_SetWidth(dropdown2, 120)
UIDropDownMenu_SetButtonWidth(dropdown2, 180)
UIDropDownMenu_SetSelectedValue(dropdown2, playerincombat)
UIDropDownMenu_SetText(dropdown2, "Pick party")
UIDropDownMenu_JustifyText(dropdown2, "LEFT")

local dropdown3 = CreateFrame("Frame", "MySingleOptionDropdown3", UIParent, "UIDropDownMenuTemplate")
dropdown3:SetPoint("TOP", UIParent, "TOP", 0, -105)
local function InitializeDropdown3(self, level)
	local roles = { "90", "80", "70", "60", "50", "40" }
	for _, role in ipairs(roles) do
		local info = UIDropDownMenu_CreateInfo()
		info.text = role
		info.value = role
		info.minWidth = 120
		info.func = function(self)
			holylightpercent = self.value
			UIDropDownMenu_SetSelectedValue(dropdown3, holylightpercent)
			print("Holy Light threshold:", holylightpercent)
		end
		UIDropDownMenu_AddButton(info, level)
	end
end
UIDropDownMenu_Initialize(dropdown3, InitializeDropdown3)
UIDropDownMenu_SetWidth(dropdown3, 120)
UIDropDownMenu_SetButtonWidth(dropdown3, 180)
UIDropDownMenu_SetSelectedValue(dropdown3, holylightpercent)
UIDropDownMenu_SetText(dropdown3, "Pick  Holy Light percentage")
UIDropDownMenu_JustifyText(dropdown3, "LEFT")

local checkbox3 = CreateFrame("CheckButton", "MyCheckbox3", UIParent, "ChatConfigCheckButtonTemplate")
checkbox3:SetPoint("TOP", UIParent, "TOP", -50, -130)
checkbox3:SetSize(24, 24)
MyCheckbox3Text:SetText("Can cast Holy Light")

checkbox3:SetChecked(canholylight)

checkbox3:SetScript("OnClick", function(self)
	if self:GetChecked() then
		print("Heal checkbox enabled!")
		canholylight = true
	else
		print("Heal checkbox disabled!")
		canholylight = false
	end
end)

local f = CreateFrame("Frame")
f:SetScript("OnUpdate", function(self, elapsed)
	local currentlowesthp = 100
	box.texture:SetColorTexture(0, 0, 0, 1)
	if IsInGroup() then
		if UnitAffectingCombat(playerincombat) then
			box.texture:SetColorTexture(0.5, 0.5, 1, 1)

			local sametarget = UnitIsUnit("target", playerincombat .. "target")
			if not followTarget and canFollow then
				box.texture:SetColorTexture(0, 0.5, 0.5, 1)
			elseif not (IsCurrentSpell("Attack")) and canAttack then
				print("You are not auto-attacking.")
				box.texture:SetColorTexture(1, 0.5, 0, 1)
			elseif not sametarget and canAttack then
				box.texture:SetColorTexture(0, 0.5, 1, 1)
			else
				print("You are auto-attacking.")
			end
		end
		for i = 0, GetNumGroupMembers() do
			local unit
			if i == 0 then
				unit = "player"
			else
				unit = "party" .. i
			end

			if UnitExists(unit) and UnitIsConnected(unit) then
				local name = UnitName(unit)
				local hp = UnitHealth(unit)
				local maxHp = UnitHealthMax(unit)
				local Their_hp_percent = hp / maxHp * 100
				local _, class = UnitClass("player")

				if class == "PALADIN" then
					local spellName = UnitCastingInfo("player")

					local mana = UnitPower("player", 0)
					if Their_hp_percent < currentlowesthp and mana ~= 0 then
						currentlowesthp = Their_hp_percent

						if Their_hp_percent < selectedValue then
							if true then
								local usable, nomana = IsUsableSpell("Holy Light")
								if spellName ~= "Holy Light" and usable then
									if unit == "player" then
										box.texture:SetColorTexture(1, 0, 0, 1)
									elseif unit == "party1" then
										box.texture:SetColorTexture(0, 1, 0, 1)
									elseif unit == "party2" then
										box.texture:SetColorTexture(0, 0, 1, 1)
									elseif unit == "party3" then
										box.texture:SetColorTexture(1, 1, 1, 1)
									elseif unit == "party4" then
										box.texture:SetColorTexture(0, 0, 1, 1)
									end
								end
							else
								local spellName = GetSpellInfo("Flash of Light")
								if IsSpellKnown(spellName) then
									local usable2, nomana2 = IsUsableSpell("Flash of Light")
									if spellName ~= "Flash of Light" and usable2 then
										if unit == "player" then
											box.texture:SetColorTexture(1, 1, 0, 1)
										elseif unit == "party1" then
											box.texture:SetColorTexture(0, 1, 1, 1)
										elseif unit == "party2" then
											box.texture:SetColorTexture(0.5, 0.5, 0.5, 1)
										elseif unit == "party3" then
											box.texture:SetColorTexture(0.5, 0, 0.5, 1)
										elseif unit == "party4" then
											box.texture:SetColorTexture(0.5, 0.5, 0, 1)
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
end)

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("AUTOFOLLOW_BEGIN")
eventFrame:RegisterEvent("AUTOFOLLOW_END")

eventFrame:SetScript("OnEvent", function(self, event, msg)
	if event == "AUTOFOLLOW_BEGIN" then
		followTarget = true
		print("Now following: " .. (msg or "unknown"))
	elseif event == "AUTOFOLLOW_END" then
		followTarget = false
		print("Stopped following")
	end
end)
