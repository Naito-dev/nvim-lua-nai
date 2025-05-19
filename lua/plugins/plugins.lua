local plugins = {}

-- caminho completo para a pasta plugins/
local plugin_dir = vim.fn.stdpath("config") .. "/lua/plugins"

-- pega todos os arquivos .lua na pasta plugins (exceto plugins.lua)
local plugin_files = vim.fn.globpath(plugin_dir, "*.lua", false, true)

for _, filepath in ipairs(plugin_files) do
  -- extrai o nome do arquivo (ex: "airline.lua" -> "airline")
  local filename = filepath:match("([^/]+)%.lua$")

  if filename ~= "plugins" then  -- ignora o arquivo atual plugins.lua para evitar recursão
    local ok, ret = pcall(require, "plugins." .. filename)
    if ok and type(ret) == "table" then
      for _, plugin in ipairs(ret) do
        table.insert(plugins, plugin)
      end
    else
      print("Erro carregando plugin: " .. filename)
    end
  end
end

return plugins

