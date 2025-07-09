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
UIDropDownMenu_SetText(dropdown, "Pick percentage")
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

local f = CreateFrame("Frame")
f:SetScript("OnUpdate", function(self, elapsed)
	local currentlowesthp = 100
	box.texture:SetColorTexture(0, 0, 0, 1)
	if IsInGroup() then
		if UnitAffectingCombat(playerincombat) then
			box.texture:SetColorTexture(1, 1, 0, 1)

			local sametarget = UnitIsUnit("target", playerincombat .. "target")
			if not followTarget and canFollow then
				box.texture:SetColorTexture(1, 1, 1, 1)
			elseif not (IsCurrentSpell("Attack") or IsCurrentSpell("Shoot")) and canAttack then
				print("You are not auto-attacking.")
				box.texture:SetColorTexture(0, 1, 0, 1)
			elseif not sametarget and canAttack then
				box.texture:SetColorTexture(0, 0.5, 0.5, 1)
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
					-- local manaCost = GetSpellPowerCost("Holy Light")[1].cost
					print(spellName)
					if Their_hp_percent < currentlowesthp then
						currentlowesthp = Their_hp_percent
						if Their_hp_percent < selectedValue and spellName ~= "Holy Light" then
							if unit == "player" then
								box.texture:SetColorTexture(1, 0, 0, 1)
							elseif unit == "party1" then
								box.texture:SetColorTexture(0.5, 0.5, 0.5, 1)
							elseif unit == "party2" then
								box.texture:SetColorTexture(0, 0, 1, 1)
							elseif unit == "party3" then
								box.texture:SetColorTexture(1, 0, 1, 1)
							elseif unit == "party4" then
								box.texture:SetColorTexture(0, 1, 1, 1)
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
