--- open Alacritty
--[[
Hotkey like iTerm2

@setup
brew install --cask hammerspoon
curl https://gist.githubusercontent.com/asmagill/c38f75fff9d9ef43d1226329fc1436e4/raw/db28bfdd54bbd19a6c639b6f2664799d6407cf52/ctrlDoublePress.lua > ~/.hammerspoon/ctrlDoublePress.lua
pushd ~/Downloads;
git clone git@github.com:asmagill/hs._asm.spaces.git;
cd hs._asm.spaces;
PREFIX=~/src/dotfiles/home/.hammerspoon make install-universal;
popd;

@memo
hs.window < hs.space < hs.screen
window: アプリケーション毎のウィンドウ
space : ディスプレイ毎にあるワークスペース
screen: ディスプレイ(macbook本体, Dellのモニターなど)
--]]

local application = require("hs.application")
local spaces = require("hs.spaces")

local double_press = require("ctrlDoublePress")

local open_alacritty = function()
  local appName = "Alacritty"
  local app = application.get(appName)

  if app == nil then
    application.launchOrFocus(appName)
  elseif app:isFrontmost() then
    app:hide()
  else
    local app_window = app:focusedWindow()
    local focused_space = spaces.focusedSpace()
    spaces.moveWindowToSpace(app_window, focused_space)
    app:setFrontmost()
  end
end

double_press.timeFrame = 0.5
double_press.action = open_alacritty
