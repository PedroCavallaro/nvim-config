local dap = require("dap")

dap.adapters.node2 = {
  type = "executable",
  command = "node",
  args = {
    require("mason-registry").get_package("node-debug2-adapter"):get_install_path() .. "/out/src/nodeDebug.js",
  },
}

dap.configurations.typescript = {
  {
    name = "Launch file",
    type = "node2",
    request = "launch",
    program = "${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    console = "integratedTerminal",
  },
}
