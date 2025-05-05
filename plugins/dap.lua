return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
      "williamboman/mason.nvim",
      "ldelossa/nvim-dap-projects",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()

      require("nvim-dap-virtual-text").setup({
        display_callback = function(variable)
          local name = string.lower(variable.name)
          local value = string.lower(variable.value)
          if name:match("secret") or name:match("api") or value:match("secret") or value:match("api") then
            return "*****"
          end
          if #variable.value > 15 then
            return " " .. string.sub(variable.value, 1, 15) .. "... "
          end
          return " " .. variable.value
        end,
      })

      require("nvim-dap-projects").search_project_config()

      -- Adaptador node2 (via node-debug2-adapter do Mason)
      dap.adapters.node2 = {
        type = "executable",
        command = "node",
        args = {
          vim.fn.stdpath("data") .. "/mason/packages/node-debug2-adapter/out/src/nodeDebug.js",
        },
      }

      -- Configuração padrão para NestJS (caso não tenha launch.json)
      for _, language in ipairs({ "typescript", "javascript" }) do
        dap.configurations[language] = {
          {
            name = "NestJS (ts-node)",
            type = "node2",
            request = "launch",
            program = "${workspaceFolder}/src/main.ts",
            cwd = "${workspaceFolder}",
            runtimeExecutable = "ts-node",
            runtimeArgs = { "--esm" },
            sourceMaps = true,
            protocol = "inspector",
            console = "integratedTerminal",
            skipFiles = { "<node_internals>/**" },
          },
        }
      end

      -- Carregar launch.json do VSCode se existir
      local ok, vscode = pcall(require, "dap.ext.vscode")
      if ok then
        vscode.load_launchjs(nil, {
          node2 = { "javascript", "typescript" },
        })
      end

      -- Mapas de teclas
      vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
      vim.keymap.set("n", "<space>gb", dap.run_to_cursor)
      vim.keymap.set("n", "<space>?", function()
        dapui.eval(nil, { enter = true })
      end)
      vim.keymap.set("n", "<F1>", dap.continue)
      vim.keymap.set("n", "<F2>", dap.step_into)
      vim.keymap.set("n", "<F3>", dap.step_over)
      vim.keymap.set("n", "<F4>", dap.step_out)
      vim.keymap.set("n", "<F5>", dap.step_back)
      vim.keymap.set("n", "<F13>", dap.restart)

      -- UI automática
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },
}
