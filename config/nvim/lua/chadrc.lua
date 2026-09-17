---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "jabuti",
  
  -- Жестко отключаем любые фоны для ключевых компонентов интерфейса NvChad
  hl_override = {
    Normal = { bg = "NONE" },
    NormalFloat = { bg = "NONE" },
    NvimTreeNormal = { bg = "NONE" },
    NvimTreeNormalNC = { bg = "NONE" },
    LineNr = { bg = "NONE", fg = "comment" },
    CursorLineNr = { bg = "NONE" },
    SignColumn = { bg = "NONE" },
    FoldColumn = { bg = "NONE" },
    WinSeparator = { bg = "NONE", fg = "comment" },
    EndOfBuffer = { bg = "NONE" },
    NonText = { bg = "NONE" },
    StatusLine = { bg = "NONE" },
    StatusLineNC = { bg = "NONE" },
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

M.nvdash = { load_on_startup = true }

-- Включаем общую прозрачность UI-компонентов NvChad
M.ui = {
  transparency = true,
}

return M
