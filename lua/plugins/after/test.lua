-- From the instruction on this repo
local dap_install = require("dap-install")
dap_install.config("jsnode", {})

-- From github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#Javascript
local dap = require("dap")

dap.configurations.typescript = {
  {
    name = 'Launch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
    outFiles = {"${workspaceFolder}/build/**/*.js"},
  },
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processId = require'dap.utils'.pick_process,
  },
}
