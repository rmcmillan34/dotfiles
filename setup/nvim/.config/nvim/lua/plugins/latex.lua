local function is_executable(bin)
  return vim.fn.executable(bin) == 1
end

local function select_viewer()
  if is_executable("zathura") then
    return { method = "zathura" }
  end

  local sysname = vim.loop.os_uname().sysname

  if sysname == "Darwin" then
    if is_executable("skim") then
      return { method = "skim" }
    end

    if is_executable("open") then
      return { method = "general", viewer = "open" }
    end
  elseif sysname:match("Windows") then
    if is_executable("SumatraPDF") then
      return { method = "general", viewer = "SumatraPDF" }
    end
  else
    if is_executable("sioyek") then
      return { method = "sioyek" }
    end

    if is_executable("okular") then
      return { method = "general", viewer = "okular" }
    end

    if is_executable("evince") then
      return { method = "general", viewer = "evince" }
    end
  end

  return { method = "general", viewer = "xdg-open" }
end

return {
  {
    "lervag/vimtex",
    ft = { "tex" },
    init = function()
      local viewer = select_viewer()
      vim.g.vimtex_view_method = viewer.method

      if viewer.viewer then
        vim.g.vimtex_view_general_viewer = viewer.viewer
      end

      vim.g.vimtex_compiler_method = "latexmk"
    end,
  },
}
