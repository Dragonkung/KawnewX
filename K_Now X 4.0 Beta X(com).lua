    
    game:GetService("Players").LocalPlayer.Idled:connect(function()
        game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)

    _G.Color = Color3.fromRGB(255,0,0)
    if not game:IsLoaded() then repeat game.Loaded:Wait() until game:IsLoaded() end
    
    repeat wait() until game:GetService("Players")
    
    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then repeat wait() until game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") end
        
    wait(1)
    
    do
        local ui = game.CoreGui:FindFirstChild("SOMEXGUI")
        if ui then
            ui:Destroy()
        end
    end
    
    local UserInputService = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")
    
    local function MakeDraggable(topbarobject, object)
        local Dragging = nil
        local DragInput = nil
        local DragStart = nil
        local StartPosition = nil
    
        local function Update(input)
            local Delta = input.Position - DragStart
            local pos =
                UDim2.new(
                    StartPosition.X.Scale,
                    StartPosition.X.Offset + Delta.X,
                    StartPosition.Y.Scale,
                    StartPosition.Y.Offset + Delta.Y
                )
            local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
            Tween:Play()
        end
    
        topbarobject.InputBegan:Connect(
            function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    Dragging = true
                    DragStart = input.Position
                    StartPosition = object.Position
    
                    input.Changed:Connect(
                        function()
                            if input.UserInputState == Enum.UserInputState.End then
                                Dragging = false
                            end
                        end
                    )
                end
            end
        )
    
        topbarobject.InputChanged:Connect(
            function(input)
                if
                    input.UserInputType == Enum.UserInputType.MouseMovement or
                    input.UserInputType == Enum.UserInputType.Touch
                then
                    DragInput = input
                end
            end
        )
    
        UserInputService.InputChanged:Connect(
            function(input)
                if input == DragInput and Dragging then
                    Update(input)
                end
            end
        )
    end
    
    local library = {}
    
    function library:AddWindow(text,keybind)
        local bind = keybind or Enum.KeyCode.RightControl
        local ff = false
        local currenttab = ""
    
        local DoctorShiba = Instance.new("ScreenGui")
        DoctorShiba.Name = "SOMEXGUI"
        DoctorShiba.Parent = game.CoreGui
        DoctorShiba.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
        local Main = Instance.new("Frame")
        Main.Name = "Main"
        Main.Parent = DoctorShiba
        Main.AnchorPoint = Vector2.new(0.5, 0.5)
        Main.BackgroundColor3 = Color3.fromRGB(30, 28, 39)
        Main.BackgroundTransparency = 0.100
        Main.BorderSizePixel = 0
        Main.ClipsDescendants = true
        Main.Position = UDim2.new(0.499526083, 0, 0.499241292, 0)
        Main.Size = UDim2.new(0, 600, 0, 350)
    
        local Top = Instance.new("Frame")
        Top.Name = "Top"
        Top.Parent = Main
        Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Top.BackgroundTransparency = 1.000
        Top.BorderSizePixel = 0
        Top.Size = UDim2.new(0, 600, 0, 20)
    
        local Page = Instance.new("Frame")
        Page.Name = "Page"
        Page.Parent = Main
        Page.BackgroundColor3 = Color3.fromRGB(25, 23, 35)
        Page.BackgroundTransparency = 0.100
        Page.BorderSizePixel = 0
        Page.Size = UDim2.new(0, 125, 0, 350)
    
        local NameHub = Instance.new("TextLabel")
        NameHub.Name = "NameHub"
        NameHub.Parent = Page
        NameHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        NameHub.BackgroundTransparency = 1.000
        NameHub.Position = UDim2.new(0.113333493, 0, 0, 0)
        NameHub.Size = UDim2.new(0, 110, 0, 20)
        NameHub.Font = Enum.Font.GothamSemibold
        NameHub.Text = text
        NameHub.TextColor3 = Color3.fromRGB(225, 0, 0)
        NameHub.TextSize = 11.000
        NameHub.TextXAlignment = Enum.TextXAlignment.Left
    
        local User = Instance.new("Frame")
        User.Name = "User"
        User.Parent = Page
        User.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        User.BackgroundTransparency = 1.000
        User.Position = UDim2.new(0, 0, 0.8, 30)
        User.Size = UDim2.new(0, 125, 0, 40)
    
        local UserText = Instance.new("TextLabel")
        UserText.Name = "UserText"
        UserText.Parent = User
        UserText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        UserText.BackgroundTransparency = 1.000
        UserText.Position = UDim2.new(0.354999989, 0, 0, 11)
        UserText.Size = UDim2.new(0, 80, 0, 20)
        UserText.Font = Enum.Font.Gotham
        UserText.Text = tostring(game.Players.LocalPlayer.Name) 
        spawn(function()
            while wait() do
                pcall(function()
                    wait(0.1) 
                    game:GetService('TweenService'):Create(
                        UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(255, 0, 0)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(255, 155, 0)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(255, 255, 0)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(0, 255, 0)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(0, 255, 255)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(0, 155, 255)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(255, 0, 255)}
                    ):Play() 
                    wait(.5)            
                    game:GetService('TweenService'):Create(
                        UserText,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                        {TextColor3 = Color3.fromRGB(255, 0, 155)}
                    ):Play() 
                    wait(.5)
                end)
            end
        end)
        UserText.TextScaled = true
        UserText.TextSize = 11.000
        UserText.TextWrapped = true
        UserText.TextXAlignment = Enum.TextXAlignment.Left
    
        local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
        UITextSizeConstraint.Parent = UserText
        UITextSizeConstraint.MaxTextSize = 11
    
        local UserImage = Instance.new("ImageLabel")
        UserImage.Name = "UserImage"
        UserImage.Parent = User
        UserImage.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
        UserImage.Position = UDim2.new(0, 10, 0, 9)
        UserImage.Size = UDim2.new(0, 25, 0, 25)
        UserImage.Image = "https://www.roblox.com/headshot-thumbnail/image?userId="..game.Players.LocalPlayer.UserId.."&width=420&height=420&format=png"
    
        local UserImageCorner = Instance.new("UICorner")
        UserImageCorner.CornerRadius = UDim.new(0, 100)
        UserImageCorner.Name = "UserImageCorner"
        UserImageCorner.Parent = UserImage
    
        local ScrollPage = Instance.new("ScrollingFrame")
        ScrollPage.Name = "ScrollPage"
        ScrollPage.Parent = Page
        ScrollPage.Active = true
        ScrollPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ScrollPage.BackgroundTransparency = 1.000
        ScrollPage.BorderSizePixel = 0
        ScrollPage.Position = UDim2.new(0, 0, 0.086, 0)
        ScrollPage.Size = UDim2.new(0, 125, 0, 290)
        ScrollPage.CanvasSize = UDim2.new(0, 0, 0, 0)
        ScrollPage.ScrollBarThickness = 0
        local PageList = Instance.new("UIListLayout")
        PageList.Name = "PageList"
        PageList.Parent = ScrollPage
        PageList.SortOrder = Enum.SortOrder.LayoutOrder
        PageList.Padding = UDim.new(0, 7)
    
        local PagePadding = Instance.new("UIPadding")
        PagePadding.Name = "PagePadding"
        PagePadding.Parent = ScrollPage
        PagePadding.PaddingTop = UDim.new(0, 5)
        PagePadding.PaddingLeft = UDim.new(0, 28)
    
        local TabFolder = Instance.new("Folder")
        TabFolder.Name = "TabFolder"
        TabFolder.Parent = Main
    
        MakeDraggable(Top,Main)
    
        local uihide = false
    
        UserInputService.InputBegan:Connect(function(input)
            if input.KeyCode == bind then
                if uihide == false then
                    uihide = true
                    Main:TweenSize(UDim2.new(0, 0, 0, 0),"In","Quad",0.2,true)
                else
                    uihide = false
                    Main:TweenSize(UDim2.new(0, 600, 0, 350),"Out","Quad",0.2,true)
                end
            end
        end)
    
        local uitab = {}
    
        function uitab:AddTab(text,image)
            local Image = image or 6023426915
    
            local PageButton = Instance.new("TextButton")
            PageButton.Name = "PageButton"
            PageButton.Parent = ScrollPage
            PageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            PageButton.BackgroundTransparency = 1.000
            PageButton.BorderSizePixel = 0
            PageButton.Position = UDim2.new(0.224000007, 0, 0.029787235, 0)
            PageButton.Size = UDim2.new(0, 97, 0, 20)
            PageButton.AutoButtonColor = false
            PageButton.Font = Enum.Font.GothamSemibold
            PageButton.Text = text
            PageButton.TextColor3 = Color3.fromRGB(225, 225, 225)
            PageButton.TextSize = 11.000
            PageButton.TextXAlignment = Enum.TextXAlignment.Left
            
            local PageImage = Instance.new("ImageLabel")
            PageImage.Name = "PageImage"
            PageImage.Parent = PageButton
            PageImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            PageImage.BackgroundTransparency = 1.000
            PageImage.Position = UDim2.new(0, -20, 0, 3)
            PageImage.Size = UDim2.new(0, 15, 0, 15)
            PageImage.Image = "rbxassetid://"..tostring(Image)
    
            local MainTab = Instance.new("Frame")
            MainTab.Name = "MainTab"
            MainTab.Parent = TabFolder
            MainTab.BackgroundColor3 = Color3.fromRGB(30, 28, 39)
            MainTab.BorderSizePixel = 0
            MainTab.Position = UDim2.new(0.208333328, 0, 0, 0)
            MainTab.Size = UDim2.new(0, 475, 0, 350)
            MainTab.Visible = false
    
            local ScrollTab = Instance.new("ScrollingFrame")
            ScrollTab.Name = "ScrollTab"
            ScrollTab.Parent = MainTab
            ScrollTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ScrollTab.BackgroundTransparency = 1.000
            ScrollTab.BorderSizePixel = 0
            ScrollTab.Position = UDim2.new(0, 0, 0.057, 0)
            ScrollTab.Size = UDim2.new(0, 475, 0, 330)
            ScrollTab.CanvasSize = UDim2.new(0, 0, 0, 0)
            ScrollTab.ScrollBarThickness = 3
    
            local TabList = Instance.new("UIListLayout")
            TabList.Name = "TabList"
            TabList.Parent = ScrollTab
            TabList.SortOrder = Enum.SortOrder.LayoutOrder
            TabList.Padding = UDim.new(0, 5)
    
            local TabPadding = Instance.new("UIPadding")
            TabPadding.Name = "TabPadding"
            TabPadding.Parent = ScrollTab
            TabPadding.PaddingLeft = UDim.new(0, 10)
            TabPadding.PaddingTop = UDim.new(0, 10)
    
            PageButton.MouseButton1Click:Connect(function()
                currenttab = MainTab.Name
                for i,v in next, TabFolder:GetChildren() do 
                    if v.Name == "MainTab" then
                        v.Visible = false
                    end
                end
                MainTab.Visible = true
    
                for i,v in next, ScrollPage:GetChildren() do 
                    if v:IsA("TextButton") then
                        TweenService:Create(
                            v,
                            TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {TextColor3 = Color3.fromRGB(225, 225, 225)}
                        ):Play()
                    end
                    TweenService:Create(
                        PageButton,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(255,0,0)}
                    ):Play()
                end
            end)
    
            if ff == false then
                TweenService:Create(
                    PageButton,
                    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(255,0,0)}
                ):Play()
                for i,v in next, TabFolder:GetChildren() do 
                    if v.Name == "MainTab" then
                        v.Visible = false
                    end
                    MainTab.Visible = true
                end
                ff = true
            end
    
            game:GetService("RunService").Stepped:Connect(function()
                pcall(function()
                    ScrollPage.CanvasSize = UDim2.new(0,0,0,PageList.AbsoluteContentSize.Y + 10)
                    ScrollTab.CanvasSize = UDim2.new(0,0,0,TabList.AbsoluteContentSize.Y + 30)
                end)
            end)
            
            local main = {}
            
            function main:AddButton(text,callback)
                local Button = Instance.new("TextButton")
    
                Button.Name = "Button"
                Button.Parent = ScrollTab
                Button.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
                Button.BackgroundTransparency = 0.1
                Button.BorderSizePixel = 0
                Button.Size = UDim2.new(0, 455, 0, 30)
                Button.AutoButtonColor = false
                Button.Font = Enum.Font.Gotham
                Button.Text = text
                Button.TextColor3 = Color3.fromRGB(225, 225, 225)
                Button.TextSize = 11.000
                Button.TextWrapped = true
                
                local ButtonCorner = Instance.new("UICorner")
                ButtonCorner.Name = "ButtonCorner"
                ButtonCorner.CornerRadius = UDim.new(0, 5)
                ButtonCorner.Parent = Button
                
                Button.MouseEnter:Connect(function()
                    TweenService:Create(
                        Button,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(255,0,0)}
                    ):Play()
                end)
                
                Button.MouseLeave:Connect(function()
                    TweenService:Create(
                        Button,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(225, 225, 225)}
                    ):Play()
                end)
                
                Button.MouseButton1Click:Connect(function()
                    callback()
                    Button.TextSize = 0
                    TweenService:Create(
                        Button,
                        TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
                        {TextSize = 11}
                    ):Play()
                end)
            end
            
            function main:AddToggle(text,config,callback)
                local ToggleImage = Instance.new("Frame")
                
                local Toggle = Instance.new("TextButton")
                Toggle.Name = "Toggle"
                Toggle.Parent = ScrollTab
                Toggle.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
                Toggle.BackgroundTransparency = 0.1
                Toggle.BorderSizePixel = 0
                Toggle.AutoButtonColor = false
                Toggle.Size = UDim2.new(0, 455, 0, 30)
                Toggle.Font = Enum.Font.SourceSans
                Toggle.Text = ""
                Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
                Toggle.TextSize = 14.000
                
                local ToggleCorner = Instance.new("UICorner")
                ToggleCorner.Name = "ToggleCorner"
                ToggleCorner.CornerRadius = UDim.new(0, 5)
                ToggleCorner.Parent = Toggle
    
                local ToggleLabel = Instance.new("TextLabel")
                ToggleLabel.Name = "ToggleLabel"
                ToggleLabel.Parent = Toggle
                ToggleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ToggleLabel.BackgroundTransparency = 1.000
                ToggleLabel.Position = UDim2.new(0, 13, 0, 0)
                ToggleLabel.Size = UDim2.new(0, 410, 0, 30)
                ToggleLabel.Font = Enum.Font.Gotham
                ToggleLabel.Text = text
                ToggleLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
                ToggleLabel.TextSize = 11.000
                ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
    
                ToggleImage.Name = "ToggleImage"
                ToggleImage.Parent = Toggle
                ToggleImage.BackgroundColor3 = Color3.fromRGB(70, 68, 79)
                ToggleImage.Position = UDim2.new(0, 425, 0, 5)
                ToggleImage.BorderSizePixel = 0
                ToggleImage.Size = UDim2.new(0, 20, 0, 20)
                local ToggleImageCorner = Instance.new("UICorner")
                ToggleImageCorner.Name = "ToggleImageCorner"
                ToggleImageCorner.CornerRadius = UDim.new(0, 5)
                ToggleImageCorner.Parent = ToggleImage
    
                local ToggleImage2 = Instance.new("Frame")
                ToggleImage2.Name = "ToggleImage2"
                ToggleImage2.Parent = ToggleImage
                ToggleImage2.AnchorPoint = Vector2.new(0.5, 0.5)
                ToggleImage2.BackgroundColor3 = Color3.fromRGB(255,0,0)
                ToggleImage2.Position = UDim2.new(0, 10, 0, 10)
                ToggleImage2.Visible = false
    
                local ToggleImage2Corner = Instance.new("UICorner")
                ToggleImage2Corner.Name = "ToggleImageCorner"
                ToggleImage2Corner.CornerRadius = UDim.new(0, 5)
                ToggleImage2Corner.Parent = ToggleImage2
                
                Toggle.MouseEnter:Connect(function()
                    TweenService:Create(
                        ToggleLabel,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(255,0,0)}
                    ):Play()
                end)
    
                Toggle.MouseLeave:Connect(function()
                    TweenService:Create(
                        ToggleLabel,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(225, 225, 225)}
                    ):Play()
                end)
                if config == nil then config = false end
                local toggled = config or false
                Toggle.MouseButton1Click:Connect(function()
                    if toggled == false then
                        toggled = true
                        ToggleImage2.Visible = true
                        ToggleImage2:TweenSize(UDim2.new(0, 21, 0, 21),"In","Quad",0.1,true)
                    else
                        toggled = false
                        ToggleImage2:TweenSize(UDim2.new(0, 0, 0, 0),"In","Quad",0.1,true)
                        wait(0.1)
                        ToggleImage2.Visible = false
                    end
                    callback(toggled)
                end)
                
                if config == true then
                    ToggleImage2.Visible = true
                    ToggleImage2:TweenSize(UDim2.new(0, 21, 0, 21),"In","Quad",0.1,true)
                    toggled = true
                    callback(toggled)
                end
            end
    
            function main:AddTextbox(text,holder,disappear,callback)
                local Textboxx = Instance.new("Frame")
                local TextboxxCorner = Instance.new("UICorner")
                local TextboxTitle = Instance.new("TextLabel")
                local Textbox = Instance.new("TextBox")
                local TextboxCorner = Instance.new("UICorner")
    
                Textboxx.Name = "Textboxx"
                Textboxx.Parent = ScrollTab
                Textboxx.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
                Textboxx.Size = UDim2.new(0, 455, 0, 30)
    
                TextboxxCorner.CornerRadius = UDim.new(0, 5)
                TextboxxCorner.Name = "TextboxxCorner"
                TextboxxCorner.Parent = Textboxx
    
                TextboxTitle.Name = "TextboxTitle"
                TextboxTitle.Parent = Textboxx
                TextboxTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextboxTitle.BackgroundTransparency = 1.000
                TextboxTitle.Position = UDim2.new(0, 15, 0, 0)
                TextboxTitle.Size = UDim2.new(0, 300, 0, 30)
                TextboxTitle.Font = Enum.Font.Gotham
                TextboxTitle.Text = text
                TextboxTitle.TextColor3 = Color3.fromRGB(225, 225, 225)
                TextboxTitle.TextSize = 11.000
                TextboxTitle.TextXAlignment = Enum.TextXAlignment.Left
    
                Textbox.Name = "Textbox"
                Textbox.Parent = Textboxx
                Textbox.BackgroundColor3 = Color3.fromRGB(30, 28, 39)
                Textbox.Position = UDim2.new(0, 310, 0, 5)
                Textbox.Size = UDim2.new(0, 140, 0, 20)
                Textbox.Font = Enum.Font.Gotham
                Textbox.Text = holder
                Textbox.TextColor3 = Color3.fromRGB(225, 225, 225)
                Textbox.TextSize = 11.000
    
                Textbox.FocusLost:Connect(function()
                    if #Textbox.Text > 0 then
                        callback(Textbox.Text)
                    end
                    if disappear then
                        Textbox.Text = ""
                    else
                        Textbox.Text = holder
                    end
                end)
    
                TextboxCorner.Name = "TextboxCorner"
                TextboxCorner.CornerRadius = UDim.new(0, 5)
                TextboxCorner.Parent = Textbox
            end
    
            function main:AddDropdown(text,table,callback)
                local Dropdown = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local DropButton = Instance.new("TextButton")
                local Droptitle = Instance.new("TextLabel")
                local DropScroll = Instance.new("ScrollingFrame")
                local DropdownList = Instance.new("UIListLayout")
                local DropdownPadding = Instance.new("UIPadding")
                local DropImage = Instance.new("ImageLabel")
                
                Dropdown.Name = "Dropdown"
                Dropdown.Parent = ScrollTab
                Dropdown.Active = true
                Dropdown.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
                Dropdown.ClipsDescendants = true
                Dropdown.Size = UDim2.new(0, 455, 0, 30)
                
                UICorner.CornerRadius = UDim.new(0, 5)
                UICorner.Parent = Dropdown
                
                DropButton.Name = "DropButton"
                DropButton.Parent = Dropdown
                DropButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropButton.BackgroundTransparency = 1.000
                DropButton.Size = UDim2.new(0, 455, 0, 30)
                DropButton.Font = Enum.Font.SourceSans
                DropButton.Text = ""
                DropButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                DropButton.TextSize = 14.000
                
                Droptitle.Name = "Droptitle"
                Droptitle.Parent = Dropdown
                Droptitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Droptitle.BackgroundTransparency = 1.000
                Droptitle.Position = UDim2.new(0.0281690136, 0, 0, 0)
                Droptitle.Size = UDim2.new(0, 410, 0, 30)
                Droptitle.Font = Enum.Font.Gotham
                Droptitle.Text = text.." : "
                Droptitle.TextColor3 = Color3.fromRGB(225, 225, 225)
                Droptitle.TextSize = 11.000
                Droptitle.TextXAlignment = Enum.TextXAlignment.Left
    
                DropImage.Name = "DropImage"
                DropImage.Parent = Dropdown
                DropImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropImage.BackgroundTransparency = 1.000
                DropImage.Position = UDim2.new(0, 425, 0, 5)
                DropImage.Rotation = 0
                DropImage.Size = UDim2.new(0, 20, 0, 20)
                DropImage.Image = "rbxassetid://5012539403"
                
                DropScroll.Name = "DropScroll"
                DropScroll.Parent = Droptitle
                DropScroll.Active = true
                DropScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropScroll.BackgroundTransparency = 1.000
                DropScroll.BorderSizePixel = 0
                DropScroll.Position = UDim2.new(-0.0317460336, 0, 1, 0)
                DropScroll.Size = UDim2.new(0, 455, 0, 70)
                DropScroll.CanvasSize = UDim2.new(0, 0, 0, 2)
                DropScroll.ScrollBarThickness = 2
                
                DropdownList.Name = "DropdownList"
                DropdownList.Parent = DropScroll
                DropdownList.SortOrder = Enum.SortOrder.LayoutOrder
                DropdownList.Padding = UDim.new(0, 5)
                
                DropdownPadding.Name = "DropdownPadding"
                DropdownPadding.Parent = DropScroll
                DropdownPadding.PaddingTop = UDim.new(0, 5)
    
                local isdropping = false
    
                for i,v in next,table do
                    local DropButton2 = Instance.new("TextButton")
    
                    DropButton2.Name = "DropButton2"
                    DropButton2.Parent = DropScroll
                    DropButton2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    DropButton2.BackgroundTransparency = 1.000
                    DropButton2.Size = UDim2.new(0, 455, 0, 30)
                    DropButton2.AutoButtonColor = false
                    DropButton2.Font = Enum.Font.Gotham
                    DropButton2.TextColor3 = Color3.fromRGB(225, 225, 225)
                    DropButton2.TextSize = 11.000
                    DropButton2.Text = tostring(v)
    
                    DropButton2.MouseEnter:Connect(function()
                        TweenService:Create(
                            DropButton2,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {TextColor3 = Color3.fromRGB(255,0,0)}
                        ):Play()
                    end)
                    DropButton2.MouseLeave:Connect(function()
                        TweenService:Create(
                            DropButton2,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {TextColor3 = Color3.fromRGB(225, 225, 225)}
                        ):Play()
                    end)
    
                    DropButton2.MouseButton1Click:Connect(function()
                        TweenService:Create(
                            Dropdown,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Size = UDim2.new(0, 455, 0, 30)}
                        ):Play()
                        TweenService:Create(
                            DropImage,
                            TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                            {Rotation = 0}
                        ):Play()
                        Droptitle.Text =  text.." : "..tostring(v)
                        callback(v)
                        isdropping = not isdropping
                        DropScroll.CanvasSize = UDim2.new(0,0,0,DropdownList.AbsoluteContentSize.Y + 10)
                    end)
                end
    
                DropButton.MouseButton1Click:Connect(function()
                    if isdropping == false then
                        isdropping = true
                        TweenService:Create(
                            Dropdown,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Size = UDim2.new(0, 455, 0, 100)}
                        ):Play()
                        TweenService:Create(
                            DropImage,
                            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Rotation = -180}
                        ):Play()
                        DropScroll.CanvasSize = UDim2.new(0,0,0,DropdownList.AbsoluteContentSize.Y + 10)
                    else
                        isdropping = false
                        TweenService:Create(
                            Dropdown,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Size = UDim2.new(0, 455, 0, 30)}
                        ):Play()
                        TweenService:Create(
                            DropImage,
                            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Rotation = 0}
                        ):Play()
                        DropScroll.CanvasSize = UDim2.new(0,0,0,DropdownList.AbsoluteContentSize.Y + 10)
                    end
                end)
                DropScroll.CanvasSize = UDim2.new(0,0,0,DropdownList.AbsoluteContentSize.Y + 10)
    
                local drop = {}
    
                function drop:Clear()
                    Droptitle.Text = tostring(text).." :"
                    TweenService:Create(
                        Dropdown,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Size = UDim2.new(0, 455, 0, 30)} 
                    ):Play()
                    isdropping = false
                    for i, v in next, DropScroll:GetChildren() do
                        if v:IsA("TextButton") then
                            v:Destroy()
                        end
                    end
                end
                function drop:Add(t)
                    local DropButton2 = Instance.new("TextButton")
    
                    DropButton2.Name = "DropButton2"
                    DropButton2.Parent = DropScroll
                    DropButton2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    DropButton2.BackgroundTransparency = 1.000
                    DropButton2.Size = UDim2.new(0, 455, 0, 30)
                    DropButton2.AutoButtonColor = false
                    DropButton2.Font = Enum.Font.Gotham
                    DropButton2.TextColor3 = Color3.fromRGB(225, 225, 225)
                    DropButton2.TextSize = 11.000
                    DropButton2.Text = tostring(t)
    
                    DropButton2.MouseButton1Click:Connect(function()
                        TweenService:Create(
                            Dropdown,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Size = UDim2.new(0, 455, 0, 30)}
                        ):Play()
                        TweenService:Create(
                            DropImage,
                            TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                            {Rotation = 0}
                        ):Play()
                        Droptitle.Text =  text.." : "..tostring(t)
                        callback(t)
                        isdropping = not isdropping
                        DropScroll.CanvasSize = UDim2.new(0,0,0,DropdownList.AbsoluteContentSize.Y + 10)
                    end)
                end
                return drop
            end
    
            function main:AddSlider(text,min,max,set,callback)
                set = (math.clamp(set,min,max))
                if set > max then set = max end
    
                local Slider = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local SliderTitle = Instance.new("TextLabel")
                local SliderValue = Instance.new("TextLabel")
                local SliderButton = Instance.new("TextButton")
                local Bar1 = Instance.new("Frame")
                local Bar = Instance.new("Frame")
                local UICorner_2 = Instance.new("UICorner")
                local CircleBar = Instance.new("Frame")
                local UICorner_3 = Instance.new("UICorner")
                local UICorner_4 = Instance.new("UICorner")
    
                Slider.Name = "Slider"
                Slider.Parent = ScrollTab
                Slider.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
                Slider.Size = UDim2.new(0, 455, 0, 40)
    
                UICorner.CornerRadius = UDim.new(0, 5)
                UICorner.Parent = Slider
    
                SliderTitle.Name = "SliderTitle"
                SliderTitle.Parent = Slider
                SliderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderTitle.BackgroundTransparency = 1.000
                SliderTitle.Position = UDim2.new(0.0283286124, 0, 0, 0)
                SliderTitle.Size = UDim2.new(0, 290, 0, 20)
                SliderTitle.Font = Enum.Font.Gotham
                SliderTitle.Text = text
                SliderTitle.TextColor3 = Color3.fromRGB(225, 225, 225)
                SliderTitle.TextSize = 11.000
                SliderTitle.TextXAlignment = Enum.TextXAlignment.Left
    
                SliderValue.Name = "SliderValue"
                SliderValue.Parent = Slider
                SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderValue.BackgroundTransparency = 1.000
                SliderValue.Position = UDim2.new(0.887778878, 0, 0, 0)
                SliderValue.Size = UDim2.new(0, 40, 0, 20)
                SliderValue.Font = Enum.Font.Gotham
                SliderValue.Text =  tostring(set and math.floor( (set / max) * (max - min) + min) or 0)
                SliderValue.TextColor3 = Color3.fromRGB(225, 225, 225)
                SliderValue.TextSize = 11.000
    
                SliderButton.Name = "SliderButton"
                SliderButton.Parent = Slider
                SliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderButton.BackgroundTransparency = 1.000
                SliderButton.Position = UDim2.new(0, 10, 0, 25)
                SliderButton.Size = UDim2.new(0, 435, 0, 5)
                SliderButton.AutoButtonColor = false
                SliderButton.Font = Enum.Font.SourceSans
                SliderButton.Text = ""
                SliderButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                SliderButton.TextSize = 14.000
    
                Bar1.Name = "Bar1"
                Bar1.Parent = SliderButton
                Bar1.BackgroundColor3 = Color3.fromRGB(30, 28, 39)
                Bar1.Size = UDim2.new(0, 435, 0, 5)
    
                Bar.Name = "Bar"
                Bar.Parent = Bar1
                Bar.BackgroundColor3 = Color3.fromRGB(255,0,0)
                Bar.Size = UDim2.new(set/max, 0, 0, 5)
    
                UICorner_2.CornerRadius = UDim.new(0, 100)
                UICorner_2.Parent = Bar
    
                CircleBar.Name = "CircleBar"
                CircleBar.Parent = Bar
                CircleBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                CircleBar.Position = UDim2.new(1, -2, 0, -2)
                CircleBar.AnchorPoint = Vector2.new(0, 0.1)
                CircleBar.Size = UDim2.new(0, 10, 0, 10)
    
                UICorner_3.CornerRadius = UDim.new(0, 100)
                UICorner_3.Parent = CircleBar
    
                UICorner_4.CornerRadius = UDim.new(0, 100)
                UICorner_4.Parent = Bar1
                
                local mouse = game.Players.LocalPlayer:GetMouse()
                local uis = game:GetService("UserInputService")
    
                if Value == nil then
                    Value = set
                    pcall(function()
                        callback(Value)
                    end)
                end
                
                SliderButton.MouseButton1Down:Connect(function()
                    Value = math.floor((((tonumber(max) - tonumber(min)) / 435) * Bar.AbsoluteSize.X) + tonumber(min)) or 0
                    pcall(function()
                        callback(Value)
                    end)
                    Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, 435), 0, 5)
                    CircleBar.Position = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X - 2, 0, 425), 0, -2)
                    moveconnection = mouse.Move:Connect(function()
                        SliderValue.Text = Value
                        Value = math.floor((((tonumber(max) - tonumber(min)) / 435) * Bar.AbsoluteSize.X) + tonumber(min))
                        pcall(function()
                            callback(Value)
                        end)
                        Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, 435), 0, 5)
                        CircleBar.Position = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X - 2, 0, 425), 0, -2)
                    end)
                    releaseconnection = uis.InputEnded:Connect(function(Mouse)
                        if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                            Value = math.floor((((tonumber(max) - tonumber(min)) / 435) * Bar.AbsoluteSize.X) + tonumber(min))
                            pcall(function()
                                callback(Value)
                            end)
                            Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, 435), 0, 5)
                            CircleBar.Position = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X - 2, 0, 425), 0, -2)
                            moveconnection:Disconnect()
                            releaseconnection:Disconnect()
                        end
                    end)
                end)
                releaseconnection = uis.InputEnded:Connect(function(Mouse)
                    if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                        Value = math.floor((((tonumber(max) - tonumber(min)) / 435) * Bar.AbsoluteSize.X) + tonumber(min))
                        SliderValue.Text = Value
                    end
                end)
            end
            function main:AddSeperator(text)
                local Seperator = Instance.new("Frame")
                local Sep1 = Instance.new("Frame")
                local SepLabel = Instance.new("TextLabel")
                local Sep2 = Instance.new("Frame")
    
                Seperator.Name = "Seperator"
                Seperator.Parent = ScrollTab
                Seperator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Seperator.BackgroundTransparency = 1.000
                Seperator.ClipsDescendants = true
                Seperator.Size = UDim2.new(0, 455, 0, 20)
    
                Sep1.Name = "Sep1"
                Sep1.Parent = Seperator
                Sep1.BackgroundColor3 = Color3.fromRGB(255,0,0)
                Sep1.BorderSizePixel = 0
                Sep1.Position = UDim2.new(0, 0, 0, 10)
                Sep1.Size = UDim2.new(0, 150, 0, 1)
    
                SepLabel.Name = "SepLabel"
                SepLabel.Parent = Seperator
                SepLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SepLabel.BackgroundTransparency = 1.000
                SepLabel.Position = UDim2.new(0, 95, 0, 0)
                SepLabel.Size = UDim2.new(0, 255, 0, 20)
                SepLabel.Font = Enum.Font.Gotham
                SepLabel.Text = text
                SepLabel.TextColor3 = Color3.fromRGB(225,225,225)
                SepLabel.TextSize = 11.000
    
                Sep2.Name = "Sep2"
                Sep2.Parent = Seperator
                Sep2.BackgroundColor3 = Color3.fromRGB(255,0,0)
                Sep2.BorderSizePixel = 0
                Sep2.Position = UDim2.new(0, 305, 0, 10)
                Sep2.Size = UDim2.new(0, 150, 0, 1)
            end
            function main:AddLine()
                local Line = Instance.new("Frame")
                local Linee = Instance.new("Frame")
    
                Line.Name = "Line"
                Line.Parent = ScrollTab
                Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Line.BackgroundTransparency = 1.000
                Line.ClipsDescendants = true
                Line.Size = UDim2.new(0, 455, 0, 20)
    
                Linee.Name = "Linee"
                Linee.Parent = Line
                Linee.BackgroundColor3 = Color3.fromRGB(255,0,0)
                Linee.BorderSizePixel = 0
                Linee.Position = UDim2.new(0, 0, 0, 10)
                Linee.Size = UDim2.new(0, 455, 0, 1)
            end
            function main:AddLabel(text)
                local Label = Instance.new("TextLabel")
                local PaddingLabel = Instance.new("UIPadding")
                local labell = {}
        
                Label.Name = "Label"
                Label.Parent = ScrollTab
                Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Label.BackgroundTransparency = 1.000
                Label.Size = UDim2.new(0, 455, 0, 20)
                Label.Font = Enum.Font.Gotham
                Label.TextColor3 = Color3.fromRGB(225, 225, 225)
                Label.TextSize = 11.000
                Label.Text = text
                Label.TextXAlignment = Enum.TextXAlignment.Left
    
                PaddingLabel.PaddingLeft = UDim.new(0,10)
                PaddingLabel.Parent = Label
                PaddingLabel.Name = "PaddingLabel"
        
                function labell:Set(newtext)
                    Label.Text = newtext
                end
    
                return labell
            end
            
            return main
        end
        return uitab
    end





   
   
    local SOMEXHUB = library:AddWindow("K_Now X|Race V.4 ",Enum.KeyCode.RightControl)
    -----------------    -----------------    ----------------- -----------------    -----------------    -----------------  
    local u = SOMEXHUB:AddTab("เกี่ยวกับการอัพเดต","6026568198")
    local Main = SOMEXHUB:AddTab("วาร์ปไปที่ทำเผ่า","6026568198")
    local n = SOMEXHUB:AddTab("วาร์ป เร็ว","6026568198")
    local tx = SOMEXHUB:AddTab("ผ่านด่านทำเผ่า","7251993295")
    local rn = SOMEXHUB:AddTab("อื่นๆ","6034900727")
    local er = SOMEXHUB:AddTab("อื่นๆสำหรับเผ่า 4","6034900727")
    
    
    -----------------    -----------------    -----------------    -----------------    -----------------    -----------------  
    
u:AddSeperator("Update 1")
u:AddLabel("-Add NewTap ")
u:AddLabel("-FixBug(Kill aura) ")
u:AddLabel("-Update Anti Lag/Cpuclock ")
u:AddLabel("-Fix Human TP")
u:AddSeperator("Update 2")
u:AddLabel("-Fix Lag In Dungeon")
u:AddLabel("-Update Performance Graphics ")
u:AddSeperator("Update 3")
u:AddLabel("-Fix Bug (ไม่มีฟังชั่น)")
u:AddLabel("-Upgrade Human Tp Fast!!")
u:AddLabel("-Add ออโต้หาเกาะลับ in อื่นๆ")
u:AddLabel("-Add วาร์ปหาเกียร์ in อื่นๆ")
u:AddLabel("-Fix/Update Performance/AntiLag(30%)")

-----update------
    Main:AddSeperator("Main")
    
    Time = Main:AddLabel("Server Time")
    
    function UpdateTime()
        local GameTime = math.floor(workspace.DistributedGameTime+0.5)
        local Hour = math.floor(GameTime/(60^2))%24
        local Minute = math.floor(GameTime/(60^1))%60
        local Second = math.floor(GameTime/(60^0))%60
        Time:Set("Hr(s) : "..Hour.." Min(s) : "..Minute.." Sec(s) : "..Second)
    end
    
    spawn(function()
        while task.wait() do
            pcall(function()
                UpdateTime()
            end)
        end
    end)
    
    
    Main:AddLabel("วาร์ป")
        
    Main:AddButton("ไปที่ Temple of time",function()
      Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)
    end)
       Main:AddButton("ไปที่ คันโยก(ต้องอยู่ใน Temple)",function()
 Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28575.181640625, 14936.6279296875, 72.31636810302734)
    end)
           Main:AddButton("ไปที่ รับเควสหัวเเดง(ต้องอยู่ใน Temple)",function()
Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28981.552734375, 14888.4267578125, -120.245849609375)
    end)
        Main:AddLabel("ประตูเผ่า")
        
     Main:AddButton("ไปที่ ประตูเผ่าไซบอร์ก(ต้องอยู่ใน Temple)",function()
  Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28492.4140625, 14894.4267578125, -422.1100158691406)
    end)
           Main:AddButton("ไปที่ ประตูเผ่าปลา(ต้องอยู่ใน Temple)",function()
Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28224.056640625, 14889.4267578125, -210.5872039794922)
    end)
       Main:AddButton("ไปที่ ประตูเผ่ามิงค์(ต้องอยู่ใน Temple)",function()
Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(29020.66015625, 14889.4267578125, -379.2682800292969)
    end)
           Main:AddButton("ไปที่ ประตูเผ่ากูล(ต้องอยู่ใน Temple)",function()
Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28672.720703125, 14889.1279296875, 454.5961608886719)
    end)
               Main:AddButton("ไปที่ ประตูเผ่ามนุษย์(ต้องอยู่ใน Temple)",function()
        Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(29020.66015625, 14889.4267578125, -379.2682800292969)
        wait(0.5)
Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(29237.294921875, 14889.4267578125, -206.94955444335938)
    end)
            Main:AddButton("ไปที่ ประตูเผ่าสกาย(ต้องอยู่ใน Temple)",function()
Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28967.408203125, 14918.0751953125, 234.31198120117188)
    end)
    
            tx:AddLabel("ผ่านด่าน")
            
      tx:AddButton("ไปที่เส้นชัยเผ่าสกาย",function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Map.SkyTrial.Model.FinishPart.CFrame
    end)
      tx:AddButton("ไปที่เส้นชัยเผ่ามิ้งค์",function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.MinkTrial.Ceiling.CFrame * CFrame.new(0,-5,0)
    end)
     tx:AddButton("ไปที่ไม่โดนระเบิด เผ่าไซบอร์ก",function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,300,0)
    end)
        tx:AddToggle("Kill Aura สำหรับเผากูล,มนุษย์",_G.KillAura,function(value)
        _G.KillAura = value
    end)
    
    spawn(function()
  pcall(function() 
  while wait() do
       if _G.KillAura then
           for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
               if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                   pcall(function()
                       repeat wait()
                           sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                           v.Humanoid.Health = 0
                           v.HumanoidRootPart.CanCollide = false
                           v.HumanoidRootPart.Size = Vector3.new(80,80,80)
                           v.HumanoidRootPart.Transparency = 1
                       until not _G.KillAura or not v.Parent or v.Humanoid.Health <= 0
                   end)
               end
           end
       end
   end
  end)
end)

    n:AddSeperator("Tp")
    n:AddButton("Mansion",function()
     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
    end)
     n:AddButton("Npc Temple of time",function()
 Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2947.556884765625, 2281.630615234375, -7213.54931640625)
    end)
    
      rn:AddSeperator("Misc")
    Weapon = {}
    
    for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do  
        if v:IsA("Tool") then
            table.insert(Weapon ,v.Name)
        end
    end
    
    local SelectWeapona = rn:AddDropdown("Select Weapon",Weapon,function(value)
        _G.SelectWeapon = value
    end)
    
    rn:AddButton("Refresh Weapon",function()
        SelectWeapona:Clear()
        for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do  
            SelectWeapona:Add(v.Name)
        end
    end)
    
    
     rn:AddTextbox("Textbox", "Code", true, function(Value)
     end)

    
    _G.Main = 1
   rn:AddSlider("Select Main",1,100,1,function(value)
        _G.Main = value
    end)
    er:AddSeperator("บันไดนาฬิกา")
 er:AddToggle("ขึ้นบันไดโดยไม่วาร์ปกลับ",nil,function(value)
game.Players.LocalPlayer.Character.InfiniteStairs.Disabled = value
 game:GetService("Workspace").Map["Temple of Time"].DoNotEnter:Remove()
 game:GetService("Workspace").Map["Temple of Time"].ClockRoomExit:Remove()
 end)
    er:AddSeperator("แปลงร่างเผ่า 4(เเค่ อนิเมชั่น)")
    er:AddSeperator("หาเกาะ")
er:AddToggle("วาร์ปไปหาเกียร์ ",_G.putto,function(value)
        _G.putto = value
    end)
    
    spawn(function()
  pcall(function() 
  while wait() do
       if _G.putto then
TP(game:GetService("Workspace").Map.MysticIsland:FindFirstChildOfClass("MeshPart").CFrame)
end)
tx:AddToggle("ออโต้หาเกาะลับ (ไม่ย้ายเซิฟ)",_G.k,function(value)
        _G.k = value
    end)
    
    spawn(function()
  pcall(function() 
  while wait() do
       if _G.k then
game:GetService("VirtualInputManager"):SendKeyEvent(true,"W",false,game)
end
end)