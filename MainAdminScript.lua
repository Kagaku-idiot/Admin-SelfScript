																																									    --[[
	__________________________________________________________________________________________________________
	
	
	██████╗  ██████╗ ███████╗███████╗██╗██████╗  ██████╗ ███╗   ██╗    ███╗   ███╗ █████╗ ██╗███╗   ██╗
	██╔══██╗██╔═══██╗██╔════╝██╔════╝██║██╔══██╗██╔═══██╗████╗  ██║    ████╗ ████║██╔══██╗██║████╗  ██║
	██████╔╝██║   ██║███████╗█████╗  ██║██║  ██║██║   ██║██╔██╗ ██║    ██╔████╔██║███████║██║██╔██╗ ██║
	██╔═══╝ ██║   ██║╚════██║██╔══╝  ██║██║  ██║██║   ██║██║╚██╗██║    ██║╚██╔╝██║██╔══██║██║██║╚██╗██║
	██║     ╚██████╔╝███████║███████╗██║██████╔╝╚██████╔╝██║ ╚████║    ██║ ╚═╝ ██║██║  ██║██║██║ ╚████║
	╚═╝      ╚═════╝ ╚══════╝╚══════╝╚═╝╚═════╝  ╚═════╝ ╚═╝  ╚═══╝    ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝
	                       
                       Created by Kagaku-idiot on Github			
                       
 	____________________________________________________________________________________________________________															]]--

game.Players.PlayerAdded:Connect(function(player)
	local char = player.CharacterAdded:Wait()
	if char ~= nil then
		local table = {'rageybeastXxX', 'SomethingElse'} --Change the strings to the name of your trusted friend's Name

		--Function to avoid exploiting
		local function AntiExploit()
			if game.StarterGui:FindFirstChild("MainMenu") or player.StarterGui:FindFirstChild('MainMenu')then
				game.StarterGui.MainMenu:Destroy()
				player.StarterGui.MainMenu:Destroy()
			end	
		end

		--Function to verify if the User is authorized
		if player.Name == table[1] or player.Name == table[2] then
			print("User Authorised") 
		else
			print("User not authorised")
			AntiExploit()
		end

		--Function to verify remote event controller
		game.ReplicatedStorage.Kick.OnServerEvent:Connect(function(player, playerToKick, reason, value)
			if player.Name == table[1] or player.Name == table[2] then
				game.Players:FindFirstChild(playerToKick):Kick(reason)
				print(playerToKick.." Was Kicked For This Reason: "..reason)
			end
		end)
		game.ReplicatedStorage.Speed.OnServerEvent:Connect(function(player, playerToSpeed, reason, value)
			if player.Name == table[1] or player.Name == table[2] then
				game.Players:FindFirstChild(playerToSpeed).Character.Humanoid.WalkSpeed = value
				print(playerToSpeed.." Gained "..value.." Speed for: "..reason)
			else
				player:Kick("Exploiter")
			end
		end)

		game.ReplicatedStorage.God.OnServerEvent:Connect(function(player, playerToGod, reason)
			if player.Name == table[1] or player.Name == table[2] then
				game.Players:WaitForChild(playerToGod).Character.Humanoid.MaxHealth = 10000000000; game.Players:WaitForChild(playerToGod).Character.Humanoid.Health = 10000000000 
				print(playerToGod.."Gained God for: "..reason)
			else
				player:Kick("Exploiter")
			end
		end) 
		game.ReplicatedStorage.ForceField.OnServerEvent:Connect(function(player, playerToField, reason)
			if player.Name == table[1] or player.Name == table[2] then
				local ff = Instance.new('ForceField')
				ff.Parent = game.Players:WaitForChild(playerToField).Character
				print(playerToField.."Gained FF for: "..reason)
			else
				player:Kick("Exploiter")
			end
		end)
	end	
end)





